library ieee;
use ieee.std_logic_1164.all;

entity dec is 
	port(bin: in std_logic_vector(3 downto 0);
	dec: out std_logic_vector(15 downto 0));
end dec;

architecture arh of dec is
begin
	process(bin)
	begin
		case bin is
			when "0000" => dec<="0000000000000001";
			when "0001" => dec<="0000000000000010";
			when "0010" => dec<="0000000000000100";
			when "0011" => dec<="0000000000001000";
			when "0100" => dec<="0000000000010000";
			when "0101" => dec<="0000000000100000";
			when "0110" => dec<="0000000001000000";
			when "0111" => dec<="0000000010000000";
			when "1000" => dec<="0000000100000000";
			when "1001" => dec<="0000001000000000";
			when "1010" => dec<="0000010000000000";
			when "1011" => dec<="0000100000000000";
			when "1100" => dec<="0001000000000000";
			when "1101" => dec<="0010000000000000";
			when "1110" => dec<="0100000000000000";
			when "1111" => dec<="1000000000000000";
			when others => null;
		end case;
	end process;
end architecture arh;
	