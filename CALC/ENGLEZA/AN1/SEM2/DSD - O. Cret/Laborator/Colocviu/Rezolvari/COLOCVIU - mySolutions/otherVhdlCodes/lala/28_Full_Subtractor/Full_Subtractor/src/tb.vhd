library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture ar of tb is

component full_subtractor is
	port(x, y, bi: in bit;
	bo, z: out bit);
end component;

signal x, y, bi, bo, z: bit;

begin
	UUT: full_subtractor port map (x, y, bi, bo, z);
	process
	begin
		x<='0';
		y<='0';
		bi<='0';
		wait for 20 ns;
		x<='0';
		y<='0';
		bi<='1';
		wait for 20 ns;
		x<='0';
		y<='1';
		bi<='0';
		wait for 20 ns;
		x<='0';
		y<='1';
		bi<='1';
		wait for 20 ns;
		x<='1';
		y<='0';
		bi<='0';
		wait for 20 ns;
		x<='1';
		y<='0';
		bi<='1';
		wait for 20 ns;
		x<='1';
		y<='1';
		bi<='0';
		wait for 20 ns;
		x<='1';
		y<='1';
		bi<='1';
		wait for 20 ns;
		wait;
	end process;
end ar;