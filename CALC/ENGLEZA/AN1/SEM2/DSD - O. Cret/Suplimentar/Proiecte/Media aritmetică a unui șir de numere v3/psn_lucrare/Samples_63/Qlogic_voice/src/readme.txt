QLOGIC_VOICE is a sample design based on the guidelines
provided by the tutorial included in QuickWorks 

PART: QL2007 Package: Pq208

DESCRIPTION:
	The goal of this design is to show how to use
	Active VHDL for VHDL designs intended for QuickWorks.
	The timing simulation data has been produced by QuickWorks programs.
	Vital 3.0 Compliant simulation option has been selected. 

FILES:

 Functional:
	VOICEPKG.VHD  - package with constant declaration
	VOICE.VHD     - a top-level structural VHDL program
	VOICE_TB.VHD  - testbench for functional simulation
	
 Timing:
	VOICE_T.VHQ   - a structural VHDL program based on QLPRIMS library
	VOICE.SDF     - timing data for simulation
	VOICE_T_TB.VHD  - testbench for timing simulation

 Macros:
	FUNCTIONAL.DO - macro file for functional simulation
	TIMING.DO     - macro file for timing simulation
 

 Simulation results:
	PATTERN.FUN - an output file with the functional simulation results
	PATTERN.TIM - an output file with the timing simulation results

For functional pre-synthesis simulation execute macro functional.do.
The simulation results are written to file functional.txt

For timing post-implement simulation execute macro timing.do.
The simulation results are written to file timing.txt.



