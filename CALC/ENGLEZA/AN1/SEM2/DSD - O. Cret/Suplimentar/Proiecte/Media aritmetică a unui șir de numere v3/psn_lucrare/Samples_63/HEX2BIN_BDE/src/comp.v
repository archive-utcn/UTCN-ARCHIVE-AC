//--------------------------------------------------------------------------------------------------
//
// Title       : COMP
// Design      : HEX2BIN_BDE
// Author      : Aldec
// Company     : Aldec
//
//-------------------------------------------------------------------------------------------------
//
// File        : C:\2\HEX2BIN_BDE\src\COMP.v
// Generated   : Mon Jun 17 14:45:38 2002
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
//{module {COMP}}
module COMP ( CMP ,A ,B );

input [7:0] A ;
wire [7:0] A ;
input [7:0] B ;
wire [7:0] B ;

output CMP ;
wire CMP ;

//}} End of automatically maintained section

// -- Enter your statements here -- //

assign 
  CMP = &(~A ^ B);

endmodule
