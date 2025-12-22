ATMEL_AVERAGER is a sample design based on the guidelines
provided by the tutorial included in ATMEL IDS 5.0

PART: AT40K10-2AJC

DESCRIPTION:

	The goal of this design is to show how to use Active-HDL
	for VHDL designs intended for ATMEL.
	The timing simulation data has been produced by ATMEL programs
	(using VHDL sources form ATMEL examples directory).
	

FILES:
 Functional:
	AVERAGER.VHD     - a top-level structural VHDL program
	AVER_TB.VHD      - testbench for functional simulation
 
 Timing:
    ASA_A.VHD      -  file corresponding to the component generated 
                      using the Macro Generators.
    ASA_B.VHD      - file corresponding to the component generated 
                      using the Macro Generators.
    ASA_C.VHD      -  file corresponding to the component generated 
                      using the Macro Generators.
	AVERAGER.VHD   - a structural VHDL program based on AT40K library
	AVERAGER.SDF   - timing data for simulation
	POST_TB.VHD    - testbench for timing simulation

 Macros:
	FUNCTIONAL.DO - macro file for functional simulation
	TIMING.DO     - macro file for timing simulation
 

 Simulation results:
	PATTERN.FUN - an output file with the functional simulation results
	PATTERN.TIM - an output file with the timing simulation results
				  These files can be found in the ATMEL_AVERAGER subfolder.
				  
For functional pre-synthesis simulation execute macro functional.do.
The simulation results are written to file functional.out.

For timing post-implement simulation execute macro timing.do.
The simulation results are written to file timing.out.





