DESCRIPTION:

MATLAB_MIXED_EXAMPLE is simple DSP design using IIR filter and FFT components, 
written in different languages.

The purpose of this design is to demonstrate the use of 
Active-HDL CoSimulation Interface for Simulink(R).
Example uses multiple instantiations of Verilog and VHDL components on Simulink(R) diagram.

Matlab(R) and Simulink(R) software can be downloaded from MathWorks website www.mathworks.com.

Top-level block diagram is created using Simulink(R) block diagram editor. 
This diagram instantiates black-boxes of FFT and IIR filter.
FFT design is described in VHDL, one of IIR filters is implemented in Verilog, 
the other one is EDIF netlist after synthesis of the Verilog implementation.
It is synthesized for Xilinx device, virtex library is required to co-simulate this example

Workspace MATLAB_MIXED_EXAMPLE contains description of components used in Simulink(R) 
block diagram. It includes:
1. Biquad_IIR design containing description of the second order IIR filter.
It includes both Verilog and EDIF versions of filter.
2. FFT design containing descriptions of Complex FFT module, RAM memory to store FFT data 
and control logic responsible for proper FFT output data order. 
This design uses all design entries possible in Active-HDL: 
State Machine, Block Diagram Editor and Text Editor.

Simulink(R) design is a testbench for four IIR filters and two FFT blocks.
There are two band-pass filters, one uses Verilog description, the other uses EDIF.
Each of them is made with two single biquad sections, one high-pass and one low-pass.
Two FFT blocks process input and output signals of bandpass filter to produce their spectra. 

Sum of 64 sine harmonic waves of equal amplitudes is used as input signal for filter.
Output of the first FFT shows flat spectrum of this signal.
Output of the second FFT shows spectrum of output signal of bandpass filter,
and shows frequency response of this filter, since filter is fed with signal 
of flat amplitude spectrum.
										  

COSIMULATION:

To start cosimulation of this design, we need to create ALDEC Blockset compatible with 
Simulink Library browser, which will include Simulink(R) compatible models of our 
HDL components.

Please refer to On-Line Documentation, use keyword Simulink to find detailed description
of Simulink(R) Interface, including step by step instructions on how to use 
CoSimulation Wizard for Simulink.

Simulink blocks should be created for following modules:
1. fft (compiled to fft design library).
2. biquad (compiled to biquad_iir design library).
3. biquad (compiled to biquad_iir_post_synthesis design library).

Please be sure to keep settings below:

FFT:
	Clock Signal: 	clk
	CE signal:		ce
	

Biquad_IIR (for both Verilog and EDIF versions):
	Clock Signal: 	clk
	CE signal:		ce

	Ports x and yout: Fractional Part = 15
	Ports a11, a12, b10, b11, b12: Fractional Part = 7


All other port settings may be left default.

If you want to observe signals of HDL models used, select "Add Signals to Waveform" checkbox.
You will then be able to select ports and internal signals you want to observe during cosimulation. 

Please notice where destination folder is specified. By default, it points to "$WSP/Matlab" folder.

Once Simulink blocks for all modules mentioned above are created, invoke MATLAB and choose 
the Set Path option form the File menu. This option allows you to specify the path 
to the directory that you have specified in the Output Directory field of the Co-Simulation Wizard 
for Simulink window (by default, C:\My_Designs\Samples_61\MATLAB_MIXED_EXAMPLE\Matlab\). 
Click the Add Folder button and browse for Output Directory. Then, click OK. 
Choose the Save option and close the Set Path window by pressing the Close button.

Open matlab_mixed_cosim.mdl file in Simulink environment. Now simply Start simulation and observe results in 
either Active-HDL waveform or Simulink scopes.

For further information, refer to Active-HDL Online Documentation.

Possible modifications:

Biquad IIR filter:
	Filter coefficients are available as inputs so filter can be used as arbitrary filter,
	user decides what coefficients he wants to apply on Simulink level. 

FFT: 
	Top_FFT Block Dagram allows to configure data width and number of points.
	64, 256 and 1024 point FFT can be performed.
	It can also be used to perform Inverse FFT, using port "inv".


FFT and Biquad_IIR implementation are downloaded as an opencores from www.opencores.org
Refer to this sites for copyright notices.