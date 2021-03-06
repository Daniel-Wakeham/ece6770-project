### This is the script for optimizing the verilog


#----------------------------------------------------------------------#
#                        DESIGN DEFINITION                             #
#----------------------------------------------------------------------#


set design_name  arbiter
set design_dir   "./../rtl"


### EDIT $design_name.cstr.tcl for timing and other constraints!



############## technology files #########################
### can include multiple .db files in string.

### Utah
#set lib_name  "UofU_Digital_v1_2"
#set lib_db    "UofU_Digital_v1_2.db"
#set lib_dir   "/uusoc/facility/cad_common/local/Cadence/lib/UofU_Digital_v1_2/"
### set lib_pdb   physical db defs

## UWashington 130nm:
#set lib_name  "static184cg_1.5V_25C"
#set lib_db    "static184cg_1.5V_25C.db"
#set lib_dir   "/uusoc/facility/cad_common/local/Cadence/lib/cg_lib13_v096/"
##set lib_pdb   physical db defs

## Artisan 130nm:
#set lib_name  "typical"
#set lib_db    "typical.db"
#set lib_dir   "/uusoc/facility/cad_common/IBM/Artisan/8RF-1.2v/aci/sc-x/synopsys/"
#set lib_pdb   "bm13svt_8lm_2thick_3rf.pdb"

## Artisan 65nm:
set lib_name  "scadv12_cmos10sf_rvt_tt_1p0v_25c"
set lib_db    "scadv12_cmos10sf_rvt_tt_1p0v_25c.db"
set lib_dir   "/uusoc/facility/cad_common/Artisan/GF/cmos65g/aci/sc-adv12/synopsys"
##set lib_pdb



############# custom library files #############################
#set custom_cells ../lib/custom-cells.v
#set custom_seq   ../lib/custom-sequentials.v



################################################
#            DC configuration variables
# Milkyway related variables
set mw_design_library $design_name.mw
#set mw_power_net   VDD
#set mw_ground_net  VSS
set mw_logic1_net  VDD
set mw_logic0_net  VSS
set mw_power_port  VDD
set mw_ground_port VSS

# db and cache configuration
set cache_read  {}
set cache_write {}
set allow_newer_db_files       true
set write_compressed_db_files  true
set sh_source_uses_search_path true
#################################################


# Define checkpoint function
proc checkpoint {name} {
  echo "CPU-$name: [cputime -self -child]"
  echo "MEM-$name: [mem]"
  echo "CLK-$name: [clock seconds]"
}

#----------------------------------------------------------------------#
#                             DESIGN SETUP                             #
#----------------------------------------------------------------------#

set search_path [concat  . $design_dir $lib_dir $search_path]
set search_path "$search_path ${synopsys_root}/libraries/syn"
set search_path "$search_path ${synopsys_root}/dw/sim_ver"


################################################################
# DC library definitions
set local_link_library [list ]
set target_library $lib_db

set synthetic_library "dw_foundation.sldb"
set link_library [concat * $lib_db $synthetic_library]
if [info exists lib_pdb] {
    set physical_library $lib_pdb
} else {
    set physical_library [list ]
}

set symbol_library [list ]
################################################################


if [info exists dc_shell_mode] {
    set suppress_errors "$suppress_errors TRANS-1 TIM-111 TIM-164 OPT-109 UID-101 TIM-134 DDB-74"
}

checkpoint setup

#----------------------------------------------------------------------#
#                        READ VERILOG NETLIST                          #
#----------------------------------------------------------------------#
read_verilog -rtl $design_name.v
## Read custom library cells if any
if [info exists custom_cells] {
    read_verilog -rtl $custom_cells
}
if [info exists custom_seq] {
    read_verilog -rtl $custom_seq
}

# read in the design constraints
source $design_name.cstr.tcl

## analyze and elaborate only necessary for VHDL:
## use something like this:
#analyze -format vhdl -lib WORK [ list $design_name.v $custom_cells ]
#elaborate $design_name -lib WORK -update
#uniquify

checkpoint read

# current_design $design_name
# set_attribute event_delay_buf size_only true
report_attribute

#----------------------------------------------------------------------#
#                                 WRITE                                #
#----------------------------------------------------------------------#
current_design $design_name

link

write_sdc $design_name.rtlopt.sdc
write -format ddc -hierarchy -output $design_name.rtlopt.ddc

write -format verilog -hierarchy -output $design_name.rtlopt.v

checkpoint write

exit
