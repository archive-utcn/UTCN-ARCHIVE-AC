#
# rebuild the whole project
#
savealltabs		  
setactivelib -work
quiet on
vlcomp "$DSN\src\Hex2Led.v"
vlcomp "$DSN\src\CNT_10b.bde"
vlcomp "$DSN\src\Bin2bcd.v"
vlcomp "$DSN\src\control.asf"
vlcomp "$DSN\src\freq_m.bde"
vlcomp "$DSN\src\frequency_meter_tb.v"


#
# set top-level and initialize the simulator  
#
asim -advdataflow frequency_meter_tb
#
# invoke Waveform Viewer window, add signals to Waveform
#
wave
wave LED_D
wave LED_C
wave LED_B
wave LED_A
wave RESET
wave F_INPUT
wave F_PATTERN
wave F_CONV
wave FULL
wave START	
wave /UUT/*
#
#
#
run -all
endsim
quiet off
