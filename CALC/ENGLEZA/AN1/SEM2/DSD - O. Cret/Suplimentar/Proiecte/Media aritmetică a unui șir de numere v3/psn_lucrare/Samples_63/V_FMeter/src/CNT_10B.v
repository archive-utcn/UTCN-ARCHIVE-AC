`timescale 1ps / 1ps
module CNT_10B (CLK, RESET, ENABLE, FULL, COUNT);

input CLK;
input RESET;
input ENABLE;
output FULL;
output [9:0]COUNT;
					 
reg [9:0]COUNT_I;		   
reg FULL_I;

always @ (posedge CLK or posedge RESET)
begin
	if (RESET) // asynchronous reset		
	begin
		COUNT_I = 10'b0000000000;	   
		FULL_I = 1'b0;
	end
	else // active clock edge
	begin						 
		if (ENABLE)
		begin		   
			if (COUNT_I == 10'b1111111111)
				FULL_I = 1'b1;
			else
				COUNT_I = COUNT_I + 1;
		end 
	end
end

assign COUNT = COUNT_I;
assign FULL = FULL_I;

endmodule
