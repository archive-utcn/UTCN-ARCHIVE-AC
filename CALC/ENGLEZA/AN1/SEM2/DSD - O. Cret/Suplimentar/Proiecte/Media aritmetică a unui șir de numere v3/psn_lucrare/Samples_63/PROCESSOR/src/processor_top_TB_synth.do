SetActiveLib -post-synthesis
#Compiling design files
alog -l ovi_apex20ke $DSN\synthesis\processor_top.vm
alog "$DSN\src\processor_top_TB.v"
asim -advdataflow processor_top_tb
wave -ports UUT/*	  
run -all
endsim			
#End simulation macro
