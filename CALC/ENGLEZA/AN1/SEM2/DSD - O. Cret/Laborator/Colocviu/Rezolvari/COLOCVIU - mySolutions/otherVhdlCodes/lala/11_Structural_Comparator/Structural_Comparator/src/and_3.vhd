library ieee;
use ieee.std_logic_1164.all;

entity and_3 is
	port(w, x, y: in bit;
	z: out bit);
end and_3;

architecture a of and_3 is
begin
	z<=w and x and y;
end a;