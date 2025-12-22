library	ieee;
use ieee.std_logic_1164.all;

entity decodificatorm is
	port( a: in std_logic_vector (1 downto 0);
	q :out std_logic_vector (6 downto 0)); 
end entity;

architecture Arh of decodificatorm is
	begin
		process(a)	
		begin
		case a is
			when "00"=>q<="0000001";
			when "01"=>q<="1001111";
			when "10"=>q<="0010010";
			when "11"=>q<="0000110";
			when others=>q<="1111111"; 
			
		end case;
		end process;
end Arh;