library IEEE;
use IEEE.STD_LOGIC_1164.all;  
entity Convertor is
	port( A: in std_logic_vector(15 downto 0);
	B: out std_logic_vector(15 downto 0));
end;

architecture ARH_Struc of Convertor is

component ADD3 is
	port(A: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(3 downto 0));
end component ADD3;

begin 
	P1: ADD3 port map(A(3 downto 0),B(3 downto 0));
	P2:	ADD3 port map(A(7 downto 4),B(7 downto 4));
	P3:	ADD3 port map(A(11 downto 8),B(11 downto 8));
	P4:	ADD3 port map(A(15 downto 12),B(15 downto 12));
end architecture ARH_Struc;
