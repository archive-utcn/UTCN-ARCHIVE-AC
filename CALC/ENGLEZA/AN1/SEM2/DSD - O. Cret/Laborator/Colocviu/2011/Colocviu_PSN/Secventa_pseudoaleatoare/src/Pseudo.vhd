library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Pseudo is
	port (A:inout bit_vector(3 downto 0):="0001");
	
end entity;

architecture ARH_STR of Pseudo is

component Clock is
	port (CLK: inout bit);	 
end component;

component Shifter is
	port (A:inout bit_vector(3 downto 0);
	CLK:in bit);
end component;
signal CLK:bit;
--signal Q:bit_vector(3 downto 0);
begin	
	Ceas: Clock port map(CLK);
	Generare: Shifter port map(A,CLK);
end architecture;

	
	