###################################################################

# Created by write_sdc on Fri May  6 13:58:04 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V       \
-current mA
set_operating_conditions tt_1p0v_25c -library scadv12_cmos10sf_rvt_tt_1p0v_25c
set_wire_load_mode segmented
set_wire_load_model -name cmos10sf_wl5 -library                                \
scadv12_cmos10sf_rvt_tt_1p0v_25c
set_max_fanout 64 [current_design]
set_load -pin_load 0.009269 [get_ports {g[1]}]
set_load -pin_load 0.009269 [get_ports {g[2]}]
set_load -pin_load 0.009269 [get_ports {g[3]}]
create_clock [get_ports clk]  -name clock  -period 0.333  -waveform {0 0.1665}
set_clock_uncertainty 0.01665  [get_clocks clock]
set_input_delay -clock clock  -max 0.1  [get_ports rstn]
set_input_delay -clock clock  -max 0.1  [get_ports {r[1]}]
set_input_delay -clock clock  -max 0.1  [get_ports {r[2]}]
set_input_delay -clock clock  -max 0.1  [get_ports {r[3]}]
set_output_delay -clock clock  -max 0.05  [get_ports {g[1]}]
set_output_delay -clock clock  -max 0.05  [get_ports {g[2]}]
set_output_delay -clock clock  -max 0.05  [get_ports {g[3]}]
