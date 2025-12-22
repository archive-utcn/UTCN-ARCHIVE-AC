
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
# set top-level and initialize the simulator, set parameters for code coverage data generation  
#
asim -advdataflow -cc -cc_dest $DSN/coverage -cc_hierarchy -cc_all testbench testbench_arch
#
# invoke Waveform Viewer window, add signals to Waveform
#
wave
wave GEN_RES
wave SYS_CLK
wave GEN_CLK
wave START
wave NEW_CARD
wave D_L
wave D_H
wave L_L
wave L_H
wave BUST
wave HOLD
wave LEDS
#
#
#
run 8720 ns
endsim
quiet off
