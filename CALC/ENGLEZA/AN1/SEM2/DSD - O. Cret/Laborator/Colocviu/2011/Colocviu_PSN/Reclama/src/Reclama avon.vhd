library IEEE;	  
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Reclama is
	port(S:in bit;
	X:in std_logic_vector(7 downto 0));
end entity;

architecture ARH_Reclama of Reclama is
signal Sx:integer:=0;		 
signal CLK:bit;
begin
	Sx<=conv_integer(X);
Custom_ceas: process(CLK)
begin
	CLK<=not CLK after Sx*10 ns;
end process;
process(CLK,S)
begin
if(S='0') then
assert CLK='1' report "Test_PSN" severity ERROR;
else
assert CLK='1' report "Rezultat_PSN" severity ERROR;	
end if;
end process;
end architecture;