This design shows implementation of a digital low pass filter.
The PLI interface is used for (VHDL, Verilog, EDIF)-C/C++ co-simulation.

The output value (NO) is described by the following Laplace transform:

NO(s)=NI(s)/(1+sT), where: T = 2^n/fi

The algorithm:
The design is based upon two programmable frequency dividers and one reversible counter.
A number representing the value of a digitized signal is passed to the NI input, which
controls the first frequency divider (PFDIV-U2). Thus, the frequency of the output
signal from the (PFDIV-U2) divider is a linear function of the NI value. The signal
is passed to the count-up input of the reversible counter RC that operates as an integrator.
The counter output (NO) controls the other programmable frequency divider (PFDIV-U4).
The output of the (PFDIV-U4) divider is connected to the countdown input of the reversible
counter, thus forming a feedback loop. Both frequency dividers are fed with clock
pulses of the same frequency but different phases. This prevents from occurring
impulses on the inputs of the reversible counter.

Design files:
- cb4ce.vhd - contains description of 4-bit binary counter in VHDL	
- pvdiv.vhd - top level file for programmable frequency divider described in VHDL
- and2.v, and3.v, and4.v, c2or.vhd - combinational and sequential modules of integrator described in Verilog and VHDL
- crv.bde - top level file for integrator described as an EDIF
- oscil_c_pli.v - wrapper for oscil_c_pli module written in Verilog, representing a state diagram
- filter.bde - file containing the top structure of the filter written VHDL
- filter_tb.vhd - file with the test bench written in VHDL

Folder PLI contains module oscil_c_pli written in C using PLI interface

The most important functions related to PLI interface:
	
- function : int oscil_c_pli_misctf (int user_data, int reason, int paramvc)
   a miscellaneous routine initializing the foreign interface and a callback function     called whenever oscil_c_pli input signals (CLK, CLR) change values.

- function : int oscil_c_pli_calltf (int user_data, int reason)
   a calltf function registering a callback function

- function : int oscil_interface_misctf (void)
   computes the actual values for oscil_c_pli module output signals (F0, F1)  

C Debug capabilities
 C-Debug folder contain files whit can be used for C debug tests
 Initialize_c_code_debug.do -scrip for initialization C debug session
 Gdb_command_usage.do  -script with C debug session using gdb commands