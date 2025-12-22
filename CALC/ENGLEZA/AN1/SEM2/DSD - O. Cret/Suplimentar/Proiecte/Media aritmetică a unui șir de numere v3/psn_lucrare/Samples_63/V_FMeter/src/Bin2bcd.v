`timescale 1ps / 1ps
module BIN2BCD (CLK, ENABLE, RESET, BIN, BCD_T, BCD_H, BCD_D, BCD_U);

input CLK;
input ENABLE;
input RESET;
input [9:0]BIN;        
output [3:0]BCD_T;        	
output [3:0]BCD_H;
output [3:0]BCD_D;
output [3:0]BCD_U;

integer CNT;
reg [15:0]BCD;
reg [9:0]BIN_INPUT;
reg [3:0] BCD_T_I, BCD_H_I, BCD_D_I, BCD_U_I;

function [3:0]CORRECT ;
		//The CORRECT function adds 3 when the number is equal or more then 5	
input [3:0]DECADE;
begin				
	CORRECT = (DECADE >= 5) ? (DECADE+3) : (DECADE);
end
endfunction		

always @ (posedge CLK or posedge RESET)
begin
	if (RESET) // asynchronous reset		
	begin 
		//conversion takes 10 clock cycles
		CNT = 11;
		BCD = 16'b0000000000000000;
		BIN_INPUT = 11'b0000000000;
   		BCD_T_I = 4'b0000;		
  	    BCD_H_I = 4'b0000;
        BCD_D_I = 4'b0000;
        BCD_U_I = 4'b0000;						
	end
	else // active clock edge)
	begin
		if (ENABLE)
		begin
			if (CNT == 11) 
			begin
				//start conversion; latch input BIN number
				BIN_INPUT = BIN;		
				CNT = CNT - 1;			
			end 
			else if (CNT == 0)
			begin
				//end of conversion; latch BCD outputs
   	    		BCD_T_I = BCD[15:12];		
	    	    BCD_H_I = BCD[11:8];
		        BCD_D_I = BCD[7:4];
		        BCD_U_I = BCD[3:0];			
			end
			else	
			begin
				//correction of each BCD tetrade: adding 3 befor shifting
				//below 4 lines are synthesized as 4 identical combinatorial blocks
				//each block implements CORRECT functionality					
				BCD[3:0] = CORRECT(BCD[3:0]);
				BCD[7:4] = CORRECT(BCD[7:4]);
				BCD[11:8] = CORRECT(BCD[11:8]);
				BCD[15:12] = CORRECT(BCD[15:12]);		
			
				//conversion section													
				CNT = CNT - 1;
				//shift one bit left the BCD register
				BCD = (BCD << 1);
				//MSB bit of BIN is shifted as LSB of BCD
				BCD[0] = BIN_INPUT[9];
				//shift one bit left the BIN_INPUT number  
				BIN_INPUT = BIN_INPUT << 1;
			end
		end
	end				
end					   
assign BCD_T = BCD_T_I;	  
assign BCD_H = BCD_H_I;
assign BCD_D = BCD_D_I;
assign BCD_U = BCD_U_I;
endmodule


