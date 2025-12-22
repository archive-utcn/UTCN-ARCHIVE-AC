	library ieee;
	use ieee.std_logic_1164.all;
	
	entity and_gate is
		port (a,b :in bit;
		y: out bit);
	end and_gate;
	
	architecture arh of and_gate is
	begin 
		y<= a and b;
	end architecture arh;
	