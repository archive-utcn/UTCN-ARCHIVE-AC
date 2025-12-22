library ieee;
use ieee.std_logic_1164.all;

entity comparator is
	port(a, b, c, d: in bit;
	f2, f1, f0: out bit);
end comparator;

architecture a of comparator is
begin
	process(a, b, c, d)
	begin
		if (a=c and b=d) then f1<='1'; f2<='0'; f0<='0';
		elsif (a>c or (a=c and b>d)) then f2<='1'; f1<='0'; f0<='0';
		else f0<='1'; f2<='0'; f1<='0';
		end if;
	end process;
end a;
		