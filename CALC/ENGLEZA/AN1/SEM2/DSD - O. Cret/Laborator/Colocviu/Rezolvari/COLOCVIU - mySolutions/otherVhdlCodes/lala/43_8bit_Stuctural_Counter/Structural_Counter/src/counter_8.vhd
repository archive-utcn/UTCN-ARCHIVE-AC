library ieee;
use ieee.std_logic_1164.all;

entity counter_8 is
	port(clk, rst: in bit;
	carry: out bit;
	q: out std_logic_vector(7 downto 0));
end counter_8;

architecture a of counter_8 is

component counter_2 is
	port(clk, rst: in bit;
	carry: out bit;
	q: out std_logic_vector(1 downto 0));
end component;

signal c1, c2, c3, c2_real, c3_real: bit;

begin
	
	t1: counter_2 port map (clk, rst, c1, q(1 downto 0));
	t2: counter_2 port map (c1, rst, c2, q(3 downto 2));
	t3: counter_2 port map (c2, rst, c3, q(5 downto 4));
	t4: counter_2 port map (c3, rst, carry, q(7 downto 6));
	
end a;