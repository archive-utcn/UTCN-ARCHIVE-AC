Cypress_refill is a sample design based on the guidelines
provided by the tutorial included in WARP 

-- Package: cy37256p208-154nc
-- Architecture: CY37256P208

DESCRIPTION:

	The goal of this design is to show how to use
	AVHDL for VHDL designs intended for Cypress.
	The design is based on original WARP files.
	The design contains the instantiation of cypress lpm :MAND

FILES:
	The design contains the following modules (files):
 Functional:
	BINCTR.VHD is a VHDL file with behaviral model of binctr component.
	REFILL.VHD is a top-level structural VHDL netlist
	REFILL_TB is a testbench for functional simulation.

 Timing:
	REFILL.VHD  is a structural VHDL program based on the PRIMITIVE library,
	REFILL_TB.HD is a testbench for timing simulation.
	
 Macros:
	FUNCTIONAL.DO is a script file for compilation and functional simulation.
	TIMING.DO is a script file for compilation and timing simulation.

 Simulation results:
	PATTERN.FUN is an output text file with the functional simulation results.
	PATTERN.TIM is an output text file with the timing simulation results.
    These files can be found in the CYPRESS_REFILL subfolder.  
	
For functional simulation execute macro functional.do
For timing simulation execute macro timing.do
Simulation results are stored to files functional.txt, timing.txt



  
