library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture a of tb is
component jk is
	port(j, k, clk, rst: in bit;
	q, nq: out bit);
end component;

shared variable end_sim: boolean:=false;
signal j, k, clk, rst, q, nq: bit;

begin
	uut: jk port map (j, k, clk, rst, q, nq);
	clk_gen: process
	begin
		if not end_sim then
			clk<='1';
			wait for 20 ns;
			clk<='0';
			wait for 20 ns;
		else wait;
		end if;
	end process;
	stim: process
	begin
		j<='0';
		k<='0';
		wait for 40 ns;
		j<='1';
		wait for 40 ns;
		j<='0';
		k<='1';
		wait for 40 ns;
		j<='1';
		wait for 40 ns;
		rst<='1';
		wait for 40 ns;
		end_sim:=true;
		wait;
	end process;
end a;