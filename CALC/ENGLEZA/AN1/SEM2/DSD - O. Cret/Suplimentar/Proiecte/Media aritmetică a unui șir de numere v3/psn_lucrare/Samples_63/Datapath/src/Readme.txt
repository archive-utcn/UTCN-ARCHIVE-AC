DATAPATH is a design that shows the data path in a hypothetical device.

The purpose of this design is to demonstrate application of Block Diagram Editor 
for creation of synthesisable FPGA-based designs.

The designs uses all design entries supported by Active-HDL tools:
-VHDL Code
-Block Diagram
-State Machine Diagram

FUNCTIONAL DESCRIPTION

The device processes (adds and subtracts) two sequences of numbers, for each sequence
the separated numbers (sums) are created.
Next, numbers are compared with each other, the bigger one is a result of the processing.

INPUTS:	
DATA_IN(SIZE:0) - input data bus, SIZE: specifies its width
CODE(11:0) - specifies the amount of counted digits:
	CODE(11:8) 	- the amount of numbers in the first sequence (numbers will be added)
	CODE(7:4)	- the amount of clock events between the first and the second sequence
	CODE(3:0)	- the amount of numbers in the second sequence (numbers will be added, and then subtracted)
START - high logical value ("1") starts processing
RESET - resets all data flow registers and sets the control module to its initial state
CLK - clock signal

OUTPUTS:
DATA_OUT(SIZE:0) - data output 
OVL - high logical value ("1") indicates the arithmetical operation overflow
																		 

FILES:
	The design contains the following resource files:

	ADDSUB.vhd		- N-bit adder-subtractor model
	REG.vhd			- N-bit register with parallel input and reset model
	MUX.vhd			- N-bit multiplexer from 2 to 1 model
	REGS.bde		- diagram for two N-bit registers with the register select input
                                  a part of the DATAPATH module 
	COMP.bde		- diagram for the comparator module comparing two N-bit numbers with latch enabled,
                                  a part of the DATAPATH module
	ALU.bde			- diagram for the N-bit adder/subtractor
                                  a part of the DATAPATH module 
	DATAPATH.bde	        - diagram for the DATAPATH module  
	CONTROL.bde		- diagram for the CONTROL module
	CONTROL_asf		- state machine for the CONTROL module
	COUNTER.vhd		- 4-bit binary counter model, a part of the CONTROL module
	TOP.bde			- top-level diagram of the entire device
	TESTBENCH.vhd	        - testbench file for the design
	
	runme.do		- Active-HDL macro for the simulation of the design

SIMULATION
	To simulate the design functionally, execute the runme.do macro.
	

