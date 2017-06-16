/* --COPYRIGHT--,BSD
 * Copyright (c) 2012, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * --/COPYRIGHT--*/
//! \file   solutions/instaspin_foc/src/proj_lab05a.c
//! \brief Adjusting the FOC current controller
//!
//! (C) Copyright 2011, Texas Instruments, Inc.

//! \defgroup PROJ_LAB05a PROJ_LAB05a
//@{

//! \defgroup PROJ_LAB05a_OVERVIEW Project Overview
//!
//! Adjusting the supplied current controllers
//!

// **************************************************************************
// the includes

// system includes
#include <math.h>
#include "main.h"

//#include "uartstdio.h"

#ifdef FLASH
#pragma CODE_SECTION(mainISR,"ramfuncs");
#endif

// Include header files used in the main function


// **************************************************************************
// the defines

#define LED_BLINK_FREQ_Hz   5


// **************************************************************************
// the globals

uint_least16_t gCounter_updateGlobals = 0;
uint_least16_t gCounter_print = 0;
uint_least16_t gCounter_txdone = 0;
uint_least16_t gCounter_millis = 0;
uint_least32_t elapsedMillis = 0;

bool Flag_Latch_softwareUpdate = true;

CTRL_Handle ctrlHandle;

#ifdef CSM_ENABLE
#pragma DATA_SECTION(halHandle,"rom_accessed_data");
#endif
HAL_Handle halHandle;

#ifdef CSM_ENABLE
#pragma DATA_SECTION(gUserParams,"rom_accessed_data");
#endif
USER_Params gUserParams;

HAL_PwmData_t gPwmData = {_IQ(0.0), _IQ(0.0), _IQ(0.0)};

HAL_AdcData_t gAdcData;

_iq gMaxCurrentSlope = _IQ(0.0);

#ifdef FAST_ROM_V1p6
CTRL_Obj *controller_obj;
#else
#ifdef CSM_ENABLE
#pragma DATA_SECTION(ctrl,"rom_accessed_data");
#endif
CTRL_Obj ctrl;				//v1p7 format
#endif

uint16_t gLEDcnt = 0;

volatile MOTOR_Vars_t gMotorVars = MOTOR_Vars_INIT;

#ifdef FLASH
// Used for running BackGround in flash, and ISR in RAM
extern uint16_t *RamfuncsLoadStart, *RamfuncsLoadEnd, *RamfuncsRunStart;

#ifdef CSM_ENABLE
extern uint16_t *econst_start, *econst_end, *econst_ram_load;
extern uint16_t *switch_start, *switch_end, *switch_ram_load;
#endif
#endif


#ifdef DRV8301_SPI
// Watch window interface to the 8301 SPI
DRV_SPI_8301_Vars_t gDrvSpi8301Vars;
#endif

#ifdef DRV8305_SPI
// Watch window interface to the 8305 SPI
DRV_SPI_8305_Vars_t gDrvSpi8305Vars;
#endif

_iq gFlux_pu_to_Wb_sf;

_iq gFlux_pu_to_VpHz_sf;

_iq gTorque_Ls_Id_Iq_pu_to_Nm_sf;

_iq gTorque_Flux_Iq_pu_to_Nm_sf;

// **************************************************************************
// the functions

