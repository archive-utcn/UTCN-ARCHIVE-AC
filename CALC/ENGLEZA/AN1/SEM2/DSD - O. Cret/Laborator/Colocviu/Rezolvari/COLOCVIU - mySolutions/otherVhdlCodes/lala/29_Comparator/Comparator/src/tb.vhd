library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture ar of tb is
component comparator is
	port(a, b: in bit;
	f1, f2, f3: out bit);
end component;

signal a, b, f1, f2, f3: bit;
begin
	UUT: comparator port map (a, b, f1, f2, f3);
	process
	begin
		a<='0';
		b<='0';
		wait for 20 ns;
		a<='0';
		b<='1';
		wait for 20 ns;
		a<='1';
		b<='0';
		wait for 20 ns;
		a<='1';
		b<='1';
		wait for 20 ns;
		wait;
	end process;
end ar;