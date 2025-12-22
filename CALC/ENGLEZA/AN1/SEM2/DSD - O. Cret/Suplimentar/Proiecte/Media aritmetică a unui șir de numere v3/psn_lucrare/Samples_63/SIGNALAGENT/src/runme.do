acom $DSN/src/cnt_4.vhd
acom $DSN/src/divider.vhd
acom $DSN/src/tb.vhd
asim -advdataflow testbench beh 
wave clk
wave reset
wave gate
wave enable
wave full1
wave full2
wave full3
wave pulse