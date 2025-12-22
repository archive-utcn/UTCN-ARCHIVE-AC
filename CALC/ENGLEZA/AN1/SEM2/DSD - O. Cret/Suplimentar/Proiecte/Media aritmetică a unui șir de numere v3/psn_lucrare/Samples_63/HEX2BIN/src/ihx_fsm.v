`timescale 1ns / 1ps
module IntelHEX (TDC, CLK, ISHEX, SC, EN, CLR, CLE, DLE, ALE, LRCLE, WR, DCE, CMP) ;

//state declarations
`define  IDLE   4'b0000        
`define  DCH    4'b0001
`define  DCL    4'b0010
`define  ADHH   4'b0011
`define  ADHL   4'b0100
`define  ADLH   4'b0101
`define  ADLL   4'b0110
`define  EMH    4'b0111
`define  EML    4'b1000
`define  DH     4'b1001
`define  DL     4'b1010
`define  MEMW   4'b1011
`define  LRCH   4'b1100
`define  LRCL   4'b1101
`define  CMPLRC 4'b1110

input TDC ;   //Terminal data count
input CLK ;   //
input ISHEX;  //ASCII character 0..9, A..F, :, space
input SC ;    //:  ASCII char
input EN ;    //Valid data on CHAR input (ASCII decoder)
input CLR ;   
output [1:0] CLE ;  //Count Latch Enable
output [1:0] DLE ;  //Data Latch Enable
output [3:0] ALE ;  //Address Latch Enable
output [3:0] LRCLE; //LRC Latch Enable
output WR ;   //Memory write signal
output DCE ;  //Data count enable
output CMP ;  //Compare LRC
reg [3:0] STATE,NEXT;  //internal state register (STATE) and internal combinatorial logic (NEXT)

//register
always @(posedge CLK or posedge CLR) 
begin
  if(CLR)
    STATE=`IDLE;
  else
    STATE=NEXT;
end    
  
//combinatorial logic
always @(STATE or TDC or ISHEX or SC or EN)
begin
//  if(CLR) NEXT=`IDLE;
//  else begin
  case (STATE)
    // synopsys full_case  
    `IDLE  : begin
              if (EN && SC) NEXT=`DCH;
              else NEXT=`IDLE;
            end  
    `DCH   : begin
              if (EN) begin
                if(ISHEX) NEXT=`DCL;
                else NEXT=`IDLE;
              end  
              else NEXT=`DCH;    
            end
    `DCL   : begin
              if (EN) begin
                if(ISHEX) NEXT=`ADHH;
                else NEXT=`IDLE;
              end  
              else NEXT=`DCL;    
            end
    `ADHH  : begin
              if (EN) begin
                if(ISHEX) NEXT=`ADHL;
                else NEXT=`IDLE;
              end  
              else NEXT=`ADHH;        
            end
    `ADHL  : begin
              if (EN) begin
                if(ISHEX) NEXT=`ADLH;
                else NEXT=`IDLE;
              end  
              else NEXT=`ADHL;        
            end
    `ADLH  : begin
              if (EN) begin
                if(ISHEX) NEXT=`ADLL;
                else NEXT=`IDLE;
              end  
              else NEXT=`ADLH;        
            end
    `ADLL  : begin
              if (EN) begin
                if(ISHEX) NEXT=`EMH;
                else NEXT=`IDLE;
              end  
              else NEXT=`ADLL;        
            end
    `EMH   : begin
              if (EN) begin
                if(ISHEX) NEXT=`EML;
                else NEXT=`IDLE;
              end  
              else NEXT=`EMH;        
            end
    `EML   : begin
              if (EN) begin
                if(ISHEX) begin
                  if(TDC) NEXT=`LRCH;
                  else NEXT=`DH;
                end
                else NEXT=`IDLE;
              end  
              else NEXT=`EML;     
            end
    `DH    : begin
              if (EN) begin
                if(ISHEX) NEXT=`DL;
                else NEXT=`IDLE;
              end  
              else NEXT=`DH;        
            end
    `DL    : begin
              if (EN) begin
                if(ISHEX) NEXT=`MEMW;
                else NEXT=`IDLE;
              end 
              else NEXT=`DL;        
            end
    `MEMW  : begin
              if(TDC) NEXT=`LRCH;
              else NEXT=`DH;
            end        
    `LRCH  : begin
              if (EN) begin
                if(ISHEX) NEXT=`LRCL;
                else NEXT=`IDLE;
              end  
              else NEXT=`LRCH;        
            end
    `LRCL  : begin
              if (EN) begin
                if(ISHEX) NEXT=`CMPLRC;
                else NEXT=`IDLE;
              end  
              else NEXT=`LRCL;                      
            end
    `CMPLRC: begin
              NEXT=`IDLE;
            end        
    default : NEXT=`IDLE;
  endcase    
end

assign CLE[1] = (STATE==`DCH) & EN;
assign CLE[0] = (STATE==`DCL) & EN;

assign ALE[3] = (STATE==`ADHH) & EN;
assign ALE[2] = (STATE==`ADHL) & EN;
assign ALE[1] = (STATE==`ADLH) & EN;
assign ALE[0] = (STATE==`ADLL) & EN;

assign DLE[1] = (STATE==`DH) & EN;
assign DLE[0] = (STATE==`DL) & EN;

assign LRCLE[3] = (STATE==`LRCH) & EN;
assign LRCLE[2] = (STATE==`LRCL) & EN;
assign LRCLE[1] = STATE[0] & EN & (STATE<=4'b1010);
assign LRCLE[0] = ~STATE[0] & EN & (STATE<=4'b1010) & (STATE>4'b0000);

assign WR  = ~(STATE==`MEMW);
assign DCE = (STATE==`DH) & EN;
assign CMP = (STATE==`CMPLRC);

endmodule 
