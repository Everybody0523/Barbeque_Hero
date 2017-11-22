# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns graphics.v

# Load simulation using mux as the top level simulation module.
vsim g_dp

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}



# datapath

force {clk} 0 0, 1 20 -r 40
force {resetn} 1
force {colour_fat} 0010000000
force {colour_muscle} 0010000000

run 2000 ns


# control & database

#force {CLOCK_50} 0 0, 1 20 -r 40
#force {KEY[0]} 1
#force {KEY[3]} 1 0, 0 40, 1 80, 0 120

#force {SW[9:7]} 111
#force {SW[6:0]} 1010101 0, 1000000 80

#run 1200 ns
