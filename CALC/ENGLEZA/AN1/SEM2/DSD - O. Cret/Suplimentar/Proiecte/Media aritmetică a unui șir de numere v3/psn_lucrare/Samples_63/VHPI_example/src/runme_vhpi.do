setactivelib -work
acom "$DSN\src\and2.vhd" 
acom "$DSN\src\cnt_4b.vhd" 
acom "$DSN\src\hex2led.vhd" 
acom "$DSN\src\CNT_BCD.bde" 
acom "$DSN\src\CONTROL.asf" 
acom "$DSN\src\freq_top.bde" 
acom "$DSN\src\TestBench\TestBenchPack.vhd"
acom "$DSN\src\vhpi_component.vhd"    
acom "$DSN\src\TestBench\testbench_vhpi.vhd"    
acom "$DSN\src\testbench_cnt_bcd_conf.vhd"    
asim testbench_cnt_bcd_conf 
endsim

