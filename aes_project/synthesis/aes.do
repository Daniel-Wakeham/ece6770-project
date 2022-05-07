### Tcl test bench for the pipelined multipler
###
### See /uusoc/facility/cad_tools/Synopsys/sold/sold for modelsim interface
### http://www.tcl.tk/man/tcl8.5/tutorial/tcltutorial.html for tcl tutorial
###
### kss, 10/31/2005

view wave

add wave -radix binary r g 
add wave clk rstn


# define clock
set clk_period 1000
## define clock to q for earliest input time
## I gave the design a 100ps delay for inputs and sampling output
set clk_offset 100
## define the setup time (when data is sampled)
## I used 50ps in the synthesis script.
set TSETUP 50


# open golden reference model to validate against its results
set infile [open "test/GoldenResult" r]
set outfile [open "test/VerilogResult" w]




# initialize network, reset sytem
force rstn 0
force r 2#000
force -repeat $clk_period clk 0 0, 1 [expr 0.5 * $clk_period]
force rstn 0
run [expr 1 * $clk_period]
force rstn 1
run [expr 1 * $clk_period]

# Begin Unit Test
echo ======= Begin Functional Test =======
run $clk_offset 
force r 2#001
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#101
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#100
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#110
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#010
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#110
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#100
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#101
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#001
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#010
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#111
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#101
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#100
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#000
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#010
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]

run $clk_offset 
force r 2#110
run [expr (2 * $clk_period) - ($clk_offset + $TSETUP)]
run [expr $TSETUP]
run [expr 2 * $clk_period]
set str "r = [exa -r b r], g = [exa -r b g]"
puts $outfile $str
run [expr 1 * $clk_period]




echo ======= End Functional Test   =======








quit
