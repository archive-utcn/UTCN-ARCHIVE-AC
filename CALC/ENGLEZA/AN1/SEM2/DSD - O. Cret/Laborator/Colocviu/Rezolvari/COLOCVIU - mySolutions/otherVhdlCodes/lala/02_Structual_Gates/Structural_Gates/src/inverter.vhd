library ieee;
use ieee.std_logic_1164.all;

entity INVERTER is
	port(x: in bit;
	y: out bit);
end INVERTER;

architecture A of INVERTER is
begin
	y<=not x;
end A;
