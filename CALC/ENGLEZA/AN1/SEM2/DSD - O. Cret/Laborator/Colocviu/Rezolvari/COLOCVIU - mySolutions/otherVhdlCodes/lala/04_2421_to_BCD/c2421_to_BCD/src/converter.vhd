library ieee;
use ieee.std_logic_1164.all;

entity c2421_to_BCD is
	port(C: in bit_vector(3 downto 0);
	B: out bit_vector(3 downto 0));
end c2421_to_BCD;

architecture A of c2421_to_BCD is
begin
	process(C)
	begin
		case C is
			when "0000" => B<="0000";
			when "0001" => B<="0001";
			when "1000" => B<="0010";
			when "1001" => B<="0011";
			when "1010" => B<="0100";
			when "1011" => B<="0101";
			when "1100" => B<="0110";
			when "1101" => B<="0111";
			when "1110" => B<="1000"; 
			when "1111" => B<="1001";
			when others => report "Invalid";
		end case;
	end process;
end A;
