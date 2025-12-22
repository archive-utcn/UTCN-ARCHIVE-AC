
--VHDL model for Decoder of 5-bits Binary Numbers to Two BCD Digits
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity bin2bcd is
	port (
		BIN: in STD_LOGIC_VECTOR (4 downto 0);
		BCD_H: out STD_LOGIC_VECTOR (1 downto 0) ;
		BCD_L: out STD_LOGIC_VECTOR (3 downto 0));
end bin2bcd;

architecture BIN2BCD_ARCH of bin2bcd is

begin
	with BIN select
	BCD_L <=	"0001" when "00001" | "01011" | "10101" | "11111",
				"0010" when "00010" | "01100" | "10110",
				"0011" when "00011" | "01101" | "10111",
				"0100" when "00100" | "01110" | "11000",
				"0101" when "00101" | "01111" | "11001",
				"0110" when "00110" | "10000" | "11010",
				"0111" when "00111" | "10001" | "11011",
				"1000" when "01000" | "10010" | "11100",
				"1001" when "01001" | "10011" | "11101",
				"0000" when others;
				
	BCD_H <= 	"00" when (BIN < 10) else
				"01" when (BIN < 20) else
				"10" when (BIN < 30) else
				"11";
end BIN2BCD_ARCH;

-- VHDL model for double BCD digits to 7-Segment Displays, with turn off Displays 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bcd2led is
	port (
		DIGIT_H: in STD_LOGIC_VECTOR (1 downto 0);
		DIGIT_L: in STD_LOGIC_VECTOR (3 downto 0);
		LED_H: out STD_LOGIC_VECTOR (6 downto 0);
		LED_L: out STD_LOGIC_VECTOR (6 downto 0);
		OFF: in STD_LOGIC);
end bcd2led;

architecture BCD2LED_ARCH of bcd2led is

-- auxiliary signals declaration
	signal L_TMP, H_TMP: STD_LOGIC_VECTOR (6 downto 0);

-- segment encoding
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3
begin

L_TMP<=	"1001111" when (DIGIT_L="0001") else  --1
      	"0010010" when (DIGIT_L="0010") else  --2
		"0000110" when (DIGIT_L="0011") else  --3
		"1001100" when (DIGIT_L="0100") else  --4
		"0100100" when (DIGIT_L="0101") else  --5
		"0100000" when (DIGIT_L="0110") else  --6
		"0001111" when (DIGIT_L="0111") else  --7
		"0000000" when (DIGIT_L="1000") else  --8
		"0000100" when (DIGIT_L="1001") else  --9
		"0000001";     --0

H_TMP<=	"1001111" when (DIGIT_H="01") else  --1
		"0010010" when (DIGIT_H="10") else  --2
		"0000110" when (DIGIT_H="11") else  --3
		"0000001";     --0
		
LED_L <= L_TMP when (OFF='0') else
	 	"1111111";    
LED_H <= H_TMP when (OFF='0') else
	 	"1111111";    
	 	
end BCD2LED_ARCH;  
