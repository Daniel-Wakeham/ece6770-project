#!/bin/csh -fb

############################################################
# This runs design compiler and creates the constraint files


### Script variable settings
## design compiler command - may need to run "setup-synopsys" first:
set inncmd  = "innovus"
## design definitions
# note that csh variables do not get imported into dc_shell :-(
set design = "arbiter"	# this should be the top level name of your design
set tool   = "pnr"

### Execute script

# clean up result log
rm -f $design.$tool.out

# Tool command
$inncmd -files $design.$tool.tcl >& $design.$tool.out

############################################################
