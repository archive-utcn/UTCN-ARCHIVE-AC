library ieee;
use ieee.std_logic_1164.all;

entity OR_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end OR_GATE;

architecture arh of OR_GATE is
begin
	process(x,y)
	begin
		z<= x or y;
	end process;		 
end architecture arh;