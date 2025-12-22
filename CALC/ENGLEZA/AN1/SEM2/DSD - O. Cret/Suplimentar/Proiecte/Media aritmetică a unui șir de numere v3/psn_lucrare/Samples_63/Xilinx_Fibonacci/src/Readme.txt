                            Fibonacci Generator.
                      =================================

I. DESCRIPTION

	This is a simple pseudo-random number generator.
	Each number is a sum of the two previous: Fn = Fn-1 +  Fn-2.
	For example, if the two first numbers are 0 and 1, the generated sequence is:
         0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
	Note that if the two first numbers are zeros, the generator will not start.

  
COMPONENTS:
		
	FIB  -  Fibonacci Generator (behavioral VHDL model)

CONTROLS (Inputs):
	RESET   - asynchronous reset (active Low) - the Fibonacci Generator
		  starts from the initial values (0 and 1),
	ENABLE  - clock enable (active Low) - disables
		  the Fibonacci Generator (the numbers are not generated).
    CLK    - clock signal 
OUTPUTS:
	FIBO  [7..0]  - generated number (binary);
	DISPA [6..0] - 7-segment display - more significant four bits,
	DISPB [6..0] - 7-segment display - less significant four bits.


II. FILES added to design
source:
	testbench.vhd - VHDL test bench
	functional\fib.vhd - Fibonacci generator behaviral code
	functional\top.vhd - Fibonacci generator top-level code
	functional\functional_cfg.vhd - configuration for functional simulation
	
	timing\top_routed.vhd - post P&R structural code
	timing\top_routed.vhd - timing data for simulation
	timing\timing_cfg.vhd - configuration for timing simulation
	
simulation macros:
	macro\functional.do
		- compiles necessary files and perform functional simulation
	macro\timing.do
		- compiles necessary files and perform timing simulation		

simulation results:
	pattern.fun - functional simulation results
	pattern.tim - timing simulation results

DOC
	readme.txt
	
III. FUNCTIONAL SIMULATION

	For functional simulation select as top level:
	test_bench - functional_arch.
NOTE:
	Do not use unconditional Simulation/Go command. If you do so you will have to
	break the simulation (Simulation/Break command).
 

IV. TIMING SIMULATION
	For timing simulation select as top level:
	test_bench - timing_arch.
	Load a SDF file during initialization.
NOTE:
	Do not use unconditional Simulation/Go command. If you do so you will have to
	break the simulation (Simulation/Break command).


	The project (fib.vhd, top.vhd) has been synthesized and implemented into
	Xilinx v50bg256-4 device.
	The timing simulation data have been produced by Xilinx VHDL
	ngd2vhdl program:
	top_routed.vhd - a structural VHDL program based on the SIMPRIM
			 (Xilinx Primitives Library) library. 
	top_routed.sdf - timing data for simulation
	
	
VI. SIMULATION RESULTS
	There are two files with the simulation results (run 10 us):

	PATTERN.fun - an output text file with the simulation results for
		     functional simulation.
	PATTERN.tim - an output text file with the simulation results for
		 timing simulation.
 
	The testbench writes results into files:
	Functional.txt
	Timing.txt
	
