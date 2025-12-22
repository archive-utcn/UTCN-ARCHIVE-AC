library ieee;
use ieee.std_logic_1164.all;

entity comparator is
	port(a, b: in bit;
	f1, f2, f3: out bit);
end comparator;

architecture a of comparator is
begin
	process(a, b)
	begin
		f1<=a and (not b);
		f2<=a xnor b;
		f3<=(not a) and b;
	end process;
end a;