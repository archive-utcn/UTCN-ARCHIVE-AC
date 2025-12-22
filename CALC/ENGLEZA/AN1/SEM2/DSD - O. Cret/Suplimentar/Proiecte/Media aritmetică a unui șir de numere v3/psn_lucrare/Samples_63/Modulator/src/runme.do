#
# rebuild the whole project
#

acom "$DSN\src\SineGenerator.vhd"
acom "$DSN\src\CosineGenerator.vhd"
acom "$DSN\src\SawGenerator.vhd"
acom "$DSN\src\Multiplier.vhd"
acom "$DSN\src\Modulator.bde"
#
# set top-level and initialize the simulator  
#
asim -advdataflow Modulator
#
# invoke Waveform Viewer window, add signals to Waveform
#
wave
wave -rec * 
#
# stimulators 
# 
force CLK 0 0, 1 500 ps -r 1000 ps	   
force sinfreq 65
force cosfreq 16
force sawfreq 89
force sinenable 1
force cosenable 0
force sawenable 1
#
# running simulation with signal value veryfication.
#

run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
run 10 ns
@echo output=[ex output]
endsim

