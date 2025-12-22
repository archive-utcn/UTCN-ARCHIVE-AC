library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity RAM is
	port( CE_WR,CE_RD: in std_logic;
	AW,AR: in std_logic_vector(3 downto 0);
	CLK: in std_logic;
	DATAIN: in std_logic_vector(7 downto 0);
	DATAOUT: out std_logic_vector(7 downto 0));
end RAM;

architecture ARHRAM of RAM is
type memory is array (0 to 15) of std_logic_vector(7 downto 0);
begin
	process(CLK,DATAIN,CE_WR,CE_RD,AW,AR)
	variable RAM: memory :=(x"00",x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"08",x"09",x"0A",x"0B",x"0C",x"0D",x"0E",x"0F");
	begin
	if CLK'EVENT and CLK='1' then
		if CE_WR='1' then case(AW) is
			when "0000"=>RAM(0):=DATAIN;
			when "0001"=>RAM(1):=DATAIN;
			when "0010"=>RAM(2):=DATAIN;
			when "0011"=>RAM(3):=DATAIN;
			when "0100"=>RAM(4):=DATAIN;
			when "0101"=>RAM(5):=DATAIN;
			when "0110"=>RAM(6):=DATAIN;
			when "0111"=>RAM(7):=DATAIN;
			when "1000"=>RAM(8):=DATAIN;
			when "1001"=>RAM(9):=DATAIN;
			when "1010"=>RAM(10):=DATAIN;
			when "1011"=>RAM(11):=DATAIN;
			when "1100"=>RAM(12):=DATAIN;
			when "1101"=>RAM(13):=DATAIN;
			when "1110"=>RAM(14):=DATAIN;
			when others=>RAM(15):=DATAIN; 
		end case;
	elsif (CE_RD='1') then case(AR) is
			when "0000"=>DATAOUT<=RAM(0);
			when "0001"=>DATAOUT<=RAM(1);
			when "0010"=>DATAOUT<=RAM(2);
			when "0011"=>DATAOUT<=RAM(3);
			when "0100"=>DATAOUT<=RAM(4);
			when "0101"=>DATAOUT<=RAM(5);
			when "0110"=>DATAOUT<=RAM(6);
			when "0111"=>DATAOUT<=RAM(7);
			when "1000"=>DATAOUT<=RAM(8);
			when "1001"=>DATAOUT<=RAM(9);
			when "1010"=>DATAOUT<=RAM(10);
			when "1011"=>DATAOUT<=RAM(11);
			when "1100"=>DATAOUT<=RAM(12);
			when "1101"=>DATAOUT<=RAM(13);
			when "1110"=>DATAOUT<=RAM(14);
			when others=>DATAOUT<=RAM(15);
	end case;
	end if;
	end if;
end process;
end ARHRAM;

