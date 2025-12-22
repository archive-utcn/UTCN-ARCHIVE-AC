library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture a of tb is
component t_ff is
	port(t, clk, rst: in bit;
	q, nq: out bit);
end component;

shared variable end_sim: boolean:=false;
signal t, clk, rst, q, nq: bit;
begin
	uut: t_ff port map (t, clk, rst, q, nq);
	clk_gen: process
	begin
		if not end_sim then
			clk<='0';
			wait for 20 ns;
			clk<='1';
			wait for 20 ns;
		else wait;
		end if;
	end process;
	stim: process
	begin
		t<='0';
		wait for 20 ns;
		t<='1';
		wait for 20 ns;
		rst<='1';
		wait for 20 ns;
		end_sim:=true;
		wait;
	end process;
end a;