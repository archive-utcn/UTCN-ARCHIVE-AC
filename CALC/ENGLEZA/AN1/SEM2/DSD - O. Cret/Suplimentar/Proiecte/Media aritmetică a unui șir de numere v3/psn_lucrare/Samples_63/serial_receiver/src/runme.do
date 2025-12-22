#adel -all
cd $dsn\src
buildc testwrapper.dlm	
addfile testwrapper.dll
addsc testwrapper.dll

acom -dbg "$DSN/src/clk_gen.vhd"
acom -dbg "$DSN/src/rcv_reg.vhd"
acom -dbg "$DSN/src/synchronizer.vhd"
acom -dbg "$DSN/src/latched_val.vhd"
acom -dbg "$DSN/src/rcv.bde"
acom -dbg "$DSN/src/test_env.bde"

asim test_env

wave *

run 6 us

endsim