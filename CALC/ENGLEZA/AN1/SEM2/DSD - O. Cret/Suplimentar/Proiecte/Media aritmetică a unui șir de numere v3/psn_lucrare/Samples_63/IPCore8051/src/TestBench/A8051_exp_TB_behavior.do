acom "$DSN\src\Devices\Types.vhd" 
acom "$DSN\src\Devices\display.vhd" 
acom "$DSN\src\Devices\pr_sr_register.vhd" 
acom "$DSN\src\Devices\ram.vhd" 
acom "$DSN\src\Devices\Latch.vhd" 
acom "$DSN\src\Devices\keyboard.vhd" 
acom "$DSN\src\8051\registers.vhd" 
acom "$DSN\src\8051\Timers.VHD" 
acom "$DSN\src\8051\Console.vhd" 
acom "$DSN\src\8051\InternalProgramMemory.vhd" 
acom "$DSN\src\8051\AL8051.vhd" 
acom "$DSN\src\Fpga.bde" 
acom "$DSN\src\A8051_exp.bde" 
acom "$DSN\src\TestBench\A8051_exp_TB.vhd" 
asim -advdataflow TESTBENCH_FOR_A8051_exp 
open -wave $DSN\SRC\controller.awf
open -wave $DSN\SRC\display.awf
open -wave $DSN\SRC\keyboard.awf
open -wave $DSN\SRC\pr_sr_register.awf
wave  
wave CLK
wave KEY_0
wave KEY_1
wave KEY_2
wave KEY_3
wave KEY_4
wave KEY_5
wave KEY_6
wave KEY_7
wave KEY_8
wave KEY_9
wave RESET
wave nWRS
wave DATAS
wave BUSY
wave SCREEN
run 170 us
#Message printed on display:  *** HELLO ***
#                             IP Core 8051
pause 10 s
run 90 us
#Message printed on display:  PRESS ANY KEY 
#                             IP Core 8051
#Writing byte to parallel - serial register.
pause 10 s
run 10 us
#The byte was received by serial port. 
#Key 0 was pressed.
pause 10 s 
run 95 us
#Message printed on display:  PRESS ANY KEY
#                             KEY NUMBER 0
pause 10 s
run 5 us
#Writing next byte to parallel - serial register.
pause 10 s
run 10 us
#The byte was received. 
#Key 6 was pressed.
pause 10 s
run 100 us
#Message printed on display: PRESS ANY KEY
#                            KEY NUMBER 6
#endsim
