DESCRIPTION:
		This circuit converts data supplied in the Intel HEX format and writes it into
        a 64kB memory. The data is supplied byte by byte on the DI input. The arrival
        of each byte is synchronized by the active (high) value of EN. It is required
        that EN	remains high for no longer than one clock period and remains low for
        at least one clock period. The circuit generates all the signals required
        for writing to the memory. The LRC check is performed for each record cycle.
        If the calculated LRC is not equal to the LRC read from data downloaded data, 
		the ERR output turns HIGH until the next LRC check.
		The test vectors represent the following data records:
		:0200FF003C00C3
		:00000001FF
	
CONTROLS (Inputs):
	CLK	- external clock input,
	CLR	- initializes  FSM control
	DI	- 8 bit ASCII character input
	EN	- Valid data on DI (Should stay '1' no longer then one CLK period)
OUTPUTS:
	AB	- Memory address bus
	DB	- Memory data bus
	WR	- Memory write
	ERR	- LRC Error


SIMULATION:
        Design simulation can be done by execution run_me.do file, 
		Results can be observed on Console.  