void main(void)
{
  uint_least8_t estNumber = 0;

#ifdef FAST_ROM_V1p6
  uint_least8_t ctrlNumber = 0;
#endif

  // Only used if running from FLASH
  // Note that the variable FLASH is defined by the project
  #ifdef FLASH
  // Copy time critical code and Flash setup code to RAM
  // The RamfuncsLoadStart, RamfuncsLoadEnd, and RamfuncsRunStart
  // symbols are created by the linker. Refer to the linker files.
  memCopy((uint16_t *)&RamfuncsLoadStart,(uint16_t *)&RamfuncsLoadEnd,(uint16_t *)&RamfuncsRunStart);

  #ifdef CSM_ENABLE
    //copy .econst to unsecure RAM
    if(*econst_end - *econst_start)
      {
        memCopy((uint16_t *)&econst_start,(uint16_t *)&econst_end,(uint16_t *)&econst_ram_load);
      }

    //copy .switch ot unsecure RAM
    if(*switch_end - *switch_start)
      {
        memCopy((uint16_t *)&switch_start,(uint16_t *)&switch_end,(uint16_t *)&switch_ram_load);
      }
  #endif
  #endif

  // initialize the hardware abstraction layer
  halHandle = HAL_init(&hal,sizeof(hal));


  // check for errors in user parameters
  USER_checkForErrors(&gUserParams);


  // store user parameter error in global variable
  gMotorVars.UserErrorCode = USER_getErrorCode(&gUserParams);


  // do not allow code execution if there is a user parameter error
  if(gMotorVars.UserErrorCode != USER_ErrorCode_NoError)
    {
      for(;;)
        {
          gMotorVars.Flag_enableSys = false;
        }
    }


  // initialize the user parameters
  USER_setParams(&gUserParams);


  // set the hardware abstraction layer parameters
  HAL_setParams(halHandle,&gUserParams);


  // initialize the controller
#ifdef FAST_ROM_V1p6
  ctrlHandle = CTRL_initCtrl(ctrlNumber, estNumber);  		//v1p6 format (06xF and 06xM devices)
  controller_obj = (CTRL_Obj *)ctrlHandle;
#else
  ctrlHandle = CTRL_initCtrl(estNumber,&ctrl,sizeof(ctrl));	//v1p7 format default
#endif


  {
    CTRL_Version version;

    // get the version number
    CTRL_getVersion(ctrlHandle,&version);

    gMotorVars.CtrlVersion = version;
  }


  // set the default controller parameters
  CTRL_setParams(ctrlHandle,&gUserParams);

  /*datalogHandle = DATALOG_init(&datalog,sizeof(datalog));

    datalog.iptr[0] = &gMotorVars.Speed_krpm;        // datalogBuff[0]
    datalog.iptr[1] = &gMotorVars.Iq_A;       // datalogBuff[1]
    datalog.iptr[2] = &gMotorVars.IqRef_A;       // datalogBuff[2]

    datalog.Flag_EnableLogData = true;
    datalog.Flag_EnableLogOneShot = false;*/


  // setup faults
  HAL_setupFaults(halHandle);


  // initialize the interrupt vector table
  HAL_initIntVectorTable(halHandle);


  // enable the ADC interrupts
  HAL_enableAdcInts(halHandle);

  // enable the Sci interrupts
  HAL_enableSciInts(halHandle);

  // enable global interrupts
  HAL_enableGlobalInts(halHandle);


  // enable debug interrupts
  HAL_enableDebugInt(halHandle);


  // disable the PWM
  HAL_disablePwm(halHandle);


#ifdef DRV8301_SPI
  // turn on the DRV8301 if present
  HAL_enableDrv(halHandle);
  // initialize the DRV8301 interface
  HAL_setupDrvSpi(halHandle,&gDrvSpi8301Vars);
#endif

#ifdef DRV8305_SPI
  // turn on the DRV8305 if present
  HAL_enableDrv(halHandle);
  // initialize the DRV8305 interface
  HAL_setupDrvSpi(halHandle,&gDrvSpi8305Vars);
#endif


  // enable DC bus compensation
  CTRL_setFlag_enableDcBusComp(ctrlHandle, true);


  // compute scaling factors for flux and torque calculations
  gFlux_pu_to_Wb_sf = USER_computeFlux_pu_to_Wb_sf();
  gFlux_pu_to_VpHz_sf = USER_computeFlux_pu_to_VpHz_sf();
  gTorque_Ls_Id_Iq_pu_to_Nm_sf = USER_computeTorque_Ls_Id_Iq_pu_to_Nm_sf();
  gTorque_Flux_Iq_pu_to_Nm_sf = USER_computeTorque_Flux_Iq_pu_to_Nm_sf();


  for(;;)
  {
    // Waiting for enable system flag to be set
    while(!(gMotorVars.Flag_enableSys));

    // Dis-able the Library internal PI.  Iq has no reference now
    CTRL_setFlag_enableSpeedCtrl(ctrlHandle, false);

    // loop while the enable system flag is true
    while(gMotorVars.Flag_enableSys)
      {
        CTRL_Obj *obj = (CTRL_Obj *)ctrlHandle;

        // increment counters
        gCounter_updateGlobals++;

        // enable/disable the use of motor parameters being loaded from user.h
        CTRL_setFlag_enableUserMotorParams(ctrlHandle,gMotorVars.Flag_enableUserParams);

        // enable/disable Rs recalibration during motor startup
        EST_setFlag_enableRsRecalc(obj->estHandle,gMotorVars.Flag_enableRsRecalc);

        // enable/disable automatic calculation of bias values
        CTRL_setFlag_enableOffset(ctrlHandle,gMotorVars.Flag_enableOffsetcalc);


        if(CTRL_isError(ctrlHandle))
          {
            // set the enable controller flag to false
            CTRL_setFlag_enableCtrl(ctrlHandle,false);

            // set the enable system flag to false
            gMotorVars.Flag_enableSys = false;

            // disable the PWM
            HAL_disablePwm(halHandle);
          }
        else
          {
            // update the controller state
            bool flag_ctrlStateChanged = CTRL_updateState(ctrlHandle);

            // enable or disable the control
            CTRL_setFlag_enableCtrl(ctrlHandle, gMotorVars.Flag_Run_Identify);

            if(flag_ctrlStateChanged)
              {
                CTRL_State_e ctrlState = CTRL_getState(ctrlHandle);

                if(ctrlState == CTRL_State_OffLine)
                  {
                    // enable the PWM
                    HAL_enablePwm(halHandle);
                  }
                else if(ctrlState == CTRL_State_OnLine)
                  {
                    if(gMotorVars.Flag_enableOffsetcalc == true)
                    {
                      // update the ADC bias values
                      HAL_updateAdcBias(halHandle);
                    }
                    else
                    {
                      // set the current bias
                      HAL_setBias(halHandle,HAL_SensorType_Current,0,_IQ(I_A_offset));
                      HAL_setBias(halHandle,HAL_SensorType_Current,1,_IQ(I_B_offset));
                      HAL_setBias(halHandle,HAL_SensorType_Current,2,_IQ(I_C_offset));

                      // set the voltage bias
                      HAL_setBias(halHandle,HAL_SensorType_Voltage,0,_IQ(V_A_offset));
                      HAL_setBias(halHandle,HAL_SensorType_Voltage,1,_IQ(V_B_offset));
                      HAL_setBias(halHandle,HAL_SensorType_Voltage,2,_IQ(V_C_offset));
                    }

                    // Return the bias value for currents
                    gMotorVars.I_bias.value[0] = HAL_getBias(halHandle,HAL_SensorType_Current,0);
                    gMotorVars.I_bias.value[1] = HAL_getBias(halHandle,HAL_SensorType_Current,1);
                    gMotorVars.I_bias.value[2] = HAL_getBias(halHandle,HAL_SensorType_Current,2);

                    // Return the bias value for voltages
                    gMotorVars.V_bias.value[0] = HAL_getBias(halHandle,HAL_SensorType_Voltage,0);
                    gMotorVars.V_bias.value[1] = HAL_getBias(halHandle,HAL_SensorType_Voltage,1);
                    gMotorVars.V_bias.value[2] = HAL_getBias(halHandle,HAL_SensorType_Voltage,2);

                    // enable the PWM
                    HAL_enablePwm(halHandle);
                  }
                else if(ctrlState == CTRL_State_Idle)
                  {
                    // disable the PWM
                    HAL_disablePwm(halHandle);
                    gMotorVars.Flag_Run_Identify = false;
                  }

                if((CTRL_getFlag_enableUserMotorParams(ctrlHandle) == true) &&
                  (ctrlState > CTRL_State_Idle) &&
                  (gMotorVars.CtrlVersion.minor == 6))
                  {
                    // call this function to fix 1p6
                    USER_softwareUpdate1p6(ctrlHandle);
                  }

              }
          }


        if(EST_isMotorIdentified(obj->estHandle))
          {
            // set the current ramp
            EST_setMaxCurrentSlope_pu(obj->estHandle,gMaxCurrentSlope);
            gMotorVars.Flag_MotorIdentified = true;


            if(Flag_Latch_softwareUpdate)
            {
              Flag_Latch_softwareUpdate = false;

              USER_calcPIgains(ctrlHandle);

              // initialize the watch window kp and ki current values with pre-calculated values
              gMotorVars.Kp_Idq = CTRL_getKp(ctrlHandle,CTRL_Type_PID_Id);
              gMotorVars.Ki_Idq = CTRL_getKi(ctrlHandle,CTRL_Type_PID_Id);
            }

          }
        else
          {
            Flag_Latch_softwareUpdate = true;

            // the estimator sets the maximum current slope during identification
            gMaxCurrentSlope = EST_getMaxCurrentSlope_pu(obj->estHandle);
          }


        // when appropriate, update the global variables
        if(gCounter_updateGlobals >= NUM_MAIN_TICKS_FOR_GLOBAL_VARIABLE_UPDATE)
          {
            // reset the counter
            gCounter_updateGlobals = 0;

            updateGlobalVariables_motor(ctrlHandle);

            /**/
          }

        // update Iq reference
        updateIqRef(ctrlHandle);

        // update Kp and Ki gains
        updateKpKiGains(ctrlHandle);

        // enable/disable the forced angle
        EST_setFlag_enableForceAngle(obj->estHandle,gMotorVars.Flag_enableForceAngle);

        // enable or disable power warp
        CTRL_setFlag_enablePowerWarp(ctrlHandle,gMotorVars.Flag_enablePowerWarp);

#ifdef DRV8301_SPI
        HAL_writeDrvData(halHandle,&gDrvSpi8301Vars);

        HAL_readDrvData(halHandle,&gDrvSpi8301Vars);
#endif
#ifdef DRV8305_SPI
        HAL_writeDrvData(halHandle,&gDrvSpi8305Vars);

        HAL_readDrvData(halHandle,&gDrvSpi8305Vars);
#endif
      } // end of while(gFlag_enableSys) loop


    // disable the PWM
    HAL_disablePwm(halHandle);

    // set the default controller parameters (Reset the control to re-identify the motor)
    CTRL_setParams(ctrlHandle,&gUserParams);
    gMotorVars.Flag_Run_Identify = false;

  } // end of for(;;) loop

} // end of main() function

