task load_code;	
integer i;
integer fd;
reg[31:0] str;
begin
	i = 0;
	fd = $fopen("code.txt", "r");
	while ($fgets(str, fd)) begin
		@(posedge CLK) begin
			bank1[i]=str;
			i=i+1;
		end
	end
	$fclose (fd);
	END_SIM = 1'b1;
end
endtask	
