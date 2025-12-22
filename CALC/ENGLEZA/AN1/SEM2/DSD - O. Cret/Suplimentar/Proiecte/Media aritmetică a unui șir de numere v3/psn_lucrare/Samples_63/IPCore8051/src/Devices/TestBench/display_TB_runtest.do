acom "$DSN\src\Devices\types.vhd" 
acom "$DSN\src\Devices\display.vhd" 
acom "$DSN\src\Devices\TestBench\display_TB.vhd" 
asim -advdataflow  TESTBENCH_FOR_display 
wave  
wave nCS
wave CTR
wave nWR
wave nRD
wave ADDRESS
wave DATA
wave SCREEN
run 30. us
