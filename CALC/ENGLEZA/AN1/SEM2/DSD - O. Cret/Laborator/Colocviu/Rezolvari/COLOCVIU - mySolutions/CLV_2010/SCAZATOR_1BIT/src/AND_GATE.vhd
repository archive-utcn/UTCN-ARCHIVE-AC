library ieee;
use ieee.std_logic_1164.all;

entity AND_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end AND_GATE;

architecture arh of AND_GATE is
begin
	process(x,y)
	begin
		z<= x and y;
	end process;		 
end architecture arh;