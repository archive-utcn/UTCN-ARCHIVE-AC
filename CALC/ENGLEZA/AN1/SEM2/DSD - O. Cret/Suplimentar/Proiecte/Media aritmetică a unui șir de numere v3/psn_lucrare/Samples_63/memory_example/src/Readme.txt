						Memory Viewer example
					  =================================

I. DESCRIPTION

	This simple example allows you to get familiar with Active-HDL's Memory Viewer.
	The example shows how to open Memory View windows, add memory objects, 
	change the view of the window, or properties of observed signals.
	To start the example, please execute the runme.do macro.

COMPONENTS:
	
	ram - behavioral VHDL model of the 128 x 8Bits RAM memory

CONTROLS (Inputs):

	CLK - clock signal
	WE - write enable input (active High)
	ADDRrd [6..0] - address read input
	ADDRwr [6..0] - address write input
	DATA   [7..0] - data input

OUTPUTS:

	Q [7..0] - memory output

II. FILES added to design

source:

	ram.vhd - behavioral model of ram
	ram_tb.vhd - VHDL test bench
	
simulation macros:
	
	runme.do - compiles necessary files, performs functional simulation,
			and shows simulatio results

simulation results:

	ram_waveform.awf - waveform file with simulation results
	ram_mem.mem      - content of the memory saved in the Aldec Memory file (*.mem)

doc:

	Readme.txt

III. FUNCTIONAL SIMULATION

	To start simulation, execute the runme.do macro
								
	NOTE:
	During the simulation there is no necessary to press any buttons
	All messages will be displayed in the Console window 

IV. SIMULATION RESULTS

	The simulation results are saved in the ram_waveform.awf file.
	The content of the memory is saved in the ram_mem.mem file (Aldec Memory format file).
