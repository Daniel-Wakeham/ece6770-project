########################################
# Only necessary for running MODELSIM:
# 
# In your shell (I use tcsh): you may need to define the license file
# before running make:
#
# setenv LM_LICENSE_FILE /uusoc/facility/cad_tools/Mentor/common_license
#

#MODELTECH_BIN=/uusoc/facility/cad_tools/Mentor/MSIM-S17/linux_x86_64
#CADTOOLS=/uusoc/facility/cad_common/local/bin/S17:/uusoc/facility/cad_common/local/bin/F16:/uusoc/facility/cad_common/local/bin/S16:/uusoc/facility/cad_common/local/bin/F15:/uusoc/facility/cad_common/local/bin/S15:/uusoc/facility/cad_common/local/bin/F14:/uusoc/facility/cad_common/local/bin/S14:/uusoc/facility/cad_common/local/bin/F13:/uusoc/facility/cad_common/local/bin/S13
# Add tools paths to PATH
#PATH=.:/usr/bin:/usr/ccs/bin:/usr/ucb:/usr/afsws/bin:/usr/afsws/etc:/bin:/usr/sbin:/usr/dt/bin:/uusoc/facility/cad_common/local/bin/:${CADTOOLS}:${MODELTECH_BIN}
#
########################################


all: clean py_compile vcheck syn sim validate

clean:
	echo ${path}
	-\rm test/GoldenResult
	-\rm test/VerilogResult
	-\rm goldenmodel/goldenmodel
	-\rm aes.dcopt.out
	-\rm aes.dcopt.v
	-\rm aes.dcopt.area
	-\rm aes.dcopt.constraints
	-\rm ae8.dcopt.ddc
	-\rm aes.dcopt.fullpaths
	-\rm aes.dcopt.paths
	-\rm aes.dcopt.power
	-\rm aes.dcopt.sdc
	-\rm aes.dcopt.sdf
	-\rm aes.dcopt.svf
	-\rm aes.dcopt.vsdc
	-\rm aes.rtlopt.out
	-\rm aes.rtlopt.ddc
	-\rm aes.rtlopt.sdc
	-\rm aes.rtlopt.v
	-\rm aes.spef
	-\rm command.log
	-\rm default.svf
	-\rm -rf ./../pnr/design_files
	-\rm -rf test

py_compile:
	mkdir test
	-\python3 goldenmodel/goldenmodel.py > test/GoldenResult

vcheck:
	./aes.rtlopt.csh
	-\grep -s 'Warning\|Error' aes.rtlopt.out

syn:
	rm -rf ./../pnr/design_files
	mkdir ./../pnr/design_files
	./aes.dcopt.csh
	-\grep 'Warning\|Error' aes.dcopt.out
	tail aes.dcopt.constraints

sim:
	vlog aes.dcopt.v
	vlog /uusoc/facility/cad_common/Artisan/GF/cmos65g/aci/sc-adv12/verilog/cmos10sfrvt_a12_neg.v
	vsim -c -sdftyp /aes_128=aes_128.dcopt.sdf -t ps -do aes_128.do work.aes_128

validate:
	diff -c test/GoldenResult test/VerilogResult
