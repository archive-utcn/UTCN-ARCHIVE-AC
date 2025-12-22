-- OR GATE USING GENERIC
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity OR_gate is
--	generic (input_nr: natural:= 5);
--	port ( input: in bit_vector ( 1 to input_nr);
--	y: out bit);
--end OR_gate;
--
--architecture arh of OR_gate is	
--begin 							
--	process (input)
--	variable temp: bit;
--	begin
--		temp:= '0';
--		for i in 1 to input_nr loop
--			temp:= temp or input(i);
--		end loop;
--		y <= temp;
--	end process;
--end architecture arh;						  

-- AND GATE USING GENERICS
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity and_gate is
--	generic ( input_nr: natural:= 5);
--	port ( input: in bit_vector ( 1 to input_nr);
--		y: out bit);
--end and_gate;
--
--architecture arh of and_gate is
--begin 
--	process (input)
--	variable temp: bit;
--	begin
--		temp:='1';
--		for i in 1 to input_nr loop
--			temp:= temp and input(i);
--		end loop;
--		y <= temp;
--	end process;
--end architecture arh;

library ieee;
use ieee.std_logic_1164.all;
entity E1 is
	port (A: in NATURAL := 1;
		B : inout NATURAL := 1);
end entity E1;
architecture ARH1 of E1 is
begin
P1: process (A)
	begin
	 B <= A + 2;		
	 B <= B + 3;		
	 B <= B * 2;		
	 B <= B + 1; -- Numai aceast? ultim? asignare are loc
end process P1;
end architecture ARH1;
-- Rezolvarea problemei prin introducerea de variabile
architecture ARH2 of E1 is
begin
P2: process (A)
variable B_VAR: NATURAL;
	begin
	 B_VAR := A + 2;		
	 B_VAR := B_VAR + 3;		
	 B_VAR := B_VAR * 2;		
	 B <= B_VAR + 1; 
end process P2;
end architecture ARH2;


