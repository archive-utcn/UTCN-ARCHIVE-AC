--memoreaza sold-ul curent;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM is
	port(ADRESA_CARD: std_logic_vector(3 downto 0);
	WE: in std_logic;
	SUMA: in std_logic_vector(15 downto 0);
	SOLD: out std_logic_vector(15 downto 0));
end RAM;

architecture A of RAM is
type vector is array(0 to 10) of std_logic_vector(15 downto 0);
begin
process (WE,ADRESA_CARD)
variable MEM: vector:=(	 "0000100001100110", --2150 0 
						 "0000001010001010", --650  1
						 "0000000001111000", --120  2 
						 "0000000101101000", --360  3 
						 "0000001000110000", --560  4 
						 "0000001101111010", --890  5 
						 "0000001001110110", --630  6
						 "0000000001101110", --110  7 
						 "0000000001011010", --90   8 
						 "0000000011010010", --210  9 
						 "0000000000000000"); --1111 10	

			 
				 begin			
					 if WE='1' then
						 MEM(conv_integer(ADRESA_CARD)):=SUMA;
					 elsif WE='0' then
						 SOLD<=MEM(conv_integer(ADRESA_CARD));
					 end if;
					 end process;
end A ;												  