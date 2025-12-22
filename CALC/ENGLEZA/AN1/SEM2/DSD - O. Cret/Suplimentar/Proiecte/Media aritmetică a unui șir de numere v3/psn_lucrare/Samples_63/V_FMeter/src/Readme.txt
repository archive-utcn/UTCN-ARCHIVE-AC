The FREQ_METER design shows a simple frequency meter.

The designs uses some design entries supported by Active-HDL tools:
-Verilog Code
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
CNT_10b - 4 decades of the synchronous BCD counter
BIN2BCD - converter BIN to BCD
CONTROL - frequency meter control state machine


INPUTS:	
F_INPUT   - measured signal frequency
F_PATTERN - reference clock signal
START     - high logical value ("1") starts processing
RESET     - sets the control module to its initial state

OUTPUTS:
LED_A(6:0) - LED_D(6:0) - signals that control four 7-segment 
LED displays   
FULL      - signal indicates '1' when counter is full  
																		 

FILES:
The design contains the following resource files:

hex2led.v  - model of 4-bit BCD to 7-segments display decoder 
control.asf  - frequency meter control state machine
	       This is an example of the hierachical state machine.   		
cnt_10b.v   - model of 10-bit decimal synchronous counters with carry out output
bin2bcd.v   - converter 10-bit bin to 4-bit bcd decades 
freq_m.bde  - diagram for top-level of the frequency meter design 
			  
TESTBENCH :

Frequency_meter_TB.v  - the main testbench file
functional.do         - Active-HDL macro for the simulation of the design

SIMULATION
To simulate the design functionally, execute the functional.do macro.
	

