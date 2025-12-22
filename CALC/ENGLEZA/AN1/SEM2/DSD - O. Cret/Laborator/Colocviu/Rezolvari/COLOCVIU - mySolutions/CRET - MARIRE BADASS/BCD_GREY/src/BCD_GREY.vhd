library ieee;
use ieee.std_logic_1164.all;

entity conv is
	port( b : in std_logic_vector(3 downto 0);
	g: out std_logic_vector( 3 downto 0));
end entity conv;

architecture arh of conv is
begin	 
	process(b)
	begin
	case b is
		when "0000" => g<="0000";
		when "0001" => g<="0001";	 
		when "0010" => g<="0011";
		when "0011" => g<="0010";
		when "0100" => g<="0110";
		when "0101" => g<="0111";
		when "0110" => g<="0101";
		when "0111" => g<="0100";
		when "1000" => g<="1100";
		when "1001" => g<="1101";
		when others => null;
	end case;
	end process;
end architecture arh;
