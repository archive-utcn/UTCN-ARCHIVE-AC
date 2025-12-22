module oscil (CLK, CLR, F0, F1);
	input CLK;
	input CLR;
	output F0;
	output F1;
	reg [2:0] Q;

	and and1 (F1,  Q[0], Q[1], CLK);
	and and2 (F0, Q[0], CLK, Q_1);
	not not1 (Q_1, Q[1]); 

	always @(negedge CLK or posedge CLR) begin
		if (CLR) Q = 'd0;
		else Q = Q + 'd1;
	end
endmodule 

