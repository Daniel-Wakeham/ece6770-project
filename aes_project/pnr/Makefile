########################################
# Makefile_pnr
########################################

all:
	./aes.pnr.csh
	-\grep 'Warning\|Error' aes.pnr.out

clean:
	find . -name "innovus.*" -delete
	-\rm -rf reports
	-\rm aes.pnr.out