#
# rebuild whole project
savealltabs
quiet on
setactivelib -work
acom "$DSN\src\functional\fib.vhd"
acom "$DSN\src\functional\top.vhd"
acom "$DSN\src\testbench.vhd"
acom "$DSN\src\functional\functional_cfg.vhd"

#
#

asim -advdataflow functional_cfg
# initialize simulation
wave
wave CLK
wave RESET
wave ENABLE
wave FIBO
wave DISPA
wave DISPB
run 10000 ns
endsim 
quiet off
#

