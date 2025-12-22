//Simple design that uses PLI functions $read_byte_ex
`timescale 1ps / 1ps
module UUT_PLI;

reg  [7:0]  DI,Byte;
reg  CLK,EN,CLR,CE;
reg  Eof;
wire [15:0] AB;
wire [7:0]  DB;
wire WR,ERR;
reg [10:0] stc,stch;


integer f,f1;


DAC_SC1 CNV (.CLK(CLK),.EN(EN),.CLR(CLR),.DI(DI),.DB(DB),.AB(AB),.WE(WR),.ERR(ERR));

initial begin
  Eof = 1'b0;
  CLK = 1'b0;
  DI  = 8'h25;
  EN  = 0;
end

initial begin	
  #0;
  stc = 11'd0;
  CLR = 1'b1;
  #40 CLR = 1'b0;       
end

always
  #10 CLK = ~CLK;      

always begin
  if(!CLR) begin
    $read_byte_ex(".\\DATA1.HEX",DI,Eof);
	#5 EN = 1'b1;
    #15 EN = 1'b0;  
    #20;
  end
  else
    #1;  
end


//Eof check
always @(Eof)
  if(Eof) begin
    $display("Reached EOF symbol...simulation will be terminated after 20ps");
    #20 $display("Simulation finished!");
	$finish;
  end


initial begin
   f=$fopen("results_pli.txt");   
   f1=$fopen("mem_wr.dat");
   $display("File log enabled...");
   $fdisplay(f1," Address -> Data (Time)");
   //Enable this line if you'd like to see results on console
   //f=f+1;
   $fmonitor(f,"%d %d %d | %h | %h | %h | %b | %b",$time,CLK,EN,DI,AB,DB,WR,ERR );
end

always @(WR)
  if(WR==1'b0)
    $fdisplay(f1," %h -> %h (%d)",AB,DB,$time);

endmodule