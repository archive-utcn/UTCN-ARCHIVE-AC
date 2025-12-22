library ieee;
use ieee.std_logic_1164.all;

entity rng is
	port(clk, sel: in std_logic;
	load: in std_logic_vector(3 downto 0);
	q: inout std_logic_vector(3 downto 0));
end rng;

architecture a of rng is
component r is
	port(clk, din, sel: std_logic;
	load: in std_logic_vector(3 downto 0);
	q: inout std_logic_vector(3 downto 0));
end component;

component gate is
	port(a, b: in std_logic;
	c: out std_logic);
end component;

signal aux: std_logic;

begin
	TAG1: r port map (clk, aux, sel, load, q);
	TAG2: gate port map (q(3), q(0), aux);
end a;