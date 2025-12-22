####################################################################
##                  Memory Viewer example stript                  ##
####################################################################

# Preparing to scripting 
SetActiveLib -work 
set delay 5
cd $dsn\src
acom $dsn\src\ram.vhd 
acom $dsn\src\ram_tb.vhd 
asim TESTBENCH_FOR_ram -ieee_nowarn +no_tchk_msg

# Main script
clear 
@echo "###############            .:START SCRIPT:.            ###############"
@echo "###############         Opening waveform window        ###############"
wave 
wave -noreg CLK
wave -noreg WE
wave -noreg ADDRrd
wave -noreg ADDRwr
wave -noreg DATA
wave -noreg Q
wave /Memory/ram_mem
@pause 2
@echo ""
@echo ""
@echo "###############          Memory initialization         ###############"
@pause 2
run 1280 ns
@pause 2
@echo ""
@echo ""
@echo "###############        Memory Viewer window for        ###############"
@echo "###############        '/Memory/ram_mem' signal        ###############"
mem /Memory/ram_mem
@pause $delay
@echo ""
@echo ""
@echo "###############           Radix modification           ###############" 
mem -addressradix hex -cols 1 -valueradix bin /Memory/ram_mem
@pause $delay
@echo ""
@echo ""
@echo "###############  Reading memory: ADDRrd <= "0000011"   ###############" 
@echo "###############      'Q': 00000011, Time: 1285ns       ###############"
run 5ns
@pause $delay
run 10 ns
@echo ""
@echo ""
@echo "###############  Writing memory: ADDRwr <= "0001111"   ###############"
@echo "###############        DATA: 0xFF, ADDRrd: 0x07        ###############"
@echo "###############       Q: 00000111, Time: 1315ns        ###############"
run 20 ns
@pause $delay
run 15 ns
@echo ""
@echo ""
@echo "###############        Writing 'ram_mem' signal        ###############"
@echo "###############      to Aldec Memory file (*.mem)      ###############"
@pause 2
mem
mem -valueradix bin -from 0 -to 127 -notation unsigned /Memory/ram_mem 
write mem -mem -range 0 127 ram_mem.mem
@echo ""
@echo ""
@echo "############### 'ram_mem signal' has been successfully ###############" 
@echo "###############     dumped to the ram_mem.mem file     ###############"
@echo
@pause $delay
@echo ""
@echo ""
@echo "###############       Close Memory Viewer window       ###############"
close -mem
@pause $delay
@echo ""
@echo ""
@echo "###############  Reading 'ram_mem' contents form file  ###############"
open -mem ram_mem.mem
@pause $delay
@echo ""
@echo ""
@echo "###############    Opening new Memory Viewer windows   ###############" 
@echo "###############  for 'Q', 'DATA' and 'ADDRrd' signals  ###############"
mem
mem -cellreverseorder -valueradix bin -merge 8 Q
@pause 2
mem
mem -addressreverseorder -valueradix hex -merge 4 DATA
@pause 2
mem
mem -addressreverseorder ADDRrd
@pause 2
@echo ""
@echo ""
@echo "###############   For more options of Memory Viewer  ###############"
@echo "###############      type in console:  help mem      ###############"
@echo "###############            .:END SCRIPT:.            ###############"