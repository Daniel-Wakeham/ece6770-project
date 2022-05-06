### Tcl test bench for the arbiter

view wave

add wave clk rstn
add wave -radix binary r g
#add wave -divider "Internal nodes"
#add wave clock_r_REG0_S1/D clock_r_REG0_S1/CK clock_r_REG0_S1/Q


# define clock
set clk_period 334
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
force r 0
force -repeat $clk_period clk 0 0, 1 [expr 0.5 * $clk_period]
force rstn 0
run [expr 2 * $clk_period]
force rstn 1

## Advance to posedge clock minus input delay and setup times
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

echo starting simulation...
echo starting VCD dump at $now
vcd file mult.vcd
vcd add -r 
vcd on

## IMPLEMENT IN PROC

# advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#000
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

## advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#001
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

## advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#010
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

## advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#011
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

# advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#100
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

## advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#101
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

## advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#110
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]

## advance time to input delay for driving inputs
run $clk_offset
## Force simulation signal r
force r 2#111
## Advance clock to sample time before clock edge
run [expr 0.5 * $clk_period + $TSETUP]
set str "r = [exa -radix binary r], g = [exa -radix binary g]"
echo $str
puts $outfile $str
## Advance time to clock edge
run [expr 0.5 * $clk_period - ($clk_offset + $TSETUP)]


echo ... simulation done!
echo finishing VCD dump at $now
vcd off
vcd flush

# close file handles
close $infile
close $outfile

quit;
