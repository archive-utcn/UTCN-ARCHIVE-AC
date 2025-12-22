library ieee;
use ieee.std_logic_1164.all;

entity logic is 
	port(x0,x1,x2: in bit;
	y: out bit);
end logic;

architecture arh of logic is

	--STRUCTUTRAL 
--	component and_gate is
--		port (a,b :in bit;
--		y: out bit);
--	end component;
--	
--	component or_gate is
--	port ( a,b: in bit;
--	y: out bit);
--	end component or_gate;
--	
--	signal temp: bit;
--	begin	
--	l1: and_gate port map(x0,x1,temp);
--	l2: or_gate port map( temp, x2, y);	  

	--BEHAVIORAL
--		begin 
--		process(x0,x1,x2)
--		begin
--			y<=(x0 and x1) or x2;
--		end process;  


	-- DATA FLOW
	signal temp:bit;
	begin
		temp<= x0 and x1;
		y<= temp or x2;

end architecture arh;
