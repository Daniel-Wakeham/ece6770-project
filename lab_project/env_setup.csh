#!/bin/csh -f

echo RUNNING UofU standard setups ...

setenv DISPLAY "lnissrv4.eng.utah.edu:1003"

# Command aliases
alias vir 'virtuoso'
alias cp22 'cd /local/ssd/prj/bw/cad/bw22v0/rajath/'
alias ep180 'cd /local/ssd/prj/ep/cad/ep180tj/p0/work_libs/bindigan/cds'

##### Synopsys #######
source ~/setups/.synopsys_setup_uofu.sh

##### Cadence #######
source ~/setups/.cadence_setup_uofu.sh

##### Mentor #######
source ~/setups/.mentor_setup_uofu.sh
setenv MS_HOME $mentor_dir/modelsim2019.4/questasim/
set path=($path $MS_HOME/bin)

##### EMX #######
setenv INTSFTD_LICENSE_FILE 25280@chickasaw.eng.utah.edu

set uu_cad_path=( \
		/uusoc/facility/cad_common/local/bin/S17	\
		/uusoc/facility/cad_common/local/bin/F16	\
		/uusoc/facility/cad_common/local/bin/S16	\
		/uusoc/facility/cad_common/local/bin/F15	\
		/uusoc/facility/cad_common/local/bin/S15	\
		/uusoc/facility/cad_common/local/bin/F14	\
		/uusoc/facility/cad_common/local/bin/S14	\
		/uusoc/facility/cad_common/local/bin/F13	\
		/uusoc/facility/cad_common/local/bin/S13	\
		/uusoc/facility/cad_common/local/bin/F12	\
		/uusoc/facility/cad_common/local/bin/S12	\
		/uusoc/facility/cad_common/local/bin/F11	\
		/uusoc/facility/cad_common/local/bin/S11	\
		/uusoc/facility/cad_common/local/bin/F10	\
		/uusoc/facility/cad_common/local/bin/S10	\
		/uusoc/facility/cad_common/local/bin/F09	\
		/uusoc/facility/cad_common/local/bin/S09	\
		/uusoc/facility/cad_common/local/bin/F08	\
		/uusoc/facility/cad_common/local/bin/S08	\
		/uusoc/facility/cad_common/local/bin/F07	\
		/uusoc/facility/cad_common/local/bin/S07	\
		/uusoc/facility/cad_common/local/setups		\
		/uusoc/facility/cad_tools/Cadence/INNOVUS-F17/bin )

setenv LM_LICENSE_FILE /uusoc/facility/cad_tools/Mentor/common_license
#setenv LM_LICENSE_FILE /usr/local/vlsi/bin/modelsim10.5c/common_license

setenv CDS_LIC_FILE /uusoc/facility/cad_tools/Cadence/common_license
setenv INNOVUS /uusoc/facility/cad_tools/Cadence/INNOVUS-F17/bin
setenv SOC /uusoc/facility/cad_tools/Cadence/INNOVUS-S17

set path=($path $uu_cad_path)
