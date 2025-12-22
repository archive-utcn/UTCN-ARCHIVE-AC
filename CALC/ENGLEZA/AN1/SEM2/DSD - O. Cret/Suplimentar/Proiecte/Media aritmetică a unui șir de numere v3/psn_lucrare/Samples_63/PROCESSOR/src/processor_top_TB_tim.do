SetActiveLib -timing
#Compiling design files
alog -l ovi_apex20ke $DSN\implement\ver1\rev1\simulation\custom\processor_top.vo
alog "$DSN\src\processor_top_TB.v"
asim -advdataflow -sdftyp /UUT=$DSN\implement\ver1\rev1\simulation\custom\processor_top_v.sdo processor_top_tb
wave -ports processor_top_tb/UUT/*
run -all
endsim
#End simulation macro
