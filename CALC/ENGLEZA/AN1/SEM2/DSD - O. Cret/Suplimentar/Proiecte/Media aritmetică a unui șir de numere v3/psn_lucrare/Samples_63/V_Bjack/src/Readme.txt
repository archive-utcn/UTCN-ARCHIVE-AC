BJACK is a design of a machine playing the blackjack game.

	
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

	GATES.V with Verilog simple models for gates.	
	GEN.V a Verilog code of the pseudo-random number generator (from 1 to 11),
	MUX.V a macro of 2 to 1 multiplexer,
	JOHNSON8.V	an 8-bit Johnson counter,
	BJACK_C.v is the main control unit of the game machine,
	BIN2BCD.V   a 5-bit binary digit to two BCD number converter,
	BCD2LED.V a double BCD to 7-segment LED display converter.	
	V_BJACK.V is a top-level structural Verilog netlist
	TB.V - a testbench for V_BJACK.
	FUNCTIONAL.DO - a script file for compilation and simulation.
	PATTERN.FUN - an output text file with the simulation results.
	FUNCTIONAL.AWF is a waveform, saved after execution macro functional. 
    BJACKONTCLTK.TCL is a tcl script file for compilation and simulation.	
	Run_accelerated_waveform.do - a script for running simulatin with
	storing results into Accelerated Waveform.
	

			       
	
SIMULATION
	For functional simulation execute macro functional.do	
	Using this macro you can generate code coverage data. 	
	The simulation results are written to file 'Results.txt'   
	For Xtrace debug please execute macro Xtrace_debbug.do. 
	


