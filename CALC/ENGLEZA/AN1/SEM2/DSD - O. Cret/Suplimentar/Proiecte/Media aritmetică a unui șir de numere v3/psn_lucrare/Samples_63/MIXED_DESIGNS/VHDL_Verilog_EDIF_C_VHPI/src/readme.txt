This design shows implementation of a digital low pass filter.
The VHPI interface is used for (VHDL, Verilog, EDIF)-C/C++ co-simulation.

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
- oscil_c_vhpi.vhd - wrapper for oscil_c_vhpi module written in VHDL, representing a state diagram
- filter.bde - file containing the top structure of the filter written VHDL
- filter_tb.vhd - file with the test bench written in VHDL

Folder VHPI contains module oscil_c_vhpi written in C using VHPI interface

The most important functions related to VHPI interface:
	
- function : PLI_VOID oscil_c_vhpi_proc(const struct vhpiCbDataS *cb_data_p)
   a routine initializing the foreign interface and registering a callback function called
   whenever oscil_c_vhpi input signals (CLK, CLR) change values.

- function : PLI_VOID SignalChangedEvent (const struct vhpiCbDataS * cbDatap)
   a callback function, which computes the actual values for oscil_c_vhpi module output signals (F0, F1)

C Debug capabilities
 C-Debug folder contain files whit can be used for C debug tests
 Initialize_c_code_debug.do -scrip for initialization C debug session
 Gdb_command_usage.do  -script with C debug session using gdb commands