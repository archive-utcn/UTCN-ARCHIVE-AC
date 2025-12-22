#compile all hdl files
alog $DSN/src/and4.v
alog $DSN/src/and3.v
alog $DSN/src/and2.v
alog $DSN/src/oscil_c_pli.v
acom $DSN/src/cb4ce.vhd
acom $DSN/src/c2or.vhd
edfcomp $DSN/src/CRV.bde
acom $DSN/src/pfdiv.vhd	
acom $DSN/src/filter.bde
acom $DSN/src/testbench/filter_tb.vhd 
#build dlm file
buildc "$DSN\src\oscil_c_pli.dlm"
#set top level 
entity tb_architecture
#initialize c-code debug session
cdebug -abp 