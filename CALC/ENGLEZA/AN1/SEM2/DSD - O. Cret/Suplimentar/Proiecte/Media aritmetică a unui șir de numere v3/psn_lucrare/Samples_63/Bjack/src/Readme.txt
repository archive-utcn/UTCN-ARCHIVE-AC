BJACK is a design of a machine playing the blackjack game.

DESCRIPTION:
	The testbench simulates three games:

	I - starts at 625 ns (START=0)
	cards: 5, 5, 10
	the result: 20, (HOLD=1)
	
	II- starts at 4975 ns (START=0)
	cards: 7, 5, 10
	the result: 22, (BUST=1)	 
	
	III - start at 6480 ns(START=0)
	cards: 4, 9, 4
	the result: 17, (HOLD=1)
	
OPERATION:
	The game is started by applying the Low state to the START.
	Applying the Low state to the NEW_CARD input selects a new card. 
	The 7-segment LED displays show the subsequent card.
	When the game is over, the displays show the current hand count.
	If the game is lost, the displayed count is flashing.
	
	CONTROLS (Inputs):
	START - starts a new game
	NEW_CARD - asks for an additional card
	GEN_RES - resets the card sequence generator
	GEN_CLK, SYS_CLK - clock inputs

	OUTPUTS:
	HOLD - signal 'enough cards'
	BUST - signal 'bust of the hand'
	LEDS[7:0] - the number of cards on hand (8 LEDs signal)
	L_L[6:0], L_H[6:0] - signals for 7-segment LED displays showing the
        current hand count.
	D_L[3:0], D_H[1:0] - BCD signals showing the current hand count

FILES:
	The design contains the following modules (files):
	GATES.VHD with VHDL components: 
		a pseudo-random number generator (from 1 to 11),
		a macro of 2 to 1 multiplexer,
		an 8-bit Johnson counter,
	    simple models for gates.	
	BJACK_C.ASF is the main control unit of the game machine. 
                This is an example of the hierarchical fsm.
    DISP_UNITS.VHD with VHDL components:
	   a 5-bit binary digit to two BCD number converter,
	   a double BCD to 7-segment LED display converter.	
	BJACK.VHD is a top-level structural VHDL netlist
	TESTBENCH.VHD - a testbench for BJACK.
	FUNCTIONAL.DO - a script file for compilation and simulation.
	PATTERN.FUN - an output text file with the simulation results.		
			      This file can be found in the BJACK design subfolder. 
	FUNCTIONAL.AWF is a waveform, saved after execution macro functional. 
	BJACKONTCLTK.TCL is a tcl script file for compilation and simulation.	
	Run_accelerated_waveform.do - a script for running simulatin with
	storing results into Accelerated Waveform.
	

SIMULATION
	For functional simulation execute macro functional.do
	Using this macro you can genrate codecoverage data.	
	The simulation results are written to file Results.txt.	 


