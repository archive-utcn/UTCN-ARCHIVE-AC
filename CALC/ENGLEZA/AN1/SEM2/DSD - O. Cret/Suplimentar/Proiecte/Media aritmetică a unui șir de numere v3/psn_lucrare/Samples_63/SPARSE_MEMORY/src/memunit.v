`define MEMSIZE 67_108_864
module memunit; 

// without the /*sparse*/ pragma simulation 
// fails for insufficient system memory 
reg /*sparse*/ [31:0] bank0 [0:`MEMSIZE-1];
reg /*sparse*/ [31:0] bank1 [0:`MEMSIZE-1];
reg /*sparse*/ [31:0] bank2 [0:`MEMSIZE-1];
reg /*sparse*/ [31:0] bank3 [0:`MEMSIZE-1];
reg /*sparse*/ [31:0] bank4 [0:`MEMSIZE-1];
reg /*sparse*/ [31:0] bank5 [0:`MEMSIZE-1];
reg /*sparse*/ [31:0] bank6 [0:`MEMSIZE-1];
reg /*sparse*/ [31:0] bank7 [0:`MEMSIZE-1];
reg CLK;
reg END_SIM;

`include "load_code.v"

initial	begin
	END_SIM = 1'b0;
	CLK = 1'b0;
	load_code;
end

initial begin
	while (!END_SIM) begin
		#40;
		CLK = 1'b1;
		#40;
		CLK = 1'b0;	
	end
end

endmodule

