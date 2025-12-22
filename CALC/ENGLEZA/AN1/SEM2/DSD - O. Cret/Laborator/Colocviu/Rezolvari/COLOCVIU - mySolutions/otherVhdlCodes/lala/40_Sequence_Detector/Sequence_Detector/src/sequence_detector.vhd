library ieee;
use ieee.std_logic_1164.all;

entity detect is
	port(clk, rst, din: in std_logic;
	z: out std_logic);
end detect;

architecture a of detect is
component r is
	port(clk, rst, din: in std_logic;
	q: out std_logic_vector(3 downto 0));
end component;
component gate is
	port(a, b, c, d: in std_logic;
	e: out std_logic);
end component;
signal q: std_logic_vector(3 downto 0):="0000";
begin
	T1: r port map (clk, rst, din, q);
	T2: gate port map (q(3), q(2), q(1), q(0), z);
end a;
	