//#define STEP_RES
//#define SINE_RES
#define START_RES  6000
#define LEN_RES    2000
#define END_RES    START_RES+LEN_RES

#define END_CONTROL_GAP 5000
#define END_CONTROL     END_CONTROL_GAP+END_RES

#define SINE_AMPL   (double)5.0

interrupt void mainISR(void)
{
    gCounter_millis++;
    if(gCounter_millis >= USER_ISR_FREQ_Hz / 1000) { // 1000 millis per second
        gCounter_millis = 0;
        elapsedMillis++;

        if(elapsedMillis>(START_RES+100)) gMotorVars.Flag_enableForceAngle = false;
#ifdef STEP_RES
        if(elapsedMillis>START_RES && elapsedMillis<END_RES) gMotorVars.IqRef_A = _IQ(15.0);
        else if(elapsedMillis>=END_RES) gMotorVars.IqRef_A = _IQ(0.0);
        if(elapsedMillis>=END_CONTROL) gMotorVars.Flag_Run_Identify = false;
#endif

#ifdef SINE_RES
        if(elapsedMillis>START_RES && elapsedMillis<END_RES) {
            gMotorVars.IqRef_A = _IQ(SINE_AMPL*sin((double)(elapsedMillis-START_RES)*(double)(elapsedMillis-START_RES+2500)/(double)1000000.0));
        }
        else if(elapsedMillis>=END_RES) gMotorVars.IqRef_A = _IQ(0.0);
        if(elapsedMillis>=END_CONTROL) gMotorVars.Flag_Run_Identify = false;
#endif
    }

  // toggle status LED
  if(++gLEDcnt >= (uint_least32_t)(USER_ISR_FREQ_Hz / LED_BLINK_FREQ_Hz))
  {
    HAL_toggleLed(halHandle,(GPIO_Number_e)HAL_Gpio_LED2);
    gLEDcnt = 0;
  }


  // acknowledge the ADC interrupt
  HAL_acqAdcInt(halHandle,ADC_IntNumber_1);


  // convert the ADC data
  HAL_readAdcData(halHandle,&gAdcData);


  // run the controller
  CTRL_run(ctrlHandle,halHandle,&gAdcData,&gPwmData);


  // write the PWM compare values
  HAL_writePwmData(halHandle,&gPwmData);


  // setup the controller
  CTRL_setup(ctrlHandle);

  //DATALOG_update(datalogHandle);
  gCounter_print++;
  if (gCounter_print >= USER_ISR_FREQ_Hz / USER_PRINT_FREQ_Hz)
    {
        gCounter_print = 0;
        //gMotorVars.IqRef_A = 0;
        if (gMotorVars.IqRef_A != 0)
        {
            char message[20]; // initialize a char array for the message
            //char currentMessage[15];
            _IQtoa(message, "%2.3f", gMotorVars.Speed_krpm); // put the variable into the char array as a string
            //_IQtoa(currentMessage, "%2.3f", gMotorVars.IqRef_A);
            //strcat(message, ",");
            //strcat(message, currentMessage);
            strcat(message, "\n"); // add line endings to the char array

            int i = 0;
            while (message[i] != '\0')
            { // queue each char
                enqueue(message[i]);
                i++;
            }
            SCI_putDataBlocking(halHandle->sciBHandle, dequeue()); // put the first char to start the flow
            // Blocking shouldn't actually block at this point of the program,
            // as long as the queue has been cleared
        }
    }

  return;
} // end of mainISR() function


