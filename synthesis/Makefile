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
	-\rm arbiter.dcopt.out
	-\rm arbiter.dcopt.v
	-\rm arbiter.dcopt.area
	-\rm arbiter.dcopt.constraints
	-\rm arbiter.dcopt.ddc
	-\rm arbiter.dcopt.fullpaths
	-\rm arbiter.dcopt.paths
	-\rm arbiter.dcopt.power
	-\rm arbiter.dcopt.sdc
	-\rm arbiter.dcopt.sdf
	-\rm arbiter.dcopt.svf
	-\rm arbiter.dcopt.vsdc
	-\rm arbiter.rtlopt.out
	-\rm arbiter.rtlopt.ddc
	-\rm arbiter.rtlopt.sdc
	-\rm arbiter.rtlopt.v
	-\rm arbiter.spef
	-\rm command.log
	-\rm default.svf
	-\rm -rf ./../pnr
	-\rm -rf test

py_compile:
	mkdir test
	-\python3 goldenmodel/goldenmodel.py > test/GoldenResult

vcheck:
	./arbiter.rtlopt.csh
	-\grep -s 'Warning\|Error' arbiter.rtlopt.out
#	-\grep -s -h "Error" arbiter.rtlopt.out

syn:
	mkdir ./../pnr
	mkdir ./../pnr/design_files
	./arbiter.dcopt.csh
	-\grep 'Warning\|Error' arbiter.dcopt.out
#	-\grep Error arbiter.dcopt.out
	tail arbiter.dcopt.constraints

sim:
	vlog arbiter.dcopt.v
	vlog /uusoc/facility/cad_common/Artisan/GF/cmos65g/aci/sc-adv12/verilog/cmos10sfrvt_a12_neg.v
	vsim -c -sdftyp /arbiter=arbiter.dcopt.sdf -t ps -do arbiter.do work.arbiter

validate:
	diff -c test/GoldenResult test/VerilogResult
