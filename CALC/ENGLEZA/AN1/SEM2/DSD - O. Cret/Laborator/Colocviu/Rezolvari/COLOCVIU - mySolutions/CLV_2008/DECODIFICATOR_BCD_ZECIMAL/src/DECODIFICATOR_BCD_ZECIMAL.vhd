library ieee;
use ieee.std_logic_1164.all;

entity DECODIFICATOR_BCD_ZECIMAL is
	port( bcd: in std_logic_vector (3 downto 0);
	zec: out std_logic_vector( 9 downto 0));
end DECODIFICATOR_BCD_ZECIMAL;

architecture arh of DECODIFICATOR_BCD_ZECIMAL is
begin 
	process(bcd)
	begin
		case bcd is
			when "0000" => zec<= "0000000001"; -- 0
			when "0001" => zec<= "0000000010"; -- 1
			when "0010" => zec<= "0000000100"; -- 2
			when "0011" => zec<= "0000001000"; -- 3
			when "0100" => zec<= "0000010000"; -- 4
			when "0101" => zec<= "0000100000"; -- 5
			when "0110" => zec<= "0001000000"; -- 6
			when "0111" => zec<= "0010000000"; -- 7	 
			when "1000" => zec<= "0100000000"; -- 8
			when "1001" => zec<= "1000000000"; -- 9	
			when others => null;
		end case;
	end process;
end architecture arh;
