--
--  File: e:\my designs\freq_meter\src\hex2led.vhd
--  created by Design Wizard: 02/16/99 09:20:17
--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {hex2led} architecture {hex2led}}
  
	
library IEEE;
use IEEE.std_logic_1164.all;

entity hex2led is
    port (
        HEX: in STD_LOGIC_VECTOR (3 downto 0);
        LED: out STD_LOGIC_VECTOR (6 downto 0)
    );
end hex2led;

--}} End of automatically maintained section

architecture hex2led of hex2led is
-- segment encoding
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3
begin
	with HEX select
	LED	<=	"1111001" when "0001",	--1
			"0100100" when "0010",	--2
			"0110000" when "0011",	--3
			"0011001" when "0100",	--4
			"0010010" when "0101",	--5
			"0000010" when "0110",	--6
			"1111000" when "0111",	--7
			"0000000" when "1000",	--8
			"0010000" when "1001",	--9
			"0001000" when "1010",	--A
			"0000011" when "1011",	--b
			"1000110" when "1100",	--C
			"0100001" when "1101",	--d
			"0000110" when "1110",	--E
			"0001110" when "1111",	--F
			"1000000" when others;	--0  
end hex2led;
