The sample contains eight large memory blocks declared with  the  /*sparse*/
pragma. (The /*sparse*/ pragma was introduced in Active-HDL 6.1 )

	`define MEMSIZE 67_108_864	
	reg /*sparse*/ [31:0] bank0 [0:`MEMSIZE-1];
	reg /*sparse*/ [31:0] bank1 [0:`MEMSIZE-1];
	// ...
	reg /*sparse*/ [31:0] bank7 [0:`MEMSIZE-1];

The simulator allocates system memory for an element  of  a  sparse  Verilog
memory  only  when  that  element  is  accessed  during simulation.  If  the
simulation accesses  only  a  small number of elements in the memory,  using
the /*sparse*/ pragma can significantly reduce the amount  of  system memory
needed for simulation. 

The code.txt file  in  the  sample  is  loaded  to  bank0  starting  at  the
0x0000000 address.  The  upper range of bank0 is not used.  Because  of  the
/*sparse*/ pragma the simulator never allocates memory  for  the unused area
of bank0. Memory banks 1 through 7 which are not accessed by this simulation
do not consume system resources at all.

The /*sparse*/ pragma should be used for memories which are at least  a  few
MB  large  and  are  only  sparsely  accessed  by  the  simulation.  If  the
/*sparse*/  pragma is omitted,  the  simulator has to allocate system memory
for  such memory units at simulation start-up.  Memory cannot be freed until
simulation is over. This puts a heavy strain on system resources.

To  limit  the  resource usage  you  might modify the Verilog code depending
on  the  amount  and  location  of  data accessed  in  the  memory.  This is
error-prone,  inconvenient  and  requires  recompilation.  If  you  use  the
/*sparse*/ pragma, the simulator does the job for you. 

Do not use the /*sparse*/ pragma for memories which are not sparse (i.e. the
simulation will access a large percentage of memory objects). The /*sparse*/
pragma will not then save  any  system memory  (it will only postpone memory
allocation). Simulation performance will, however, be degraded.

 __________________________________________________________________________
|                                                                          |
| NOTE: Sparse memories cannot be displayed in graphical tools such as the |
| Waveform Viewer  or accessed by the scripter                             |
| (for example with the examine command).                                  |
|__________________________________________________________________________|