#define QUEUE_SIZE 200
int qbegin=0, qend=0;
char queue[QUEUE_SIZE];
int empty() { return qbegin==qend; }
int full() { return ((qend+1)%QUEUE_SIZE)==qbegin; }
void enqueue(char c) {
    if (!full()) {
        queue[qend]=c; qend=(qend+1)%QUEUE_SIZE;
    }
}
char dequeue() {
    if (!empty()) {
        char out = queue[qbegin]; qbegin=(qbegin+1)%QUEUE_SIZE;
        return out;
    } else {
        return 0;
    }
}

#define QUEUE_SIZE_two 200
int qbegin_two=0, qend_two=0;
char queue_two[QUEUE_SIZE_two];
int empty_two() { return qbegin_two==qend_two; }
int full_two() { return ((qend_two+1)%QUEUE_SIZE_two)==qbegin_two; }
void enqueue_two(char c) {
    if (!full_two()) {
        queue_two[qend_two]=c; qend_two=(qend_two+1)%QUEUE_SIZE_two;
    }
}
char dequeue_two() {
    if (!empty_two()) {
        char out_two = queue_two[qbegin_two]; qbegin_two=(qbegin_two+1)%QUEUE_SIZE_two;
        return out_two;
    } else {
        return 0;
    }
}
int qlength_two() {
    if(qend_two<qbegin_two) return (QUEUE_SIZE_two - qbegin_two + qend_two);
    else return (qend_two-qbegin_two);
}

