The FREQ_METER design shows a simple frequency meter.

The purpose of this design is to demonstrate application of Block Diagram Editor 
for creation of synthesisable FPGA-based designs.
The testbench file reads stimulators and simulation patterns from an external text files.
The implementation was made using the Xilinx Foundation F1.5 software.

The designs uses all design entries supported by Active-HDL tools:
-VHDL Code
-Block Diagram
-State Machine Diagram

FUNCTIONAL DESCRIPTION

The frequency meter design is based on the BCD counter and 7-segment 
LED display.
The method of measurement is to compare input signal frequency with a reference
clock signal that is slower then measured signal.
To measure the input frequency you need to set START signal to 1 logical value 
and hold it, setting START back to 0 logical value finishes the measurement 
and resets the meter for the next measurement cycle.

The design contains the following blocks:
HEX2LED - 7 segments display converter; 4 instances
CNT_BCD - 4 decades of the synchronous BCD counter
CONTROL - frequency meter control state machine


INPUTS:	
F_INPUT   - measured signal frequency
F_PATTERN - reference clock signal
START     - high logical value ("1") starts processing
RESET     - sets the control module to its initial state

OUTPUTS:
LED_A(6:0) - LED_D(6:0) - signals that control four 7-segment 
LED displays
																		 

FILES:
The design contains the following resource files:

hex2led.vhd  - model of 4-bit BCD to 7-segments display decoder 
control.asf  - frequency meter control state machine
and2.vhd     - 2 inputs AND logical gate
cnt_4b.vhd   - model of 4-bit decimal synchronous counters with carry out output
CNT_BCD.bde  - diagram for 4 decades of the synchronous BCD counter
CNT_BCD2.bde  - second architecture for CNT_BCD, contains processes and concurrent statements instead instantations
CNT1.vhd     - process CNT1 from CNT_BCD2.bde declared as external file
freq_top.bde - diagram for top-level of the frequency meter design 

testbench_cnt_bcd_conf.vhd - configuration file, set proper architectures of components used on design.
			  
FILES INSIDE THE TESTBENCH FOLDER:
TestBenchPack.vhd - VHDL package with the following procedures used in the testbench:
		   - reading stimulus and simulation patterns from text files 
	           - comparing actual simulation results with the pattern 
testbench.vhd     - the main testbench file
golden.vec	  - text file with the simulation pattern
stimulus.vec	  - text file with stimulators		
runme.do          - Active-HDL macro for the simulation of the design

CONFIGURATION EXAMPLE
To change the CNT_BCD architecture, use Design Browser>Structure window.
Select the CNT_BCD from "testbench_cnt_bcd_conf" top level.
Use "Select Architecture/Configuration" feature.  
File "testbench_cnt_bcd_conf.vhd" will be automatically updated. 

SIMULATION
To simulate the design functionally, execute the TestBench\runme.do macro.

