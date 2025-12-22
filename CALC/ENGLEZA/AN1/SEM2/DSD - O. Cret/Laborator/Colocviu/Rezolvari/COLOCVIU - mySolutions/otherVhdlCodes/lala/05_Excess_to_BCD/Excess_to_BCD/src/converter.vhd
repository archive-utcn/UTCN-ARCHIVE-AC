library ieee;
use ieee.std_logic_1164.all;

entity EXCESS_TO_BCD is
	port(E: in bit_vector(3 downto 0);
	B: out bit_vector(3 downto 0));
end EXCESS_TO_BCD;

architecture A of EXCESS_TO_BCD is
begin
	process(E)
	begin
		case E is
			when "0011" => B<="0000";
			when "0100" => B<="0001";
			when "0101" => B<="0010";
			when "0110" => B<="0011";
			when "0111" => B<="0100";
			when "1000" => B<="0101";
			when "1001" => B<="0110";
			when "1010" => B<="0111";
			when "1011" => B<="1000";
			when "1100" => B<="1001";
			when others => report "Invalid";
		end case;
	end process;
end A;
