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

# Arguments are expected sum and carry out values to validate:
proc muleval { a b outfile clkper indelay outdelay} {

    ## advance time to input delay for driving inputs
    run $indelay

    ## Force simulation signal A to passed value
    if { [string length $a] == 8 } {
	force A 2\#$a
    } else {
	if { [string index $a 0] == "-" } {
	    force A -10\#[string range $a 1 [expr [string length $a] - 1]]
	} else {
	    force A 10\#$a
	}
    }

    ## Force simulation signal B to passed value
    if { [string length $b] == 8 } {
	force B 2\#$b
    } else {
	if { [string index $b 0] == "-" } {
	    force B -10\#[string range $b 1 [expr [string length $b] - 1]]
	} else {
	    force B 10\#$b
	}
    }

    ## Advance clock to sample time before clock edge
    run [expr $clkper - ($indelay + $outdelay)]

    set str "a = [exa -radix decimal A], b = [exa -r d B], result = [exa -r d RESULT]"
    echo $str
    # store results in same format as golden reference model
    if { [string length $a] == 8 } {
	set str "a = [exa -r binary A], b = [exa -r b B], result = [exa -r b RESULT]"
    } else {
	set str "a = [exa -signed -r d A], b = [exa -s -r d B], result = [exa -s -r d RESULT]"
    }
    puts $outfile $str

    ## Advance time to clock edge
    run $outdelay
}


# initialize network, reset sytem
force rstn 0
force r 2#000
force -repeat $clk_period clk 0 0, 1 [expr 0.5 * $clk_period]
force rstn 0
run [expr 1 * $clk_period]
force rstn 1
run [expr 1 * $clk_period]

# Begin Unit Test
echo ======= Begin Unit Test =======
run $clk_offset 
force r 2#001
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

run [expr 1 * $clk_period]

run $clk_offset 
force r 2#010
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

run [expr 1 * $clk_period]


run $clk_offset 
force r 2#100
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

run [expr 1 * $clk_period]

run $clk_offset 
force r 2#110
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

run [expr 1 * $clk_period]

run $clk_offset 
force r 2#010
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

run [expr 1 * $clk_period]

run $clk_offset 
force r 2#110
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

run [expr 1 * $clk_period]

run $clk_offset 
force r 2#100
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

run [expr 1 * $clk_period]

run $clk_offset 
force r 2#001
run [expr (1.5 * $clk_period) - ($clk_offset + $TSETUP)]
set str "r = [exa -r b r], g = [exa -r b g]"
echo $str
run [expr $TSETUP]

echo ======= End Unit Test   =======



#echo starting simulation...

#echo starting VCD dump at $now
#vcd file mult.vcd
#vcd add -r /*





vcd on

while { $clk_period && [gets $infile line] >= 0 } {
    set res [regexp {a = +([-0-9]+), b = +([-0-9]+), result = +([-0-9]+)} $line match ain bin resultin]

    if { $res == 1 } {
	#echo "clock edge at $Now"
    	muleval $ain $bin $outfile $clk_period $clk_offset $TSETUP
    } else {
	echo "Didn't parse regexp line $line"
    }
}


echo ... simulation done!
echo finishing VCD dump at $now
vcd off
vcd flush


# close file handles
close $infile
close $outfile

quit
