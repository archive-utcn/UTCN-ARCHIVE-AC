library ieee;
use ieee.std_logic_1164.all;

entity OR_gate is
	port(x, y: in bit;
	z: out  bit);
end OR_gate;

architecture A of OR_gate is
begin
	z<=x or y;
end A;
