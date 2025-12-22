library ieee;
use ieee.std_logic_1164.all;

entity gate is
	port(a, b: in std_logic;
	c: out std_logic);
end gate;

architecture a of gate is
begin
	process(a, b)
	begin
		c<=a xor b;
	end process;
end a;
