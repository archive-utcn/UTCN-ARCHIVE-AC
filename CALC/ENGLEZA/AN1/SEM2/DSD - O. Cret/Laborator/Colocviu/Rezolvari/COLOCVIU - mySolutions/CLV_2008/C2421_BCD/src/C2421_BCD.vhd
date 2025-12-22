library ieee;
use ieee.std_logic_1164.all;

entity C2421_BCD is
	port ( C2421: in std_logic_vector(3 downto 0);
	b: out std_logic_vector(3 downto 0));
end C2421_BCD;

--architecture arh of C2421_BCD is
--begin 
--	process(C2421)
--	begin
--	case C2421 is
--		when "0000" => b<="0000"; --0
--		when "0001" => b<="0001"; --1
--		when "0010" => b<="0010"; --2
--		when "0011" => b<="0011"; --3
--		when "0100" => b<="0100"; --4
--		when "1011" => b<="0101"; --5
--		when "1100" => b<="0110"; --6
--		when "1101" => b<="0111"; --7
--		when "1110" => b<="1000"; --8
--		when "1111" => b<="1001"; --9
--		when others => null;
--	end case;
--	end process;
--end architecture arh;

architecture arh of C2421_BCD is
begin
	process(C2421)
	begin
		b(3)<= C2421(2) and C2421(1);
		b(2)<= (C2421(2) and (not(C2421(1)))) or (C2421(3) and (not(C2421(2)))); 
		b(1)<= C2421(3) xor C2421(1);
		b(0)<= C2421(0);  
	end process;
end architecture arh;

