#adel -all
cd $dsn\src
buildc $DSN/src/testbench/tester.dlm 
addfile $DSN/src/testbench/tester.dll
addsc $DSN/src/testbench/tester.dll

acom $DSN/src/clk_gen.vhd
acom $DSN/src/clk_div.vhd
acom $DSN/src/clocks.bde
acom $DSN/src/fifo.vhd
acom $DSN/src/test_environment.bde


