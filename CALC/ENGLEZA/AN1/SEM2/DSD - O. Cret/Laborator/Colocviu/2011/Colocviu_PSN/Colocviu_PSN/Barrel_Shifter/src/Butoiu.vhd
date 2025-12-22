library IEEE;					
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity Barrel is
	port(A: in bit_vector(15 downto 0);
	Load,Reset,L,R:in bit;
	X: in std_logic_vector(1 downto 0);
	Q: inout bit_vector(15 downto 0));
end entity;

architecture Stil_butoi of Barrel is

signal CLK:bit;
signal Sx:integer;
begin
Sx<=conv_integer(X);

Ceas: process(CLK)
begin
	CLK<=not CLK after 10 ns;
end process;

process(CLK,Load,Reset,L,R,Sx)
begin
	if(CLK'event and CLK='1') then
		if(Reset='1') then Q<="0000000000000000";
		elsif(Load='1') then Q<=A;
		elsif(L='1' and R='0') then Q<=Q rol Sx;
		elsif(L='0' and R='1') then Q<=Q ror Sx;
		end if;
		end if;
		end process;
		end architecture;
		
