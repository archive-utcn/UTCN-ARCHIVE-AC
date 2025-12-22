library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;

entity x7seg is
	port(BCD: in std_logic_vector(3 downto 0);
	ENABLE: in std_logic;
	Afisor: out std_logic_vector(6 downto 0));
end x7seg;

architecture A of x7seg is
TYPE MM IS ARRAY (9 DOWNTO 0) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HARTA: MM:=(
						 "0000100", --9
						 "0000000", --8
						 "0001111", --7
				       "0100000", --6
				       "0100100", --5
				       "1001100", --4
				       "0000110", --3
				       "0010010", --2
				       "1001111", --1
				       "0000001"); --0

begin
	process(ENABLE,HARTA,BCD)
	begin
		if ENABLE='1' then
				Afisor<=HARTA(CONV_INTEGER(BCD));
			else
				Afisor<="1111111";
			end if;
		end process;
end A;
			
			