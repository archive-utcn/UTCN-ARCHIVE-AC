library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;   

entity RAM is
	port(AD: in std_logic_vector(3 downto 0);
	CLK: in std_logic;
	CE_WR: in std_logic;
	DATAIN: in std_logic_vector(7 downto 0);
	DATAOUT: out std_logic_vector (7 downto 0));
end entity;

architecture arh_RAM of RAM is
type mem is array (0 to 15) of std_logic_vector(7 downto 0);
begin
	process(CLK,DATAIN,CE_WR)
	variable M: mem:=(x"00",x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"08",x"09",x"0A",x"0B",x"0C",x"0D",x"0E",x"0F");
	begin
		if CLK='1'and CLK'EVENT then
			if CE_WR='1' then case (AD) is
			
		    when "0000"=>M(0):=DATAIN;
			when "0001"=>M(1):=DATAIN;
			when "0010"=>M(2):=DATAIN;
			when "0011"=>M(3):=DATAIN;
			when "0100"=>M(4):=DATAIN;
			when "0101"=>M(5):=DATAIN;
			when "0110"=>M(6):=DATAIN;
			when "0111"=>M(7):=DATAIN;
			when "1000"=>M(8):=DATAIN;
			when "1001"=>M(9):=DATAIN;
			when "1010"=>M(10):=DATAIN;
			when "1011"=>M(11):=DATAIN;
			when "1100"=>M(12):=DATAIN;
			when "1101"=>M(13):=DATAIN;
			when "1110"=>M(14):=DATAIN;
			when others=>M(15):=DATAIN;
			end case;
		else case (AD) is
	            when "0000"=>DATAOUT<=M(0);
				when "0001"=>DATAOUT<=M(1);
				when "0010"=>DATAOUT<=M(2);
				when "0011"=>DATAOUT<=M(3);
				when "0100"=>DATAOUT<=M(4);
				when "0101"=>DATAOUT<=M(5);
				when "0110"=>DATAOUT<=M(6);
				when "0111"=>DATAOUT<=M(7);
				when "1000"=>DATAOUT<=M(8);
				when "1001"=>DATAOUT<=M(9);
				when "1010"=>DATAOUT<=M(10);
				when "1011"=>DATAOUT<=M(11);
				when "1100"=>DATAOUT<=M(12);
				when "1101"=>DATAOUT<=M(13);
				when "1110"=>DATAOUT<=M(14);
				when others=>DATAOUT<=M(15);
		end case;
		end if;
	
	end if;
	end process;
end architecture;