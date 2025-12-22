//--------------------------------------------------------------------------------------------------
//
// Title       : DAT_CNT
// Design      : HEX2BIN_BDE
// Author      : Aldec
// Company     : Aldec
//
//-------------------------------------------------------------------------------------------------
//
// File        : C:\2\HEX2BIN_BDE\src\DAT_CNT.v
// Generated   : Mon Jun 17 15:00:14 2002
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
//{module {DAT_CNT}}
module DAT_CNT ( CE ,CLR ,CLK ,D ,CLE ,ZD );

input CE ;
wire CE ;
input CLR ;
wire CLR ;
input CLK ;
wire CLK ;
input [3:0] D ;
wire [3:0] D ;
input [1:0] CLE ;
wire [1:0] CLE ;

output ZD ;
wire ZD ;

//}} End of automatically maintained section

// -- Enter your statements here -- //
reg [5:0] Q;

always @(posedge CLK or posedge CLR) begin
  if(CLR)
    Q = 6'd0;
  else begin  
    casex({CLE,CE})
      //3'b000: Q=Q;
      3'b001: Q=Q-1;
      3'b01?: begin
                Q[3:0]=D[3:0];
                //Q[5:4]=Q[5:4];
	      end
      3'b10?: begin
               //Q[3:0]=Q[3:0];
               Q[5:4]=D[1:0];
              end
      //3'b11?: Q=Q;          
    endcase
  end  
end

assign ZD=(Q==0);
endmodule
