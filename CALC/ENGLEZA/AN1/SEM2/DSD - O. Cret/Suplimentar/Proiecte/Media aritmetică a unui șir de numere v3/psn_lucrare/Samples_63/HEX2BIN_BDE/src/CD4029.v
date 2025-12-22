//--------------------------------------------------------------------------------------------------
//
// Title       : CD4029
// Design      : HEX2BIN_BDE
// Author      : Aldec
// Company     : Aldec
//
//-------------------------------------------------------------------------------------------------
//
// File        : c:\2\hex2bin_bde\src\CD4029.v
// Generated   : Mon Jun 17 15:13:27 2002
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
//{module {CD4029}}
module CD4029 ( LD ,CE ,Q ,CLR ,CO ,CLK ,D );

input LD ;
wire LD ;
input CE ;
wire CE ;
input CLR ;
wire CLR ;
input CLK ;
wire CLK ;
input [3:0] D ;
wire [3:0] D ;

output [3:0] Q ;
reg [3:0] Q ;
output CO ;
wire CO ;

//}} End of automatically maintained section

// -- Enter your statements here -- //

always @(posedge CLK or posedge CLR) begin
  if(CLR)
    Q = 4'd0;
  else begin
    if(LD)
      Q=D;    
    else begin
      if(CE)
        Q=Q + 4'd1;
    end
  end
end

and(CO,Q[0],Q[1],Q[2],Q[3],CE); 
endmodule
