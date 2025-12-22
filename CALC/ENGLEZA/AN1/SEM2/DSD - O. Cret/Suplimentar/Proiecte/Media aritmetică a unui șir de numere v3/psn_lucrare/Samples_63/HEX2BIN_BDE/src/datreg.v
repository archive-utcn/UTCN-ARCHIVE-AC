//--------------------------------------------------------------------------------------------------
//
// Title       : DATREG
// Design      : HEX2BIN_BDE
// Author      : Aldec
// Company     : Aldec
//
//-------------------------------------------------------------------------------------------------
//
// File        : C:\2\HEX2BIN_BDE\src\DATREG.v
// Generated   : Mon Jun 17 14:40:59 2002
// From        : interface description file
// By          : Itf2Vhdl ver. 1.20
//
//-------------------------------------------------------------------------------------------------
//
// Description : 
//
//-------------------------------------------------------------------------------------------------
`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {DATREG}}
module DATREG ( Q ,CLR ,CLK ,D ,DLE );

input CLR ;
wire CLR ;
input CLK ;
wire CLK ;
input [3:0] D ;
wire [3:0] D ;
input [1:0] DLE ;
wire [1:0] DLE ;

output [7:0] Q ;
reg [7:0] Q ;

//}} End of automatically maintained section

// -- Enter your statements here -- //
always @(posedge CLK or posedge CLR) begin
  if(CLR)
    Q = 8'b0;
  else begin	
    case(DLE)
      2'b00: Q = Q;
      2'b01: Q = {Q[7:4],D};
      2'b10: Q = {D,Q[3:0]};
      2'b11: Q = Q;
    endcase
  end
end

endmodule
