library ieee;
use ieee.std_logic_1164.all;

entity nxor_2 is
	port(x, y: in bit;
	z: out bit);
end nxor_2;

architecture a of nxor_2 is
begin
	z<=x xnor y;
end a;
