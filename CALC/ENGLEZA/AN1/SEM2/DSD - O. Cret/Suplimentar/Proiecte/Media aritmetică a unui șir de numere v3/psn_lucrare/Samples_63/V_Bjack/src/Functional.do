#
# rebuild the whole project
#
savealltabs		  
setactivelib -work
quiet on
vlcomp -dbg "$DSN\src\Gates.v"
vlcomp -dbg "$DSN\src\Bin2bcd.v"
vlcomp -dbg "$DSN\src\Bcd2led.v"
vlcomp -dbg "$DSN\src\Bjack_c.v"
vlcomp -dbg "$DSN\src\Gen.v"
vlcomp -dbg "$DSN\src\Johnson8.v"
vlcomp -dbg "$DSN\src\Mux.v"
vlcomp -dbg "$DSN\src\V_bjack.v"
vlcomp -dbg "$DSN\src\Tb.v"
# 
#
# set top-level and initialize the simulator  
#
asim -advdataflow -t ps -cc -cc_dest $DSN/coverage -cc_hierarchy -cc_all V_BJACK_tb
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
run 15.41 ns
endsim
quiet off
