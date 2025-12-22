library ieee;
use ieee.std_logic_1164.all;

entity XOR_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end XOR_GATE;

architecture arh of XOR_GATE is
begin
	z<= x xor y;
end architecture arh; 