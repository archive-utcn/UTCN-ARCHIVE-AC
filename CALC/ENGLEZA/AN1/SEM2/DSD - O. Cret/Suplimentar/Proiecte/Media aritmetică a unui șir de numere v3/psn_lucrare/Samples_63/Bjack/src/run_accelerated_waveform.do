# Simulation script with viewing results in Accelerated Waveform
#
# rebuild the whole project
#
savealltabs
quiet on
setactivelib -work
acom -dbg "$DSN\src\gates.vhd"
acom -dbg "$DSN\src\bjack_c.asf"
acom -dbg "$DSN\src\disp_units.vhd"
acom -dbg "$DSN\src\bjack.vhd"
acom -dbg "$DSN\src\testbench.vhd"

#
# set top-level and initialize the simulator, set parameters for ASDB Simulation Database generation
#
asim -asdb $dsn\src\functional.asdb testbench testbench_arch
#
# add signals to the Accelerated Waveform
#
trace GEN_RES
trace SYS_CLK
trace GEN_CLK
trace START
trace NEW_CARD
trace D_L
trace D_H
trace L_L
trace L_H
trace BUST
trace HOLD
trace LEDS
#
#
#
run 8720 ns
endsim
#invoke Accerelated Waveform with ASDB Simulation Database
open -asdb $dsn\src\functional.asdb	  
quiet off
