library ieee;
use ieee.std_logic_1164.all;

entity dec_zec is
	port( zec:  in std_logic_vector(3 downto 0);
	dec: out std_logic_vector(9 downto 0));
end dec_zec;

architecture arh of dec_zec is
begin
	process(zec)
	begin
		case zec is
			when "0000" => dec<="0000000001";
			when "0001" => dec<="0000000010";
			when "0010" => dec<="0000000100";
			when "0011" => dec<="0000001000";
			when "0100" => dec<="0000010000";
			when "0101" => dec<="0000100000";
			when "0110" => dec<="0001000000";
			when "0111" => dec<="0010000000";
			when "1000" => dec<="0100000000";
			when "1001" => dec<="1000000000";
			when others => null;
		end case;
	end process;
end architecture arh;

						