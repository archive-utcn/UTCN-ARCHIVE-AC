library	ieee;
use ieee.std_logic_1164.all;  

entity decodificators is
	port( a: in std_logic_vector (3 downto 0);
	q :out std_logic_vector (6 downto 0)); 
end entity;

architecture Arh of decodificators is
	begin
		process(a)	
		begin
		case a is
			when "0000"=>q<="0000001";
			when "0001"=>q<="1001111";
			when "0010"=>q<="0010010";
			when "0011"=>q<="0000110";
			when "0100"=>q<="1001100";
			when "0101"=>q<="0100100";
			when "0110"=>q<="0100000";
			when "0111"=>q<="0001111";
			when "1000"=>q<="0000000";
			when "1001"=>q<="0000100";
			when "1010"=>q<="0001000";
			when "1011"=>q<="1100000";
			when "1100"=>q<="0110001";
			when "1101"=>q<="1000010";
			when "1110"=>q<="0110000";
			when "1111"=>q<="0111000";
			when others=>q<="1111111";
		end case;
		end process;
end Arh;