acom "$DSN\src\Devices\Latch.vhd" 
acom "$DSN\src\Devices\TestBench\Latch_TB.vhd" 
asim -advdataflow TESTBENCH_FOR_Latch 
wave  
wave INP
wave OUTP
wave CLK
run 2.5 us
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# acom "$DSN\src\TestBenchAA\Latch_TB_tim_cfg.vhd" 
# asim TIMING_FOR_Latch 
