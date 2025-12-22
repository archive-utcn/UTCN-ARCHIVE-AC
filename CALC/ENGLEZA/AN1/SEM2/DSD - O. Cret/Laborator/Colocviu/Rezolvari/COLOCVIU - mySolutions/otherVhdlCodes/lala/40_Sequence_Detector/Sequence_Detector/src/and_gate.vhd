library ieee;
use ieee.std_logic_1164.all;

entity gate is
	port(a, b, c, d: in std_logic;
	e: out std_logic);
end gate;

architecture a of gate is
begin
	e<=(not a) and (not b) and c and d;
end a;