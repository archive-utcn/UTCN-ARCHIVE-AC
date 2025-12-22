DESCRIPTION:
	HEX2BIN design with RAM module
	SystemC with Verilog and VHDL testbenches

	INPUTS:
		CLK - clock signal
		CLR - clear
		EN - enable
		C0 - ram's output enable
		DUMP_RAM - dumps memory to file
		CHR - hex character input

	OUTPUTS:
		WR - read/write ram
		ERR - error signal
		ADDR - ram address bus
		DATA - ram data bus

SIMULATION:
	To run using Verilog testbench use run_ver.do, for VHDL testbench use run_vhd.do

FILES LIST:
	- systemc/comp.cpp				SystemC file
	- systemc/comp.h                SystemC file
	- systemc/hex2bin.cpp			SystemC file
	- systemc/hex2bin.h				SystemC file
	- systemc/simprims.cpp			SystemC file
	- systemc/simprims.h			SystemC file
	- sc_top.cpp					SystemC file
	- hex_ram.dlm           		SystemC Configuration file 
	- testbench.v   	        	Verilog testbench
	- testbench.vhd					VHDL testbench
DO FILES:
	- run_ver.do - macro for the simulation of the design with Verilog testbench
	- run_vhd.do - macro for the simulation of the design with VHDL testbench

PATTERN FILES:
	- ram_dump - memory dump after end of conversion
	- results_ver.txt - SystemC-Verilog simulation results
	- results_vhd.txt - SystemC-VHDL simulation results
