################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
CodeStartBranch.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/cpu/src/32b/f28x/f2806x/CodeStartBranch.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="CodeStartBranch.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

adc.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/adc/src/32b/f28x/f2806x/adc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="adc.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

clarke.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/clarke/src/32b/clarke.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="clarke.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

clk.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/clk/src/32b/f28x/f2806x/clk.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="clk.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

cpu.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/cpu/src/32b/f28x/f2806x/cpu.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="cpu.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

ctrl.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/ctrl/src/32b/ctrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="ctrl.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

datalog.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/datalog/src/32b/datalog.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="datalog.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

drv8305.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/drvic/drv8305/src/32b/f28x/f2806x/drv8305.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="drv8305.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

filter_fo.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/filter/src/32b/filter_fo.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="filter_fo.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

flash.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/flash/src/32b/f28x/f2806x/flash.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="flash.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

gpio.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/gpio/src/32b/f28x/f2806x/gpio.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="gpio.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

hal.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/hal.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="hal.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

ipark.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/ipark/src/32b/ipark.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="ipark.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

memCopy.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/memCopy/src/memCopy.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="memCopy.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

offset.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/offset/src/32b/offset.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="offset.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

osc.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/osc/src/32b/f28x/f2806x/osc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="osc.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

park.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/park/src/32b/park.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="park.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

pid.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/pid/src/32b/pid.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="pid.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

pie.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/pie/src/32b/f28x/f2806x/pie.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="pie.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

pll.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/pll/src/32b/f28x/f2806x/pll.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="pll.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj_lab05a.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/src/proj_lab05a.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="proj_lab05a.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

pwm.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/pwm/src/32b/f28x/f2806x/pwm.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="pwm.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

pwr.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/pwr/src/32b/f28x/f2806x/pwr.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="pwr.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

sci.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/sci/src/32b/f28x/f2806x/sci.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="sci.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

spi.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/spi/src/32b/f28x/f2806x/spi.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="spi.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

svgen.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/svgen/src/32b/svgen.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="svgen.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

timer.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/timer/src/32b/f28x/f2806x/timer.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="timer.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

traj.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/traj/src/32b/traj.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="traj.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

uartstdio.obj: /Users/Kyle/ti/Controlsuite\ part/f2806x/v151/MWare/utils/uartstdio.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="uartstdio.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

usDelay.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/usDelay/src/32b/f28x/usDelay.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="usDelay.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

user.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/user/src/32b/user.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="user.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

wdog.obj: /Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/drivers/wdog/src/32b/f28x/f2806x/wdog.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt -O2 --include_path="/Users/Kyle/ti/Controlsuite part/f2806x/v151/MWare" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/modules/hal/boards/boostxldrv8305_revA/f28x/f2806x/src/" --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18/sw/solutions/instaspin_foc/boards/boostxldrv8305_revA/f28x/f2806xF/src" --include_path="/Users/Kyle/ti/motorware/motorware_1_01_00_18" -g --define=FAST_ROM_V1p6 --define=FLASH --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="wdog.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


