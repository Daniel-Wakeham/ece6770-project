########################################
# Makefile_syn
########################################

all: py_compile vcheck syn sim validate

clean:
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
	-\rm -rf ./../pnr/design_files
	-\rm -rf test
	-\rm -rf work
	-\rm vsim.wlf
	-\rm transcript
	
py_compile:
	mkdir test
	-\python3 goldenmodel/goldenmodel.py > test/GoldenResult

vcheck:
	./arbiter.rtlopt.csh
	-\grep -s 'Warning\|Error' arbiter.rtlopt.out

syn:
	mkdir ./../pnr/design_files
	./arbiter.dcopt.csh
	-\grep 'Warning\|Error' arbiter.dcopt.out
	tail arbiter.dcopt.constraints

sim:
	vlog arbiter.dcopt.v
	vlog /uusoc/facility/cad_common/Artisan/GF/cmos65g/aci/sc-adv12/verilog/cmos10sfrvt_a12_neg.v
	vsim -c -sdftyp /arbiter=arbiter.dcopt.sdf -t ps -do arbiter.do work.arbiter

validate:
	diff -c test/GoldenResult test/VerilogResult
