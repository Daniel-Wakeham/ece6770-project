


# Import Design
set design_netlisttype verilog
set init_verilog ./design_files/aes.dcopt.v
set init_design_set_top 1
set init_top_cell "aes"

set init_lef_file /home/ece6770/proj/innovus_files/cmos10sfrvt_a12_macros.lef


set init_pwr_net vdd!
set init_gnd_net vss!

set init_mmmc_file ./mmmc.tcl
init_design


# Floorplanning
setDrawView fplan
#set FPlanRowSpacingAndType $rowgap 1
floorplan -r 0.5 0.7 12 12  12 12

# Pwr Rings
addRing -nets {vdd! vss!} \
    -type core_rings      \
    -around user_defined  \
    -center 1             \
    -spacing 1.8          \
    -width 4.6            \
    -offset 0        \
    -threshold auto       \
    -layer {bottom BD top BD right LB left LB}

# add strip vertical
addStripe -nets {vdd! vss!} \
    -direction vertical     \
    -layer LB               \
    -width 4.8              \
    -spacing 1.8            \
    -xleft_offset 80        \
    -set_to_set_distance 132 \
    -block_ring_top_layer_limit LB \
    -block_ring_bottom_layer_limit M1 \
    -padcore_ring_bottom_layer_limit M1 \
    -padcore_ring_top_layer_limit LB \
    -stacked_via_top_layer LB \
    -stacked_via_bottom_layer M1 \
    -merge_stripes_value 10 \
    -max_same_layer_jog_length 2.0 \
    -snap_wire_center_to_grid Grid

# add strip horizonal
addStripe -nets {vdd! vss!} \
    -direction horizontal   \
    -layer BD               \
    -width 4.8              \
    -spacing 1.8            \
    -start_from top         \
    -start_offset 100       \
    -set_to_set_distance 165 \
    -block_ring_top_layer_limit LB \
    -block_ring_bottom_layer_limit M1 \
    -padcore_ring_bottom_layer_limit M1 \
    -padcore_ring_top_layer_limit LB \
    -stacked_via_top_layer LB \
    -stacked_via_bottom_layer M1 \
    -merge_stripes_value 10 \
    -max_same_layer_jog_length 2.0 \
    -snap_wire_center_to_grid Grid


## special routing 
sroute -connect {blockPin padPin padRing corePin floatingStripe} \
    -allowJogging true \
    -allowLayerChange true \
    -blockPin useLef \
    -targetViaLayerRange {M1 LB} 

## Pins
editPin -side TOP \
    -layer M3   \
    -fixedPin 1 \
    -spreadType Center \
    -spacing 15 \
    -pin {write_data[31] write_data[30] write_data[29] write_data[28] write_data[27] write_data[26] write_data[25] write_data[24] write_data[23] write_data[22]  write_data[21] write_data[20] write_data[19] write_data[18] write_data[17] write_data[16] write_data[15] write_data[14] write_data[13] write_data[12] write_data[11] write_data[10] write_data[9] write_data[8] write_data[7] write_data[6] write_data[5] write_data[4] write_data[3] write_data[2] write_data[1] write_data[0]}

editPin -side BOTTOM \
    -layer M3   \
    -fixedPin 1 \
    -spreadType Center \
    -spacing 15 \
    -pin {read_data[31] read_data[30] read_data[29]  read_data[28] read_data[27] read_data[26] read_data[25] read_data[24] read_data[23] read_data[22] read_data[21] read_data[20] read_data[19] read_data[18] read_data[17] read_data[16] read_data[15] read_data[14] read_data[13] read_data[12] read_data[11] read_data[10] read_data[9] read_data[8] read_data[7] read_data[6] read_data[5] read_data[4] read_data[3] read_data[2] read_data[1] read_data[0]}


editPin -side LEFT \
    -layer M3   \
    -fixedPin 1 \
    -spreadType Center \
    -spacing 15 \
    -pin {clk reset_n cs we address[7] address[6] address[5] address[4] address[3] address[2] address[1] address[0]}



## place
setPlaceMode -timingDriven true \
    -congEffort auto      \
    -ignoreScan true \
    -placeIoPins true \
    
placeDesign -noPrePlaceOpt
setDrawView place

## Timing Optimization
setOptMode -yieldEffort none \
    -effort high \
    -maxDensity 0.95 \
    -fixDRC true \
    -fixFanoutLoad true \
    -optimizeFF true \
    -simplifyNetlist false \
    -holdTargetSlack 0.0 \
    -setupTargetSlack 0.0 
clearClockDomains
setClockDomains -all
setOptMode -usefulSkew false 
optDesign -preCTS -drv \
    -outDir ./reports/preCTSOptTiming


## CTS

#createClockTreeSpec -output "arbiter.ctstch"
setCTSMode -routeGuide true
setCTSMode -routeCLKNet true 
clockDesign -outDir ./reports/cts

## NanoRoute 
globalDetailRoute

# Add Filler Cells
set fillerCells [list FILL1A12TR FILL2A12TR FILL4A12TR FILL8A12TR FILL16A12TR FIL32A12TR FILL64A12TR FILL128A12TR]
setFillerMode -corePrefix arbiter_FILL -core $fillerCells
addFiller -cell $fillerCells -prefix arbiterFILL -markFixed


# Verification
verifyConnectivity -type regular -error 50 -warning 50 -report ./reports/conn_regular.rpt
verifyConnectivity -type special -error 50 -warning 50 -report ./reports/conn_special.rpt
verifyGeometry -allowSameCellViols -noSameNet -noOverlap -report ./reports/geim.rpt

exit