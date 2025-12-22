--memoreaza PIN-urile;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity PIN is
	port(adresa_pin: std_logic_vector(3 downto 0);
	Data: inout std_logic_vector(15 downto 0));
end PIN;

architecture A of PIN is
type vector is array(0 to 10) of std_logic_vector(15 downto 0);
signal MEM: vector:=(
							"0110100110010000",--6990 0
							"1000001001100001",--8261 1
							"1001011001010011",--9653 2
							"0010011101010100",--2754 3
							"0101100110010010",--5992 4
							"0011001100110011",--3333 5
							"0100010001000100",--4444 6
							"0001000100010000",--1110 7
							"0101010101010000",--5550 8
							"0001001000111000",--1234 9
							"1000001100100001");--4321 10
							
	begin
			Data<=MEM(conv_integer(adresa_pin));
end A;
	
	
