library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture a of tb is
component reg is
	port(clk, rst, sel, din: in bit;
	q: out bit_vector(3 downto 0));
end component;

signal clk, rst, sel, din: bit;
signal q: bit_vector(3 downto 0);
shared variable end_sim: boolean:=false;
begin
	uut: reg port map (clk, rst, sel, din, q);
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
		rst<='1';
		wait for 40 ns;
		rst<='0';
		wait for 40 ns;
		din<='1';
		wait for 40 ns;
		wait for 40 ns;
		wait for 40 ns;
		sel<='1';
		wait for 40 ns;
		din<='0';
		wait for 40 ns;
		rst<='1';
		wait for 40 ns;
		end_sim:=true;
		wait;
	end process;
end a;