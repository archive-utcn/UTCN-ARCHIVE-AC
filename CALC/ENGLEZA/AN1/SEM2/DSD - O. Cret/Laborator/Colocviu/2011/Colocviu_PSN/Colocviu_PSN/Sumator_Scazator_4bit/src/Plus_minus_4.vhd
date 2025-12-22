library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity SUM_MIN is
	port( A,B: in std_logic_vector(3 downto 0);	  
	S: in bit;
	Q: out std_logic_vector(4 downto 0);
	Neg: out bit:='0');
end entity;

architecture ARH_COMP of SUM_MIN is
begin
	process(A,B,S)
	variable Sa,Sb,Sq: integer;
	begin
		Sa:=conv_integer(A);
		Sb:=conv_integer(B);
		if(S='0') then
			Sq:=Sa+Sb;
		else
			Sq:=Sa-Sb;
		end if;
		if(Sq<0) then
			Sq:=Sq*(-1);
			Neg<='1';
		end if;
		Q<=conv_std_logic_vector(Sq,5);
		end process;
	end architecture;
	
	