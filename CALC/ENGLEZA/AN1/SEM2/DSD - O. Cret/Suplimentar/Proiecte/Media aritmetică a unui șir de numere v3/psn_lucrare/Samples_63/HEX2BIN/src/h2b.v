`timescale 1ns / 1ps
module HEXBIN(CLK, CLR, EN, DI, DB, AB, WE, ERR);

input CLK,CLR,EN;
input [7:0] DI;
output [7:0] DB;
output [15:0] AB;
output WE, ERR;
wire [3:0]  DG,D,ALE,LRCE;
wire [1:0]  CLE,DLE;
wire SC,IHX,TC,DCE;

IntelHEX FSM(.CLK(CLK),.ISHEX(IHX),.TDC(TC),.SC(SC),.EN(EN),.CLR(CLR),
             .CLE(CLE),.DLE(DLE),.ALE(ALE),.LRCLE(LRCE),.WR(WE),
             .DCE(DCE),.CMP(CMP)) ;
ASCIIdec DEC(.CHAR(DI),.DIGIT(DG),.SC(SC),.ISHEX(IHX));
REG4     HDRG(.CLK(CLK),.EN(DLE[1]),.CLR(CLR),.D(DG),.Q(DB[7:4]));
REG4     LDRG(.CLK(CLK),.EN(DLE[0]),.CLR(CLR),.D(DG),.Q(DB[3:0]));
DAT_CNT  DTC(.CLK(CLK),.CLR(CLR),.CLE(CLE),.D(DG),.CE(DCE),.ZD(TC)) ;
ADDR_CNT ADRR(.CLK(CLK),.CLR(CLR),.Q(AB),.ALE(ALE),.CE(WE),.D(DG));
LRC      CHK(.CLK(CLK),.CLR(CLR),.D(DG),.LRCLE(LRCE[3:2]),
             .DEN(LRCE[1:0]),.CMP(CMP),.ERR(ERR));

endmodule
