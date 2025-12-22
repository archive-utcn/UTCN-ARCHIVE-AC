`timescale 1ns / 1ps
module ADDR_CNT(Q,CLK,CLR,CE,ALE,D);

input CLK,CE,CLR;
input [3:0] ALE,D;
output [15:0] Q;
wire [3:1] CY;
reg NCE;

always @(posedge CLK or posedge CLR)
begin
  if (CLR)
    #1 NCE = 1'b0;
  else
    #1 NCE = ~CE;  
end 

CD4029 C0(Q[ 3: 0],CY[1],CLK,NCE  ,CLR,ALE[0],D);
CD4029 C1(Q[ 7: 4],CY[2],CLK,CY[1],CLR,ALE[1],D);
CD4029 C2(Q[11: 8],CY[3],CLK,CY[2],CLR,ALE[2],D);
CD4029 C3(Q[15:12],     ,CLK,CY[3],CLR,ALE[3],D);

endmodule

module CD4029(Q,CO,CLK,CE,CLR,LD,D);
input CLK,CLR,CE,LD;
input [3:0] D;
output CO;
output [3:0] Q;
reg [3:0] Q;

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
