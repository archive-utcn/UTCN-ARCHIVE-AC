acom $DSN\src\REG.vhd
acom $DSN\src\MUX.vhd
acom $DSN\src\COMPARATOR.vhd
acom $DSN\src\ADDSUB.vhd
acom $DSN\src\COMP.bde
acom $DSN\src\REGS.bde
acom $DSN\src\ALU.bde
acom $DSN\src\CONTROL_FSM.asf
acom $DSN\src\COUNTER.vhd
acom $DSN\src\DATAPATH.bde
acom $DSN\src\CONTROL.bde
acom $DSN\src\top.bde
acom $DSN\src\testbench.vhd
asim -advdataflow top_testbench
#
wave  
wave CLK
wave RESET
wave START
wave CODE
wave DATA_IN
wave OVL
wave Q_OUT
run 11 us

