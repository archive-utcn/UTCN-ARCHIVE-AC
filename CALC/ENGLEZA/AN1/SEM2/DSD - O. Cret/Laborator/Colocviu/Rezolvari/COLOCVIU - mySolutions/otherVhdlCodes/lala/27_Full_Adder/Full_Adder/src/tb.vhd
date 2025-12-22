library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture ar of tb is
component full_adder is
	port(a, b, cin: in bit;
	cout, s: out bit);
end component;

signal a, b, cin, cout, s: bit;
begin
	UUT: full_adder port map (a, b, cin, cout, s);
	STIMULI: process
	begin
		a<='0';
		b<='0';
		cin<='0';
		wait for 20 ns;
		a<='0';
		b<='0';
		cin<='1';
		wait for 20 ns;
		a<='0';
		b<='1';
		cin<='0';
		wait for 20 ns;
		a<='0';
		b<='1';
		cin<='1';
		wait for 20 ns;
		a<='1';
		b<='0';
		cin<='0';
		wait for 20 ns;
		a<='1';
		b<='0';
		cin<='1';
		wait for 20 ns;
		a<='1';
		b<='1';
		cin<='0';
		wait for 20 ns;
		a<='1';
		b<='1';
		cin<='1';
		wait for 20 ns;
		wait;
	end process;
end ar;