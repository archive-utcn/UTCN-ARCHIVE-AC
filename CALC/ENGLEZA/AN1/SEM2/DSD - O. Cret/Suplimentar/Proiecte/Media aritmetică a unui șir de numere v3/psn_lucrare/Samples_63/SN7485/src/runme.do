saveAllTabs
quiet on
setactivelib -work

clear -log
 @clearfile $dsn\results.txt

 vcom "$DSN\src\Gates.vhd" 
 vcom "$DSN\src\Fub5.bde" 
 vcom "$DSN\src\Fub4.bde" 
 vcom "$DSN\src\Fub3.bde" 
 vcom "$DSN\src\Fub2.bde" 
 vcom "$DSN\src\Fub1.bde" 
 vcom "$DSN\src\Fub0.bde" 
 vcom "$DSN\src\SN7485_TOP.bde" 
 vcom "$DSN\src\SN7485_TOP_TB.vhd" 	
 cd $DSN\src\
 vsim -advdataflow TESTBENCH_FOR_SN7485_TOP 	
 wave
 wave A0
 wave A1
 wave A2
 wave A3
 wave B0
 wave B1
 wave B2
 wave B3
 wave K
 wave L
 wave M
  
 run -all
 endsim

quiet off
@echo end of macro
