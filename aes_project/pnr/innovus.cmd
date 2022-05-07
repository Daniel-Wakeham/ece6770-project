#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sat May  7 13:22:40 2022                
#                                                     
#######################################################

#@(#)CDS: Innovus v20.15-s105_1 (64bit) 07/27/2021 14:15 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.15-s105_1 NR210726-1341/20_15-UB (database version 18.20.554) {superthreading v2.14}
#@(#)CDS: AAE 20.15-s020 (64bit) 07/27/2021 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.15-s024_1 () Jul 23 2021 04:46:45 ( )
#@(#)CDS: SYNTECH 20.15-s012_1 () Jul 12 2021 23:29:38 ( )
#@(#)CDS: CPE v20.15-s071
#@(#)CDS: IQuantus/TQuantus 20.1.1-s460 (64bit) Fri Mar 5 18:46:16 PST 2021 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_verilog ./design_files/aes.dcopt.v
set init_top_cell aes
set init_lef_file /home/ece6770/proj/innovus_files/cmos10sfrvt_a12_macros.lef
set init_pwr_net vdd!
set init_gnd_net vss!
set init_mmmc_file ./mmmc.tcl
init_design
setDrawView fplan
floorPlan -r 0.5 0.7 12 12 12 12
addRing -nets {vdd! vss!} -type core_rings -around user_defined -center 1 -spacing 1.8 -width 4.6 -offset 0 -threshold auto -layer {bottom BD top BD right LB left LB}
addStripe -nets {vdd! vss!} -direction vertical -layer LB -width 4.8 -spacing 1.8 -xleft_offset 80 -set_to_set_distance 132 -block_ring_top_layer_limit LB -block_ring_bottom_layer_limit M1 -padcore_ring_bottom_layer_limit M1 -padcore_ring_top_layer_limit LB -stacked_via_top_layer LB -stacked_via_bottom_layer M1 -merge_stripes_value 10 -max_same_layer_jog_length 2.0 -snap_wire_center_to_grid Grid
addStripe -nets {vdd! vss!} -direction horizontal -layer BD -width 4.8 -spacing 1.8 -start_from top -start_offset 100 -set_to_set_distance 165 -block_ring_top_layer_limit LB -block_ring_bottom_layer_limit M1 -padcore_ring_bottom_layer_limit M1 -padcore_ring_top_layer_limit LB -stacked_via_top_layer LB -stacked_via_bottom_layer M1 -merge_stripes_value 10 -max_same_layer_jog_length 2.0 -snap_wire_center_to_grid Grid
sroute -connect {blockPin padPin padRing corePin floatingStripe} -allowJogging true -allowLayerChange true -blockPin useLef -targetViaLayerRange {M1 LB}
editPin -side TOP -layer M3 -fixedPin 1 -spreadType Center -spacing 15 -pin {write_data[31] write_data[30] write_data[29] write_data[28] write_data[27] write_data[26] write_data[25] write_data[24] write_data[23] write_data[22]  write_data[21] write_data[20] write_data[19] write_data[18] write_data[17] write_data[16] write_data[15] write_data[14] write_data[13] write_data[12] write_data[11] write_data[10] write_data[9] write_data[8] write_data[7] write_data[6] write_data[5] write_data[4] write_data[3] write_data[2] write_data[1] write_data[0]}
editPin -side BOTTOM -layer M3 -fixedPin 1 -spreadType Center -spacing 15 -pin {read_data[31] read_data[30] read_data[29]  read_data[28] read_data[27] read_data[26] read_data[25] read_data[24] read_data[23] read_data[22] read_data[21] read_data[20] read_data[19] read_data[18] read_data[17] read_data[16] read_data[15] read_data[14] read_data[13] read_data[12] read_data[11] read_data[10] read_data[9] read_data[8] read_data[7] read_data[6] read_data[5] read_data[4] read_data[3] read_data[2] read_data[1] read_data[0]}
editPin -side LEFT -layer M3 -fixedPin 1 -spreadType Center -spacing 15 -pin {clk reset_n cs we address[7] address[6] address[5] address[4] address[3] address[2] address[1] address[0]}
setPlaceMode -timingDriven true -congEffort auto -ignoreScan true -placeIoPins true
getPlaceMode -place_hierarchical_flow -quiet
report_message -start_cmd
getRouteMode -maxRouteLayer -quiet
getRouteMode -user -maxRouteLayer
getPlaceMode -place_global_place_io_pins -quiet
getPlaceMode -user -maxRouteLayer
getPlaceMode -quiet -adaptiveFlowMode
getPlaceMode -timingDriven -quiet
getPlaceMode -adaptive -quiet
getPlaceMode -relaxSoftBlockageMode -quiet
getPlaceMode -user -relaxSoftBlockageMode
getPlaceMode -ignoreScan -quiet
getPlaceMode -user -ignoreScan
getPlaceMode -repairPlace -quiet
getPlaceMode -user -repairPlace
getPlaceMode -inPlaceOptMode -quiet
getPlaceMode -quiet -bypassFlowEffortHighChecking
getDesignMode -quiet -siPrevention
getPlaceMode -exp_slack_driven -quiet
um::push_snapshot_stack
getDesignMode -quiet -flowEffort
getDesignMode -highSpeedCore -quiet
getPlaceMode -quiet -adaptive
set spgFlowInInitialPlace 1
getPlaceMode -sdpAlignment -quiet
getPlaceMode -softGuide -quiet
getPlaceMode -useSdpGroup -quiet
getPlaceMode -sdpAlignment -quiet
getPlaceMode -enableDbSaveAreaPadding -quiet
getPlaceMode -quiet -wireLenOptEffort
getPlaceMode -sdpPlace -quiet
getPlaceMode -exp_slack_driven -quiet
getPlaceMode -sdpPlace -quiet
getPlaceMode -groupHighLevelClkGate -quiet
setvar spgRptErrorForScanConnection 0
getPlaceMode -place_global_exp_allow_missing_scan_chain -quiet
getPlaceMode -place_check_library -quiet
getPlaceMode -trimView -quiet
getPlaceMode -expTrimOptBeforeTDGP -quiet
getPlaceMode -quiet -useNonTimingDeleteBufferTree
getPlaceMode -congEffort -quiet
getPlaceMode -relaxSoftBlockageMode -quiet
getPlaceMode -user -relaxSoftBlockageMode
getPlaceMode -ignoreScan -quiet
getPlaceMode -user -ignoreScan
getPlaceMode -repairPlace -quiet
getPlaceMode -user -repairPlace
getPlaceMode -congEffort -quiet
getPlaceMode -fp -quiet
getPlaceMode -timingDriven -quiet
getPlaceMode -user -timingDriven
getPlaceMode -fastFp -quiet
getPlaceMode -clusterMode -quiet
get_proto_model -type_match {flex_module flex_instgroup} -committed -name -tcl
getPlaceMode -inPlaceOptMode -quiet
getPlaceMode -quiet -bypassFlowEffortHighChecking
getPlaceMode -ultraCongEffortFlow -quiet
getPlaceMode -forceTiming -quiet
getPlaceMode -fp -quiet
getPlaceMode -fastfp -quiet
getPlaceMode -timingDriven -quiet
getPlaceMode -fp -quiet
getPlaceMode -fastfp -quiet
getPlaceMode -powerDriven -quiet
getExtractRCMode -quiet -engine
getAnalysisMode -quiet -clkSrcPath
getAnalysisMode -quiet -clockPropagation
getAnalysisMode -quiet -cppr
setExtractRCMode -engine preRoute
setAnalysisMode -clkSrcPath false -clockPropagation forcedIdeal
getPlaceMode -exp_slack_driven -quiet
isAnalysisModeSetup
getPlaceMode -quiet -place_global_exp_solve_unbalance_path
getPlaceMode -quiet -NMPsuppressInfo
getPlaceMode -quiet -place_global_exp_wns_focus_v2
getPlaceMode -quiet -place_incr_exp_isolation_flow
getPlaceMode -enableDistPlace -quiet
getPlaceMode -quiet -clusterMode
getPlaceMode -wl_budget_mode -quiet
setPlaceMode -reset -place_global_exp_balance_buffer_chain
getPlaceMode -wl_budget_mode -quiet
setPlaceMode -reset -place_global_exp_balance_pipeline
getPlaceMode -place_global_exp_balance_buffer_chain -quiet
getPlaceMode -place_global_exp_balance_pipeline -quiet
getPlaceMode -tdgpMemFlow -quiet
getPlaceMode -user -resetCombineRFLevel
getPlaceMode -quiet -resetCombineRFLevel
setPlaceMode -resetCombineRFLevel 1000
setvar spgSpeedupBuildVSM 1
getPlaceMode -tdgpResetCteTG -quiet
getPlaceMode -place_global_replace_QP -quiet
getPlaceMode -macroPlaceMode -quiet
getPlaceMode -enableDistPlace -quiet
getPlaceMode -exp_slack_driven -quiet
getPlaceMode -place_global_ignore_spare -quiet
getPlaceMode -enableDistPlace -quiet
getPlaceMode -quiet -expNewFastMode
setPlaceMode -expHiddenFastMode 1
setPlaceMode -ignoreScan 1
getPlaceMode -quiet -place_global_exp_auto_finish_floorplan
colorizeGeometry
getPlaceMode -quiet -IOSlackAdjust
getAnalysisMode -quiet -honorClockDomains
getPlaceMode -honorUserPathGroup -quiet
getAnalysisMode -quiet -honorClockDomains
set delaycal_use_default_delay_limit 101
set delaycal_default_net_delay 0
set delaycal_default_net_load 0
set delaycal_default_net_load_ignore_for_ilm 0
getAnalysisMode -clkSrcPath -quiet
getAnalysisMode -clockPropagation -quiet
getAnalysisMode -checkType -quiet
buildTimingGraph
getDelayCalMode -ignoreNetLoad -quiet
getDelayCalMode -ignoreNetLoad -quiet
setDelayCalMode -ignoreNetLoad true -quiet
get_global timing_enable_path_group_priority
get_global timing_constraint_enable_group_path_resetting
set_global timing_enable_path_group_priority false
set_global timing_constraint_enable_group_path_resetting false
getOptMode -allowPreCTSClkSrcPaths -quiet
set_global _is_ipo_interactive_path_groups 1
group_path -name in2reg_tmp.979022 -from {0x71 0x74} -to 0x75 -ignore_source_of_trigger_arc
getOptMode -allowPreCTSClkSrcPaths -quiet
set_global _is_ipo_interactive_path_groups 1
group_path -name in2out_tmp.979022 -from {0x78 0x7b} -to 0x7c -ignore_source_of_trigger_arc
set_global _is_ipo_interactive_path_groups 1
group_path -name reg2reg_tmp.979022 -from 0x7e -to 0x7f
set_global _is_ipo_interactive_path_groups 1
group_path -name reg2out_tmp.979022 -from 0x82 -to 0x83
set_global _is_ipo_interactive_path_groups 1
group_path -name clkgate_tmp.979022 -to 0x85
setPathGroupOptions reg2reg_tmp.979022 -effortLevel high
isAnalysisModeSetup
getAnalysisMode -analysisType -quiet
isAnalysisModeSetup
all_setup_analysis_views
all_hold_analysis_views
get_analysis_view $view -delay_corner
get_delay_corner $dcCorner -power_domain_list
get_delay_corner $dcCorner -library_set
get_library_set $libSetName -si
get_delay_corner $dcCorner -late_library_set
get_delay_corner $dcCorner -early_library_set
reset_path_group -name reg2out_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name in2reg_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name in2out_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name clkgate_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name reg2reg_tmp.979022
set_global _is_ipo_interactive_path_groups 0
setDelayCalMode -ignoreNetLoad false
set delaycal_use_default_delay_limit 1000
set delaycal_default_net_delay 1000ps
set delaycal_default_net_load 0.5pf
set delaycal_default_net_load_ignore_for_ilm 0
all_setup_analysis_views
getPlaceMode -place_global_exp_ignore_low_effort_path_groups -quiet
getPlaceMode -exp_slack_driven -quiet
getPlaceMode -ignoreUnproperPowerInit -quiet
getPlaceMode -quiet -expSkipGP
setDelayCalMode -engine feDc
createBasicPathGroups -quiet
psp::embedded_egr_init_
psp::embedded_egr_term_
psp::embedded_egr_init_
psp::embedded_egr_term_
reset_path_group
set_global _is_ipo_interactive_path_groups 0
scanReorder
setDelayCalMode -engine aae
all_setup_analysis_views
getPlaceMode -exp_slack_driven -quiet
set_global timing_enable_path_group_priority $gpsPrivate::optSave_ctePGPriority
set_global timing_constraint_enable_group_path_resetting $gpsPrivate::optSave_ctePGResetting
getPlaceMode -quiet -tdgpAdjustNetWeightBySlack
get_ccopt_clock_trees *
getPlaceMode -exp_insert_guidance_clock_tree -quiet
getPlaceMode -exp_cluster_based_high_fanout_buffering -quiet
getPlaceMode -place_global_exp_incr_skp_preserve_mode_v2 -quiet
getPlaceMode -quiet -place_global_exp_netlist_balance_flow
getPlaceMode -quiet -timingEffort
getPlaceMode -quiet -place_global_exp_timing_effort_high_v2
getAnalysisMode -quiet -honorClockDomains
getPlaceMode -honorUserPathGroup -quiet
getAnalysisMode -quiet -honorClockDomains
set delaycal_use_default_delay_limit 101
set delaycal_default_net_delay 0
set delaycal_default_net_load 0
set delaycal_default_net_load_ignore_for_ilm 0
getAnalysisMode -clkSrcPath -quiet
getAnalysisMode -clockPropagation -quiet
getAnalysisMode -checkType -quiet
buildTimingGraph
getDelayCalMode -ignoreNetLoad -quiet
getDelayCalMode -ignoreNetLoad -quiet
setDelayCalMode -ignoreNetLoad true -quiet
get_global timing_enable_path_group_priority
get_global timing_constraint_enable_group_path_resetting
set_global timing_enable_path_group_priority false
set_global timing_constraint_enable_group_path_resetting false
getOptMode -allowPreCTSClkSrcPaths -quiet
set_global _is_ipo_interactive_path_groups 1
group_path -name in2reg_tmp.979022 -from {0x90 0x93} -to 0x94 -ignore_source_of_trigger_arc
getOptMode -allowPreCTSClkSrcPaths -quiet
set_global _is_ipo_interactive_path_groups 1
group_path -name in2out_tmp.979022 -from {0x97 0x9a} -to 0x9b -ignore_source_of_trigger_arc
set_global _is_ipo_interactive_path_groups 1
group_path -name reg2reg_tmp.979022 -from 0x9d -to 0x9e
set_global _is_ipo_interactive_path_groups 1
group_path -name reg2out_tmp.979022 -from 0xa1 -to 0xa2
set_global _is_ipo_interactive_path_groups 1
group_path -name clkgate_tmp.979022 -to 0xa4
setPathGroupOptions reg2reg_tmp.979022 -effortLevel high
reset_path_group -name reg2out_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name in2reg_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name in2out_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name clkgate_tmp.979022
set_global _is_ipo_interactive_path_groups 0
reset_path_group -name reg2reg_tmp.979022
set_global _is_ipo_interactive_path_groups 0
setDelayCalMode -ignoreNetLoad false
set delaycal_use_default_delay_limit 1000
set delaycal_default_net_delay 1000ps
set delaycal_default_net_load 0.5pf
set delaycal_default_net_load_ignore_for_ilm 0
all_setup_analysis_views
getPlaceMode -place_global_exp_ignore_low_effort_path_groups -quiet
getPlaceMode -exp_slack_driven -quiet
getPlaceMode -quiet -cong_repair_commit_clock_net_route_attr
getPlaceMode -enableDbSaveAreaPadding -quiet
getPlaceMode -quiet -wireLenOptEffort
setPlaceMode -reset -improveWithPsp
getPlaceMode -quiet -debugGlobalPlace
getPlaceMode -congRepair -quiet
getPlaceMode -fp -quiet
getPlaceMode -user -rplaceIncrNPClkGateAwareMode
getPlaceMode -user -congRepairMaxIter
getPlaceMode -quiet -congRepairPDClkGateMode4
setPlaceMode -rplaceIncrNPClkGateAwareMode 4
getPlaceMode -quiet -expCongRepairPDOneLoop
setPlaceMode -congRepairMaxIter 1
getPlaceMode -quickCTS -quiet
get_proto_model -type_match {flex_module flex_instgroup} -committed -name -tcl
getPlaceMode -congRepairForceTrialRoute -quiet
getPlaceMode -user -congRepairForceTrialRoute
setPlaceMode -congRepairForceTrialRoute true
::goMC::is_advanced_metrics_collection_running
congRepair
::goMC::is_advanced_metrics_collection_running
::goMC::is_advanced_metrics_collection_running
::goMC::is_advanced_metrics_collection_running
setPlaceMode -reset -congRepairForceTrialRoute
getPlaceMode -quiet -congRepairPDClkGateMode4
setPlaceMode -reset -rplaceIncrNPClkGateAwareMode
setPlaceMode -reset -congRepairMaxIter
getPlaceMode -congRepairCleanupPadding -quiet
getPlaceMode -quiet -wireLenOptEffort
all_setup_analysis_views
getPlaceMode -exp_slack_driven -quiet
set_global timing_enable_path_group_priority $gpsPrivate::optSave_ctePGPriority
set_global timing_constraint_enable_group_path_resetting $gpsPrivate::optSave_ctePGResetting
getPlaceMode -place_global_exp_incr_skp_preserve_mode_v2 -quiet
getPlaceMode -quiet -place_global_exp_netlist_balance_flow
getPlaceMode -quiet -timingEffort
getPlaceMode -quiet -place_global_exp_timing_effort_high_v2
getPlaceMode -tdgpDumpStageTiming -quiet
getPlaceMode -quiet -tdgpAdjustNetWeightBySlack
getPlaceMode -trimView -quiet
getOptMode -quiet -viewOptPolishing
getOptMode -quiet -fastViewOpt
spInternalUse deleteViewOptManager
spInternalUse tdgp clearSkpData
setAnalysisMode -clkSrcPath true -clockPropagation sdcControl
getPlaceMode -exp_slack_driven -quiet
setExtractRCMode -engine preRoute
setPlaceMode -reset -relaxSoftBlockageMode
setPlaceMode -ignoreScan true -quiet
setPlaceMode -reset -repairPlace
getPlaceMode -quiet -NMPsuppressInfo
setvar spgSpeedupBuildVSM 0
getPlaceMode -macroPlaceMode -quiet
getPlaceMode -place_global_replace_QP -quiet
getPlaceMode -exp_slack_driven -quiet
getPlaceMode -enableDistPlace -quiet
getPlaceMode -place_global_ignore_spare -quiet
getPlaceMode -tdgpMemFlow -quiet
setPlaceMode -reset -resetCombineRFLevel
getPlaceMode -enableDistPlace -quiet
getPlaceMode -quiet -clusterMode
getPlaceMode -quiet -place_global_exp_solve_unbalance_path
getPlaceMode -enableDistPlace -quiet
setPlaceMode -reset -expHiddenFastMode
getPlaceMode -tcg2Pass -quiet
getPlaceMode -quiet -wireLenOptEffort
getPlaceMode -fp -quiet
getPlaceMode -fastfp -quiet
getPlaceMode -doRPlace -quiet
getPlaceMode -RTCPlaceDesignFlow -quiet
getPlaceMode -quickCTS -quiet
set spgFlowInInitialPlace 0
getPlaceMode -user -maxRouteLayer
spInternalUse TDGP resetIgnoreNetLoad
getPlaceMode -place_global_exp_balance_pipeline -quiet
getDesignMode -quiet -flowEffort
report_message -end_cmd
um::create_snapshot -name final -auto min
um::pop_snapshot_stack
um::create_snapshot -name place_design
getPlaceMode -exp_slack_driven -quiet
setDrawView place
setOptMode -yieldEffort none -effort high -maxDensity 0.95 -fixDRC true -fixFanoutLoad true -optimizeFF true -simplifyNetlist false -holdTargetSlack 0.0 -setupTargetSlack 0.0
clearClockDomains
setClockDomains -all
setOptMode -usefulSkew false
optDesign -preCTS -drv -outDir ./reports/preCTSOptTiming
clockDesign -outDir ./reports/cts
globalDetailRoute
setFillerMode -corePrefix arbiter_FILL -core {FILL1A12TR FILL2A12TR FILL4A12TR FILL8A12TR FILL16A12TR FIL32A12TR FILL64A12TR FILL128A12TR}
addFiller -cell {FILL1A12TR FILL2A12TR FILL4A12TR FILL8A12TR FILL16A12TR FIL32A12TR FILL64A12TR FILL128A12TR} -prefix arbiterFILL -markFixed
verifyConnectivity -type regular -error 50 -warning 50 -report ./reports/conn_regular.rpt
verifyConnectivity -type special -error 50 -warning 50 -report ./reports/conn_special.rpt
