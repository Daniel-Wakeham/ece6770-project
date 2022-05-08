########################################
# Makefile_pnr
########################################

all:
	./arbiter.pnr.csh
	-\grep 'Warning\|Error' arbiter.pnr.out

clean:
	find . -name "innovus.*" -delete
	-\rm -rf reports
	-\rm arbiter.pnr.out