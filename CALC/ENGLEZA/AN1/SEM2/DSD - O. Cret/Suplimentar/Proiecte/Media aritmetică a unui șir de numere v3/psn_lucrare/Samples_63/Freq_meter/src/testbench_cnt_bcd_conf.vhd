configuration testbench_cnt_bcd_conf of testbench is
for stimulusfromfile
	for UUT : freq_top 
		use entity work.freq_top (freq_top);
		for freq_top
			for U1 : cnt_bcd 
				use entity work.cnt_bcd (cnt_bcd);
			end for;
			for U2 : hex2led 
				use entity work.hex2led (hex2led);
			end for;
			for U3 : hex2led 
				use entity work.hex2led (hex2led);
			end for;
			for U4 : hex2led 
				use entity work.hex2led (hex2led);
			end for;
			for U5 : hex2led 
				use entity work.hex2led (hex2led);
			end for;
			for U0 : control 
				use entity work.control (control_arch);
			end for;
		end for;
	end for;
end for;
end testbench_cnt_bcd_conf;
