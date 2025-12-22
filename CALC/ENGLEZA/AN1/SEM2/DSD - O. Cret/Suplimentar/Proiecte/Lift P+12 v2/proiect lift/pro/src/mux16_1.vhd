library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux16_1 is
	port(I0 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I1 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I2 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I3 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I4 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I5 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I6 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I7 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I8 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I9 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I10 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I11 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I12 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I13 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I14 : in STD_LOGIC_VECTOR (3 downto 0);
 	            I15 : in STD_LOGIC_VECTOR (3 downto 0);
             SEL : in STD_LOGIC_VECTOR (3 downto 0);
             Y : out STD_LOGIC_VECTOR (3 downto 0));
end mux16_1;   

architecture Mux of mux16_1 is
begin
	process(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,SEL)
		begin
			case SEL is
				when "0000"	=> Y <= I0;
				when "0001"	=> Y <= I1;
				when "0010"	=> Y <= I2;
				when "0011"	=> Y <= I3;
				when "0100" => Y <= I4;
				when "0101"	=> Y <= I5;
				when "0110"	=> Y <= I6;
				when "0111"	=> Y <= I7;
				when "1000"	=> Y <= I8;
				when "1001"	=> Y <= I9;
				when "1010"	=> Y <= I10;
				when "1011"	=> Y <= I11;
				when "1100"	=> Y <= I12;
				when "1101"	=> Y <= I13;
				when "1110"	=> Y <= I14;
				when others => Y <= I15;
			end case;
	end process;
end MUX;