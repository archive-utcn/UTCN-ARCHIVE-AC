		
		library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity neg is 
	port(a:in std_logic;
	y:out std_logic);
end neg;

architecture arh of neg is
begin
	process(a)
	begin
		y<=not a;
	end process;
end arh;