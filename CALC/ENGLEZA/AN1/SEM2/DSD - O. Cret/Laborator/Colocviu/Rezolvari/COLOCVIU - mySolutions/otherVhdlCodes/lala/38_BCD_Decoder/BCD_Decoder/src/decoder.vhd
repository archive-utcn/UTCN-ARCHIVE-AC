library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port(bcd: in bit_vector(3 downto 0);
	decimal: out bit_vector(9 downto 0));
end decoder;

architecture a of decoder is
begin
	process(bcd)
	begin
		case bcd is
			when "0000"=> decimal<=(0=>'1', others=>'0');
			when "0001"=> decimal<=(1=>'1', others=>'0');
			when "0010"=> decimal<=(2=>'1', others=>'0');
			when "0011"=> decimal<=(3=>'1', others=>'0');
			when "0100"=> decimal<=(4=>'1', others=>'0');
			when "0101"=> decimal<=(5=>'1', others=>'0');
			when "0110"=> decimal<=(6=>'1', others=>'0');
			when "0111"=> decimal<=(7=>'1', others=>'0');
			when "1000"=> decimal<=(8=>'1', others=>'0');
			when "1001"=> decimal<=(9=>'1', others=>'0');
			when others => null;
		end case;
	end process;
end a;
			