FILTER is a design of filter implementation.
This design is based on example project attached to Celoxica DK Design Suite.

DESCRIPTION :

This design shows how Handel-C code is integrated within Active-HDL
You can import and build Handel-C project (receiver.hp) and co-simulate Handel-C model 
(receiver.hcc) with VHDL and Verilog units. After successful verification of Handel-C model
it can be converted to VHDL (receiver_hcc.vhd, receiver_top.vhd) or Verilog (receiver_hcc.v, receiver_top.v) using Celoxica flow in 
Design Flow Manager. 

INPUTS :
reset				asynchronous reset
DataIn[7:0]			input data to receiver
Volume				volume level
ReceiverClock		receiver clock
FilterClock			filter clock
INTERNAL SIGNALS :							   
FilterIn			input data to filter 
Rdy					Ready hand-shaking signal (receiver is ready to get new data)
Ack					Acknowledgement hand-shaking signal (filter acknowledge data from receiver)
OUTPUT :
DataOut[7:0]		output data from filter

FILES :  

Design contains the following files :

sine_lookup_pkg.vhd			package file with sine table
filter.vhd 					low-pass filter model in vhdl.
synchronizer.vhd			synchronizer model
top.bde						top level which instantiates receiver and filter units.
testbench.vhd				testbench file for co-simulation and simulation after c-based synthesis
runme_cosim.do				macro do file for compilation and HDL-Handel-C co-simulation
runme_functional.do			macro do file for compilation and simulation after c-based synthesis
runme_post-synthesis.do		macro file for compilation and post-synthesis simulation
runme_timing.do				macro file for compilation and timing simulation

files in Cosim folder:
receiver.hp					Handel-C project file
receiver.hcc				receiver model in Handel-C
receiver_top_wrapper.vhd	wrapper file for receiver instance.

files in Celoxica folder :
receiver_hcc.vhd			vhdl description of receiver unit (generated from Handel-C)
receiver_top.vhd			wrapper file for receiver_hcc.vhd (generated from Handel-C)

files in post-synthesis folder :
top.vqm						gate-level netlist file for implementation
top.vhm						simulation netlist file for post-synthesis simulation	


files in timing folder : 
top.vho						simulation netlist file for timing simulation
top_vhd.sdo					backannotated sdf file for timing simulation 

