This design is a comparator that compares consecutive bits a0...a3 with b0...b3
The comparison result is indicated with signals:
-  K  = 1 ( A > B )
-- L  = 1 ( A < B )
-- M = 1 ( A = B )	
The algorithm:
1. Opening the stim.txt file with stimuli values.
2. The following is performed in a loop running until reaching the end of stim.txt:
    - Reading stimuli values and assigning them to signals A0...A3, B0...B3
    - Assigning the comparison result to signals K, L, M
3. Closing stim.txt and the end of the simulation.

Design files:
- gates.vhd - contains gates
- fub0.bde...fub5.bde - files of comparator structure
- SN7485_top.bde - file containing the top structure of the comparator
- SN7485_TOP_TB - file with the test bench with foreign attributes

Folder External contains modules written in C

The most important functions related to the foreign attribute:
	
- function FileOpen return boolean;
	opens a file with stimuli values a0...a3, b0...b3 (file stim.txt)

- function FileClose return boolean;
	closes file with stimuli values

- function FileEnd return boolean;
	returns true if the end of the stimuli file has been encountered

- function Stimulator return std_ulogic;
	returns a value from the stim.txt file

C Debug capabilities
 C-Debug folder contain files whit can be used for C debug tests
 Initialize_c_code_debug.do -scrip for initialization C debug session
 Gdb_command_usage.do  -script with C debug session using gdb commands
