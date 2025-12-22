#compile all hdl files
vlcomp  "$DSN\src\CD4029.v"
vlcomp  "$DSN\src\ASCIIDEC.v"
vlcomp  "$DSN\src\INTELHEX.v"
vlcomp  "$DSN\src\DAT_CNT.v"
vlcomp  "$DSN\src\COMP.v" 
vlcomp  "$DSN\src\REG4.v"	  
vlcomp  "$DSN\src\SUB.v"
vlcomp  "$DSN\src\DATREG.v"
vlcomp  "$DSN\src\ADRCNT.bde"
vlcomp  "$DSN\src\LRC.bde" 
vlcomp  "$DSN\src\DAC_SC1.bde"
vlcomp  "$DSN\src\uut_pli.v" 
#build dlm file
buildc "$DSN\src\external\read_byte_ex.dlm"
#set top level 
module UUT_PLI
#initialize c-code debug session
cdebug -abp

