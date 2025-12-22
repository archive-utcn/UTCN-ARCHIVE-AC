SetActiveLib -timing
acom "$DSN\src\sine_lookup_pkg.vhd"
acom "$DSN\implement\simulation\custom\top.vho" 
acom "$DSN\src\testbench.vhd" 
asim -t 1ns -sdftyp -AUTO=$DSN\implement\simulation\custom\top_vhd.sdo testbench
wave 
wave -analog -height 40 temp1
wave -analog -height 40 temp2
wave -analog -height 40 DataInArr
wave -analog -height 40 DataOut
run -all
endsim