//! \brief the ISR for SCI-B receive interrupt
interrupt void sciBTxISR(void) {
    HAL_Obj *obj = (HAL_Obj *)halHandle;
    //success = SCI_putDataNonBlocking(halHandle->sciBHandle, dataRx);
    //gCounter_txdone++;
    char message = dequeue();
    if(message) SCI_putDataBlocking(halHandle->sciBHandle, message);
    // acknowledge interrupt from SCI group so that SCI interrupt
    // is not received twice
    PIE_clearInt(obj->pieHandle,PIE_GroupNumber_9);
} // end of sciBRxISR() function

//char recBuffer[100];
_iq bobby = 0.0;
char inputStr[20];
int inputLength = 0;

//! \brief the ISR for SCI-B receive interrupt
interrupt void sciBRxISR(void) {
    HAL_Obj *obj = (HAL_Obj *)halHandle;
    //success = SCI_putDataNonBlocking(halHandle->sciBHandle, dataRx);
    //gCounter_txdone++;
    uint16_t success;
    char dataRx[2];
    dataRx[0] = SCI_getDataNonBlocking(halHandle->sciBHandle, &success);
    //SCI_putDataBlocking(halHandle->sciBHandle, dataRx);
    if(dataRx[0] == 'a') {
        //gMotorVars.IqRef_A = _atoIQ(recBuffer);
        inputLength = qlength_two();
        int i = 0;
        while(1) {
            char deq = dequeue_two();
            if(deq) inputStr[i] = deq;
            else break;
            i++;
        }
        dequeue_two();
        dequeue_two();
        inputStr[i] = 0;
        gMotorVars.IqRef_A = _atoIQ(inputStr);
        /*int i = 0;
        while (recBuffer[i] != '\0')
        { // queue each char
            enqueue(recBuffer[i]);
            i++;
        }
        SCI_putDataBlocking(halHandle->sciBHandle, dequeue()); // put the first char to start the flow*/
        //recBuffer[0] = '\0';
        //SCI_putDataBlocking(halHandle->sciBHandle, 'W');
    }
    else if(dataRx[0] && dataRx[0]>32) {
        enqueue_two(dataRx[0]);
    }

    // acknowledge interrupt from SCI group so that SCI interrupt
    // is not received twice
    PIE_clearInt(obj->pieHandle,PIE_GroupNumber_9);
} // end of sciBRxISR() function

