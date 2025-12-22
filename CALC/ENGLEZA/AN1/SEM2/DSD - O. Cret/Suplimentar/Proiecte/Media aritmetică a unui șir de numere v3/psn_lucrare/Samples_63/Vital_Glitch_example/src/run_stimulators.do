#Glitches handling exmaple

acom $dsn\src\vital_model.vhd
acom $dsn\src\vital_model_components.vhd
acom $dsn\src\timing_design.vhd
asim -sdftyp /=timing_design.sdf simple_gate simple_gate  

# adding signal to waveform

wave -rec *

#Stimulators form command line	 

force IN1_GATE 1
force IN2_GATE 1
force IN3_GATE 1
run 10 ns
force IN3_GATE 0
run 10 ns
force IN3_GATE 1
run 40 ps
force IN3_GATE 0
run 10 ns


