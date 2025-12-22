quiet on
@onerror
{
goto end
}

savealltabs
SetActiveLib -work
				  
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
asim -pli $DSN/src/PLI/oscil_c_pli.dll -advdataflow -ses filter_tb tb_architecture

wave
wave -analog -color 255,0,0 -height 30 UUT/NI
wave -analog -color 0,0,255 -height 44 UUT/NO
wave UUT/CLK
wave UUT/RESET

run -all
endsim

label end

quiet off
