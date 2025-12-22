library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;

entity bist_D is
	port(d, clk: in std_logic;
	q : buffer std_logic);
end bist_D;

architecture arh_bist_D of bist_D is
signal s1,s2: std_logic;
begin
N1: process(clk)
begin
	s1<=not(clk);
end process N1;
NAND1: process(s1, clk) 
begin
	s2<=s1 nand clk;
end process NAND1;
D1: process(s2)												
begin
	if S2='1' then
		q<=d;
	end if;
end process D1;
end architecture arh_bist_D;
