acom "$DSN\src\Devices\keyboard.vhd" 
acom "$DSN\src\Devices\TestBench\keyboard_TB.vhd" 
asim -advdataflow TESTBENCH_FOR_keyboard 
wave  
wave Key_0
wave Key_1
wave Key_2
wave Key_3
wave Key_4
wave Key_5
wave Key_6
wave Key_7
wave Key_8
wave Key_9
wave RESET
wave ACKA
wave INTA
wave CODE
run 4.3 us
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# acom "$DSN\src\TestBench\keyboard_TB_tim_cfg.vhd" 
# asim TIMING_FOR_keyboard 
