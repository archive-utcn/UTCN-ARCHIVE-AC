setactivelib -work
savealltabs
quiet on
acom $dsn\src\functional\averager.vhd
acom $dsn\src\functional\aver_tb.vhd
asim -advdataflow cfg_aver_tb
wave 
wave SYSCLK
wave RST
wave DATAIN
wave DATAOUT
run 8030 ns
endsim
quiet off
