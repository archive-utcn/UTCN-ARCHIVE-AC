library ieee;
use ieee.std_logic_1164.all;

entity or_3 is
	port(w, x, y: in bit;
	z: out bit);
end or_3;

architecture a of or_3 is
begin
	z<=w or x or y;
end a;
