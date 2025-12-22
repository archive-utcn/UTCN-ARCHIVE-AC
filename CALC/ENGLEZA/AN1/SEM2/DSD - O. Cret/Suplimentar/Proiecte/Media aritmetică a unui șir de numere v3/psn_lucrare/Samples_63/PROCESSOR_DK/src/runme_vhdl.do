acom "$DSN\src\divider.vhd"
acom "$DSN\Celoxica\Vhdl\processor_hcc.vhd"
acom "$DSN\Celoxica\Vhdl\processor_top.vhd"
acom "$DSN\src\test_processor.vhd"

asim test_processor
wave
wave *
run -all
endsim
