library ieee;
use ieee.std_logic_1164.all;

entity inverter is
	port(x: in bit;
	y: out bit);
end inverter;

architecture a of inverter is
begin
	y<=not x;
end a;