library ieee;
use ieee.std_logic_1164.all;

entity conv is
	port( e: in std_logic_vector (3 downto 0);
	b: out std_logic_vector (3 downto 0));
end entity conv;

architecture arh of conv is
begin 
	process (e)
	begin
		case e is
			when "0011" => b<="0000";
			when "0100" => b<="0001";
			when "0101" => b<="0010";
			when "0110" => b<="0011";
			when "0111" => b<="0100";
			when "1000" => b<="0101";
			when "1001" => b<="0110";
			when "1010" => b<="0111";
			when "1011" => b<="1000";
			when "1100" => b<="1001";
			when others => null;
	end case;
	end process;
end architecture arh;

