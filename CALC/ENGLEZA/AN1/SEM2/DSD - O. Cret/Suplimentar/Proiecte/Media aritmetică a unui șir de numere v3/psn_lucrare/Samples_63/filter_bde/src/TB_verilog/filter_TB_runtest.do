SetActiveLib -work
#Compiling UUT module design files
comp "$DSN\src\C2OR.bde"
comp "$DSN\src\OSCIL.bde"
comp "$DSN\src\PFDIV.bde"
comp "$DSN\src\CRV.bde"
comp "$DSN\src\FILTER.bde"
alog "$DSN\src\TB_verilog\FILTER_TB.v"
asim -advdataflow filter_tb
#
wave
wave -analog -color 255,0,0 -height 30 NI
wave -analog -color 0,0,255 -height 60 NO
wave CLK
wave RESET

run -all
endsim
quiet off
#End simulation macro
