library ieee;
use ieee.std_logic_1164.all;

entity NOT_GATE is
	port(x: in std_logic;
	y:out std_logic);
end NOT_GATE;

architecture arh of NOT_GATE is
begin
	process (x)
	begin 
		y<=not x;
	end process;
end architecture arh;