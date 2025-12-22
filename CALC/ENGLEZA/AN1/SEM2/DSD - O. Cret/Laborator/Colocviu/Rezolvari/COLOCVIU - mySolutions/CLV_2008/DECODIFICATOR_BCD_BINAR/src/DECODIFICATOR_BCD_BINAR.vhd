library ieee;
use ieee.std_logic_1164.all;

entity DECODIFICATOR_BCD_BINAR is
	port( bcd: in std_logic_vector (3 downto 0);
	bin: out std_logic_vector( 15 downto 0));
end DECODIFICATOR_BCD_BINAR;

architecture arh of DECODIFICATOR_BCD_BINAR is
begin 
	process(bcd)
	begin
		case bcd is
			when "0000" => bin<= "0000000000000001"; -- 0
			when "0001" => bin<= "0000000000000010"; -- 1
			when "0010" => bin<= "0000000000000100"; -- 2
			when "0011" => bin<= "0000000000001000"; -- 3
			when "0100" => bin<= "0000000000010000"; -- 4
			when "0101" => bin<= "0000000000100000"; -- 5
			when "0110" => bin<= "0000000001000000"; -- 6
			when "0111" => bin<= "0000000010000000"; -- 7	 
			when "1000" => bin<= "0000000100000000"; -- 8
			when "1001" => bin<= "0000001000000000"; -- 9	
			when "1010" => bin<= "0000010000000000"; -- 10
			when "1011" => bin<= "0000100000000000"; -- 11
			when "1100" => bin<= "0001000000000000"; -- 12
			when "1101" => bin<= "0010000000000000"; -- 13
			when "1110" => bin<= "0100000000000000"; -- 14
			when "1111" => bin<= "1000000000000000"; -- 15
			when others => null;
		end case;
	end process;
end architecture arh;