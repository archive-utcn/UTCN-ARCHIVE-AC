library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture ar of tb is
component  d_ff is
	port(clk, rst, d: in bit;
	q, nq: out bit);
end component;

shared variable end_sim: boolean:=false;
signal clk, rst, d, q, nq: bit;
begin
	uut: d_ff port map (clk, rst, d, q, nq);
	clk_generator: process
	begin
		if not end_sim then
			clk<='0';
			wait for 20 ns;
			clk<='1';
			wait for 20 ns;
		else wait;
		end if;
	end process;
	stimuli: process
	begin
		d<='0';
		wait for 20 ns;
		d<='1';
		wait for 20 ns;
		rst<='1';
		wait for 20 ns;
		end_sim:=true;
		wait;
	end process;
end ar;