void updateGlobalVariables_motor(CTRL_Handle handle)
{
  CTRL_Obj *obj = (CTRL_Obj *)handle;

  // get the speed estimate
  gMotorVars.Speed_krpm = EST_getSpeed_krpm(obj->estHandle);

  // get the real time speed reference coming out of the speed trajectory generator
  gMotorVars.SpeedTraj_krpm = _IQmpy(CTRL_getSpd_int_ref_pu(handle),EST_get_pu_to_krpm_sf(obj->estHandle));

  // get the torque estimate
  gMotorVars.Torque_Nm = USER_computeTorque_Nm(handle, gTorque_Flux_Iq_pu_to_Nm_sf, gTorque_Ls_Id_Iq_pu_to_Nm_sf);

  // get the magnetizing current
  gMotorVars.MagnCurr_A = EST_getIdRated(obj->estHandle);

  // get the rotor resistance
  gMotorVars.Rr_Ohm = EST_getRr_Ohm(obj->estHandle);

  // get the stator resistance
  gMotorVars.Rs_Ohm = EST_getRs_Ohm(obj->estHandle);

  // get the stator inductance in the direct coordinate direction
  gMotorVars.Lsd_H = EST_getLs_d_H(obj->estHandle);

  // get the stator inductance in the quadrature coordinate direction
  gMotorVars.Lsq_H = EST_getLs_q_H(obj->estHandle);

  // get the flux in V/Hz in floating point
  gMotorVars.Flux_VpHz = EST_getFlux_VpHz(obj->estHandle);

  // get the flux in Wb in fixed point
  gMotorVars.Flux_Wb = USER_computeFlux(handle, gFlux_pu_to_Wb_sf);

  // get the controller state
  gMotorVars.CtrlState = CTRL_getState(handle);

  // get the estimator state
  gMotorVars.EstState = EST_getState(obj->estHandle);

  // read Vd and Vq vectors per units
  gMotorVars.Vd = CTRL_getVd_out_pu(ctrlHandle);
  gMotorVars.Vq = CTRL_getVq_out_pu(ctrlHandle);

  // calculate vector Vs in per units
  gMotorVars.Vs = _IQsqrt(_IQmpy(gMotorVars.Vd, gMotorVars.Vd) + _IQmpy(gMotorVars.Vq, gMotorVars.Vq));

  // read Id and Iq vectors in amps
  gMotorVars.Id_A = _IQmpy(CTRL_getId_in_pu(ctrlHandle), _IQ(USER_IQ_FULL_SCALE_CURRENT_A));
  gMotorVars.Iq_A = _IQmpy(CTRL_getIq_in_pu(ctrlHandle), _IQ(USER_IQ_FULL_SCALE_CURRENT_A));

  // calculate vector Is in amps
  gMotorVars.Is_A = _IQsqrt(_IQmpy(gMotorVars.Id_A, gMotorVars.Id_A) + _IQmpy(gMotorVars.Iq_A, gMotorVars.Iq_A));

  // Get the DC buss voltage
  gMotorVars.VdcBus_kV = _IQmpy(gAdcData.dcBus,_IQ(USER_IQ_FULL_SCALE_VOLTAGE_V/1000.0));

  return;
} // end of updateGlobalVariables_motor() function


void updateIqRef(CTRL_Handle handle)
{
  _iq iq_ref = _IQmpy(gMotorVars.IqRef_A,_IQ(1.0/USER_IQ_FULL_SCALE_CURRENT_A));

  // set the speed reference so that the forced angle rotates in the correct direction for startup
  if(_IQabs(gMotorVars.Speed_krpm) < _IQ(0.01))
    {
      if(iq_ref < _IQ(0.0))
        {
          CTRL_setSpd_ref_krpm(handle,_IQ(-0.01));
        }
      else if(iq_ref > _IQ(0.0))
        {
          CTRL_setSpd_ref_krpm(handle,_IQ(0.01));
        }
    }

  // Set the Iq reference that use to come out of the PI speed control
  CTRL_setIq_ref_pu(handle, iq_ref);

  return;
} // end of updateIqRef() function


void updateKpKiGains(CTRL_Handle handle)
{
  if((gMotorVars.CtrlState == CTRL_State_OnLine) && (gMotorVars.Flag_MotorIdentified == true) && (Flag_Latch_softwareUpdate == false))
    {
      // set the kp and ki current values for Id and Iq from the watch window
      CTRL_setKp(handle,CTRL_Type_PID_Id,gMotorVars.Kp_Idq);
      CTRL_setKi(handle,CTRL_Type_PID_Id,gMotorVars.Ki_Idq);
      CTRL_setKp(handle,CTRL_Type_PID_Iq,gMotorVars.Kp_Idq);
      CTRL_setKi(handle,CTRL_Type_PID_Iq,gMotorVars.Ki_Idq);
	}

  return;
} // end of updateKpKiGains() function


//@} //defgroup
// end of file



