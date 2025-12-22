savealltabs
quiet on
setactivelib -work
#Compiling UUT entity design files
comp "$DSN\src\C2OR.bde"
comp "$DSN\src\OSCIL.bde"
comp "$DSN\src\PFDIV.bde"
comp "$DSN\src\CRV.bde"
comp "$DSN\src\FILTER.bde"
acom "$DSN\src\TB_vhd\FILTER_TB.vhd"

#Run simulation
asim -t ps -advdataflow  TESTBENCH_FOR_FILTER_FUNCTIONAL
#asim TIMING_FOR_FILTER
wave
wave -analog -color 255,0,0 -height 30 NI
wave -analog -color 0,0,255 -height 60 NO
wave CLK
wave RESET

run -all
endsim
quiet off
#End simulation macro
