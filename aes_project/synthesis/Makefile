########################################
# Makefile_syn
########################################

all: vcheck syn

clean:
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
	-\rm -rf work
	-\rm transcript

vcheck:
	./aes.rtlopt.csh
	-\grep -s 'Warning\|Error' aes.rtlopt.out

syn:
	mkdir ./../pnr/design_files
	./aes.dcopt.csh
	-\grep 'Warning\|Error' aes.dcopt.out
	tail aes.dcopt.constraints