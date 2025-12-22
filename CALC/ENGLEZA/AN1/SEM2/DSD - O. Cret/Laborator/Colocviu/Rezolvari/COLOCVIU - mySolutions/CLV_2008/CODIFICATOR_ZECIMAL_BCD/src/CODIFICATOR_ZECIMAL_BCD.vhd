library ieee;
use ieee.std_logic_1164.all;

entity CODIFICATOR_ZECIMAL_BCD is
	port(input: in std_logic_vector( 9 downto 0);
	bcd :out std_logic_vector(3 downto 0));
end CODIFICATOR_ZECIMAL_BCD;

architecture arh of CODIFICATOR_ZECIMAL_BCD is
begin
	process(input)
	begin
		if input(0) = '1' then bcd<="0000"; --0
		elsif input(1) = '1' then bcd<="0001"; --1;
		elsif input(2) = '1' then bcd<="0010"; --2;
		elsif input(3) = '1' then bcd<="0011"; --3;
		elsif input(4) = '1' then bcd<="0100"; --4;
		elsif input(5) = '1' then bcd<="0101"; --5;
		elsif input(6) = '1' then bcd<="0110"; --6;
		elsif input(7) = '1' then bcd<="0111"; --7;
		elsif input(8) = '1' then bcd<="1000"; --8;
		elsif input(9) = '1' then bcd<="1001"; --9 
		end if;
		end process;
end architecture arh;
		
		