Library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BCD7 is
	port(BCD: in STD_LOGIC_vector(3 downto 0);
	DECOD: out STD_LOGIC_VECTOR(6 downto 0));
end BCD7;

architecture DECODIF of BCD7 is
begin 
	process(BCD)
	begin
	case BCD is
		when "0000" => DECOD<="0000001";
		when "0001" => DECOD<="1111001";
		when "0010" => DECOD<="0010010";
		when "0011" => DECOD<="0000110";
		when "0100" => DECOD<="1000100";
		when "0101" => DECOD<="0100100";
		when "0110" => DECOD<="1100000";
		when "0111" => DECOD<="0001111";
		when "1000" => DECOD<="0000000";
		when "1001" => DECOD<="0000100";
		when others => DECOD<="1111111";
	end case;  
	end process;
end DECODIF;