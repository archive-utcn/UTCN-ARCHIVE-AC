library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
	port(x, y: in bit;
	z: out bit);
end or_gate;

architecture a of or_gate is
begin
	z<=x or y;
end a;