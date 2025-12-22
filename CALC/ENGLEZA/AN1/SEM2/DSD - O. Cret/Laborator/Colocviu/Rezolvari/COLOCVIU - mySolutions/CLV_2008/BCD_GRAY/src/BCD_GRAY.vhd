library ieee;
use ieee.std_logic_1164.all;

entity bcd_gray is
	port ( b : in std_logic_vector(3 downto 0);
	g: out std_logic_vector(3 downto 0));
end bcd_gray;

--architecture arh of bcd_gray is
--begin
--	g(3)<=b(3);
--	g(2)<=b(2) xor b(3);
--	g(1)<=b(2) xor b(1);
--	g(0)<=b(1) xor b(0);
--end architecture arh;

architecture arh of bcd_gray is
begin
	process(b)
	begin
		case b is
			when "0000" => g<="0000"; --0
			when "0001" => g<="0001"; --1
			when "0010" => g<="0011"; --2
			when "0011" => g<="0010"; --3
			when "0100" => g<="0110"; --4
			when "0101" => g<="0111"; --5
			when "0110" => g<="0101"; --6
			when "0111" => g<="0100"; --7
			when "1000" => g<="1100"; --8
			when "1001" => g<="1101"; --9
			when "1010" => g<="1111"; --10
			when "1011" => g<="1110"; --11
			when "1100" => g<="1010"; --12
			when "1101" => g<="1011"; --13
			when "1110" => g<="1001"; --14
			when "1111" => g<="1000"; --15
			when others => null;
		end case;
	end process;
end architecture arh;

