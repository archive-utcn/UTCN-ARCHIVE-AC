#
savealltabs
quiet on
setactivelib -work
acom "$DSN\src\functional\binctr.vhd"
acom "$DSN\src\functional\refill.vhd"
acom "$DSN\src\functional\Refill_tb.vhd" 
asim -advdataflow testbench FUNCTIONAL_ARCH

wave 
wave clk
wave reset
wave get_cola
wave get_diet
wave give_cola
wave give_diet
wave refill_bins

run 2500000 ps 
endsim
quiet off


