FIFO
DESCRIPTION:       
	16x32 FIFO with simultaneous read/write operations.
	TOP-LEVEL - fifo.bde schematic.
DESING TYPE: 
	XILINX  (library SPARTAN2)
CONTROLS:
	DIP[31:0] - data input,
	PUSHP - write-to-stack control
	POPP - read-from-stack control
	CLKP - clock
OUTPUTS:
	DOP[31:0] - data output
	FULLP - stack-full signal
	EMPTY - stack-empty signal
	LASTP - last-free-cell signal
OPERATION:
	This 16-cell 32-bit wide First-In-First-Out stack is designed with 
	SPARTAN2-specific dual port RAMs. When PUSHP is active, data from DIP
	pins is put on the stack on the CLKP transition fron low to high.
	When POPP is high, the first available data from stack is sent on the 
	DOP pins the rising CLKP edge. EMPTY goes high when to data is 
	available on the stack during read operation. LASTP high signals that
	there is only one cell available for writting, FULLP high means that
	FIFO cannot store more data. 
TIMINGS:
	FIFO_F.AWF - functional simulation results

