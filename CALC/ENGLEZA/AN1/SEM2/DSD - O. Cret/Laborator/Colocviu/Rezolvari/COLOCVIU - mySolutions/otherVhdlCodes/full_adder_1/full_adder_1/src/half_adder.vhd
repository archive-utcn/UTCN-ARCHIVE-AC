library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port( a,b : bit;
	cout, s: out bit);
end half_adder;

architecture arh of half_adder is
begin
	cout <=  a and b;
	s <= a xor b;
end arh;



