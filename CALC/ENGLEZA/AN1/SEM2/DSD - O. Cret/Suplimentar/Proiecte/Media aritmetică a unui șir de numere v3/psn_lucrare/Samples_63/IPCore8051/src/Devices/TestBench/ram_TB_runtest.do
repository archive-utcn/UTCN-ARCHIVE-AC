acom "$DSN\src\Devices\ram.vhd" 
acom "$DSN\src\Devices\TestBench\ram_TB.vhd" 
asim -advdataflow TESTBENCH_FOR_ram 
wave  
wave nRD
wave nWR
wave nCS
wave DATA
wave ADDRESS
run 5.1 us
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# acom "$DSN\src\TestBench\ram_TB_tim_cfg.vhd" 
# asim TIMING_FOR_ram 
