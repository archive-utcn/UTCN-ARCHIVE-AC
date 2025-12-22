#compile all hdl files
vcom "$DSN\src\Gates.vhd" 
vcom "$DSN\src\Fub5.bde" 
vcom "$DSN\src\Fub4.bde" 
vcom "$DSN\src\Fub3.bde" 
vcom "$DSN\src\Fub2.bde" 
vcom "$DSN\src\Fub1.bde" 
vcom "$DSN\src\Fub0.bde" 
vcom "$DSN\src\SN7485_TOP.bde" 
vcom "$DSN\src\SN7485_TOP_TB.vhd" 
#build dlm file
buildc "$DSN\src\external\Foreign1.dlm"
#set top level 
configuration testbench_for_sn7485_top
#initialize c-code debug session
cdebug -abp