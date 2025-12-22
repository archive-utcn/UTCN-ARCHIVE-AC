#
# 
#
 savealltabs
 quiet on
 acom "$DSN\src\functional\voicepkg.vhd"
 acom "$DSN\src\functional\voice.vhd"
 acom "$DSN\src\functional\voice_tb.vhd"
#
# 
 asim -advdataflow testbench TESTBENCH_FUNCTIONAL
 wave 
 wave CLK
 wave RST
 wave KEY_ENTERED
 wave PLAY
 wave SAVE
 wave ADDR
 wave ERASE
 wave REC
 run 780000 ps 
 endsim
 quiet off
#

