library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
	port(x, y: in bit;
	z: out bit);
end and_gate;

architecture a of and_gate is
begin
	z<=x and y;
end a;