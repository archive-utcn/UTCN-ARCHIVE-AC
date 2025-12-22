`timescale 1ps / 1ps
module HEX2LED (HEX, LED);		   
input [3:0]HEX;
output [6:0]LED;

// segment encoding
//      0
//     ---  
//  5 |   | 1
//     ---   <- 6	  
//  4 |   | 2
//   ---
//    3
	  
assign LED =(HEX == 4'b0001) ? 7'b1111001 :	 // 1
			(HEX == 4'b0010) ? 7'b0100100 :	 // 2
			(HEX == 4'b0011) ? 7'b0110000 :	 // 3
			(HEX == 4'b0100) ? 7'b0011001 :	 // 4
			(HEX == 4'b0101) ? 7'b0010010 :	 // 5
			(HEX == 4'b0110) ? 7'b0000010 :	 // 6
			(HEX == 4'b0111) ? 7'b1111000 :	 // 7
			(HEX == 4'b1000) ? 7'b0000000 :	 // 8
			(HEX == 4'b1001) ? 7'b0100000 :	 // 9
			7'b1000000;                       // 0

endmodule