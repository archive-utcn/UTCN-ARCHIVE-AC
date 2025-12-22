quiet on
opendesign processor_DK.adf
acom divider.vhd
acom div_rem_wrapp.vhd
entity div_rem_wrapp
wave
wave *
asim -t 1ns -callbacks div_rem_wrapp 
run 10 us
endsim
quiet off
