SetActiveLib -work
#Compiling UUT module design files
comp "$DSN\src\rm16x16.bde" 
comp "$DSN\src\rm16x32.bde" 
comp "$DSN\src\c4ud.bde" 
comp "$DSN\src\c4u.bde" 
comp "$DSN\src\fifod.bde" 
comp "$DSN\src\fd16d.bde" 
comp "$DSN\src\fifo.bde" 
alog "$DSN\src\TB_verilog\fifo_TB.v" 

asim -advdataflow fifo_tb

wave
wave -noreg DIP
wave -noreg CLKP
wave -noreg PUSHP
wave -noreg POPP
wave -noreg DOP
wave -noreg EMPTYP
wave -noreg FULLP
wave -noreg LASTP

run 1820.00 ns

#End simulation macro
