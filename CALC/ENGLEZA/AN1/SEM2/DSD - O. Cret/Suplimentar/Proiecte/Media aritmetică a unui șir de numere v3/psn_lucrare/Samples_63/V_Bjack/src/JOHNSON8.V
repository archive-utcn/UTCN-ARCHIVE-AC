`timescale 1ps / 1ps

// Verilog model of 8 bits Johnson's Counter with Asynchronous Reset

module JOHNSON8 (CLK, RESET, Q);
input  CLK;
input  RESET;
output [7:0]Q;

reg [7:0]Q_I;
reg tmp ;
integer I;

always @ (posedge CLK or posedge RESET)
begin
	if (RESET) // asynchronous reset
		for (I = 0; I <= 7; I = I + 1)
		   Q_I[I] = 1'b1;
	else // active clock edge
	begin
		tmp = ~Q_I[7];
		for (I = 7; I >= 1; I = I - 1) // shifting bits
			Q_I[I] = Q_I[I-1];
		Q_I[0] = tmp;			   // inverted feedback
	end
end

assign Q = Q_I;

endmodule
