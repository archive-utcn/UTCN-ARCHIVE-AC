library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sau1 is 
	port(a,b:in std_logic;
	y:out std_logic);
end sau1;

architecture arh of sau1 is
begin
	process(a,b)
	begin
		y<=a or b;  
	end process;
end arh;