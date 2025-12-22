library ieee;
use ieee.std_logic_1164.all;

entity BCD_to_GRAY is
	port(B: in bit_vector(3 downto 0);
	G: out bit_vector(3 downto 0));
end BCD_to_GRAY;

architecture A of BCD_to_GRAY is
begin
	process(B)
	begin
		case B is
			when "0000" => G<="0000";
			when "0001" => G<="0001";
			when "0010" => G<="0011";
			when "0011" => G<="0010";
			when "0100" => G<="0110";
			when "0101" => G<="0111";
			when "0110" => G<="0101";
			when "0111" => G<="0100";
			when "1000" => G<="1100";
			when "1001" => G<="1101"; 
			when "1010" => G<="1111";
			when "1011" => G<="1110";
			when "1100" => G<="1010";
			when "1101" => G<="1011";
			when "1110" => G<="1001";
			when others => G<="1000";
		end case;
	end process;
end A;
