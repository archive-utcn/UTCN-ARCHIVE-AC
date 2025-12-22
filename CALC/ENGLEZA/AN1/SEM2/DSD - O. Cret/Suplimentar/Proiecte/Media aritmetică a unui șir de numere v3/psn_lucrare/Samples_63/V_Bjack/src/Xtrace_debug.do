#
# rebuild the whole project
#
savealltabs		  
setactivelib -work
quiet on
vlcomp -dbg "$DSN\src\Gates.v"
vlcomp -dbg "$DSN\src\Bin2bcd.v"
vlcomp -dbg "$DSN\src\Bcd2led.v"
vlcomp -dbg "$DSN\src\Bjack_c.v"
vlcomp -dbg "$DSN\src\Gen.v"
vlcomp -dbg "$DSN\src\Johnson8.v"
vlcomp -dbg "$DSN\src\Mux.v"
vlcomp -dbg "$DSN\src\V_bjack.v"
vlcomp -dbg "$DSN\src\Tb.v"
# 
#
# set top-level and initialize the simulator  
#
asim -t ps V_BJACK_tb 
#
# enable xtracing with the xtrace command
#
xtrace -source -stop_condition * -rec UUT/*
#
# trace signals
#
trace -rec * 
#
#wave
#wave /UUT/OFF     
#wave /UUT/I11/OFF        
#wave /UUT/I1/O        
#wave /UUT/L_H(1)        
#wave /UUT/I11/LED_H(1)        
#wave /UUT/OFF        
#wave /UUT/I11/OFF        
#wave /UUT/I1/O        
#wave /UUT/L_H(1)        
#wave /UUT/I11/LED_H(1)        
#wave /UUT/OFF        
#wave /UUT/I11/OFF        
#wave /UUT/I1/O        
#wave /UUT/L_H(1)        
#wave /UUT/I11/LED_H(1)        
#wave /UUT/OFF        
#wave /UUT/I11/OFF        
#wave /UUT/I1/O        
#wave /UUT/L_H(1)        
#wave /UUT/I11/LED_H(1)  
run 1200 ps
      

--endsim
quiet off