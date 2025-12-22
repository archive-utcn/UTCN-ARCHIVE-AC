#
# rebuild whole project
savealltabs
quiet on
setactivelib -timing
acom "$DSN\src\timing\top_routed.vhd"
acom "$DSN\src\testbench.vhd"
acom "$DSN\src\timing\timing_cfg.vhd"
#
# Load SDF file 
#
asim -advdataflow -sdftyp /UUT=$DSN\SRC\timing\top_routed.sdf timing_cfg
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
