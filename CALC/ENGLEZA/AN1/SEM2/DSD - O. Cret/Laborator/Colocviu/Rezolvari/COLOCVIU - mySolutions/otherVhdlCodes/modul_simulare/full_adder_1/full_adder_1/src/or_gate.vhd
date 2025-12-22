library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
	port ( a,b: in bit;
	y: out bit);
end or_gate;

architecture arh of or_gate is
begin 
	y<= a or b;
end architecture arh;
