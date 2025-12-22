SetActiveLib -work
comp -include "$DSN\src\mux_2la1.vhd" 
comp -include "$DSN\src\TestBench\mux_2la1_TB.vhd" 
asim TESTBENCH_FOR_mux_2la1 
wave 
wave -noreg i0
wave -noreg i1
wave -noreg sel
wave -noreg y
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\mux_2la1_TB_tim_cfg.vhd" 
# asim TIMING_FOR_mux_2la1 
