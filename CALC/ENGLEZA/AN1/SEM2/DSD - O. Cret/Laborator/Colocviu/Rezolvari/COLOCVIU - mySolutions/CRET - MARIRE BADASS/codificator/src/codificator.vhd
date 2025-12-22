library ieee;
use ieee.std_logic_1164.all;

entity codificator is
	port( z: in std_logic_vector(9 downto 0);
	b: out std_logic_vector(3 downto 0));
end codificator;

architecture arh of codificator is
begin
	process(z)
	begin
		case z is
			when "0000000001" => b<="0000";
			when "0000000010" => b<="0001";
			when "0000000100" => b<="0010";
			when "0000001000" => b<="0011";
			when "0000010000" => b<="0100";
			when "0000100000" => b<="0101";
			when "0001000000" => b<="0110";
			when "0010000000" => b<="0111";
			when "0100000000" => b<="1000";
			when "1000000000" => b<="1001";	 
			when others => null;
		end case;
	end process;
end architecture arh;

			