acom "$DSN\src\ALTERA POST-P&R\presscontroller.vhd" 
acom "$DSN\src\ALTERA POST-P&R\presscontroller_TB_AL.vhd" 
asim  -advdataflow -sdftyp /uut="$dsn\src\Altera Post-P&R\presscontroller.sdf" TESTBENCH_FOR_press_top 
wave  
wave CLR
wave CLK
wave CLK_T
wave DET
wave STR
wave STP
wave RST
wave Y
wave OUTPUT
wave TIMER
wave LIMIT
run 7 ms
endsim
