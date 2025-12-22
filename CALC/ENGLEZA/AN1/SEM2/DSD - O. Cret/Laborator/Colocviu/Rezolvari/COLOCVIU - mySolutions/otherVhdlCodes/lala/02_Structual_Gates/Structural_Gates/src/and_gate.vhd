library ieee;
use ieee.std_logic_1164.all;

entity AND_gate is
	port(x, y: in bit;
	z: out  bit);
end AND_gate;

architecture A of AND_gate is
begin
	z<=x and y;
end A;
