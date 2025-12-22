----------------------------------------------------------------------------------
-- Company:         UTCN 
-- Engineer: 
-- 
-- Create Date:     02/04/2016 10:12:56 AM
-- Design Name:     displ7seg_blink
-- Module Name:     displ7seg_blink - Behavioral
-- Project Name: 
-- Target Devices:  Nexys4 DDR (xc7a100tcsg324-1)
-- Tool Versions:   Vivado 2015.4, Vivado 2016.4
-- Description:     Multiplexor pentru afisajul cu 7 segmente, cu posibilitatea palpairii. 
--                  Datele de la intrare nu sunt decodificate, ci se trimit direct 
--                  la catozii afisajului. Pentru afisarea unor date hexazecimale, 
--                  fiecare cifra hexazecimala trebuie aplicata la intrarea Data
--                  prin intermediul functiei HEX2SSEG. Pentru palpairea unei cifre, 
--                  bitul 7 al codului cifrei trebuie setat la 1.
--                  Codificarea segmentelor (biti 7..0): 0gfe dcba
--                        a
--                       ---  
--                    f |   | b
--                       ---    <- g
--                    e |   | c
--                       --- 
--                        d
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity displ7seg_blink is
    Port ( Clk  : in  STD_LOGIC;
           Rst  : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (63 downto 0);   -- configuratia segmentelor pentru 8 cifre (cifra 1 din stanga: biti 63..56)
           An   : out STD_LOGIC_VECTOR (7 downto 0);    -- selectia anodului activ 
           Seg  : out STD_LOGIC_VECTOR (7 downto 0));   -- selectia catozilor (segmentelor) cifrei active 
end displ7seg_blink;

architecture Behavioral of displ7seg_blink is

constant CNT_100HZ : INTEGER := 2**20;                  -- divizor pentru rata de reimprospatare de ~100 Hz (cu un ceas de 100 MHz) 
constant CNT_500MS : INTEGER := 50000000;	            -- divizor pentru 500 ms (cu un ceas de 100 MHz) 
signal Num         : INTEGER range 0 to CNT_100HZ - 1 := 0;
signal NumBlink    : INTEGER range 0 to CNT_500MS - 1 := 0;
signal BlinkOn     : STD_LOGIC := '0';
signal NumV        : STD_LOGIC_VECTOR (19 downto 0) := (others => '0');    
signal LedSel      : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
signal Digit1      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');    
signal Digit2      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit3      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit4      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit5      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit6      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit7      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit8      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin

-- Proces pentru divizarea ceasului 
div_clk: process (Clk)
begin
    if RISING_EDGE (Clk) then
        if (Rst = '1') then
            Num <= 0;
        elsif (Num = CNT_100HZ - 1) then
            Num <= 0;
        else
            Num <= Num + 1;
        end if;
    end if;
    end process div_clk;

    NumV <= CONV_STD_LOGIC_VECTOR (Num, 20);
    LedSel <= NumV (19 downto 17);

-- Proces pentru palpaire 
blink: process (Clk)
begin
    if RISING_EDGE (Clk) then
        if (Rst = '1') then
            NumBlink <= 0;
            BlinkOn <= '0';
		elsif (NumBlink = CNT_500MS - 1) then
			NumBlink <= 0;
			BlinkOn <= not BlinkOn;
		else
			NumBlink <= NumBlink + 1;
		end if;
	end if;
end process blink;

-- Selectia datelor de afisat pentru palpaire 
	Digit8 <= X"FF" when (BlinkOn = '1') and (Data(7)  = '1') else
              '1' & Data (6 downto 0);
	Digit7 <= X"FF" when (BlinkOn = '1') and (Data(15) = '1') else
              '1' & Data (14 downto 8);
	Digit6 <= X"FF" when (BlinkOn = '1') and (Data(23) = '1') else
              '1' & Data (22 downto 16);
	Digit5 <= X"FF" when (BlinkOn = '1') and (Data(31) = '1') else
              '1' & Data (30 downto 24);
	Digit4 <= X"FF" when (BlinkOn = '1') and (Data(39) = '1') else
              '1' & Data (38 downto 32);
	Digit3 <= X"FF" when (BlinkOn = '1') and (Data(47) = '1') else
              '1' & Data (46 downto 40);
	Digit2 <= X"FF" when (BlinkOn = '1') and (Data(55) = '1') else
              '1' & Data (54 downto 48);
    Digit1 <= X"FF" when (BlinkOn = '1') and (Data(63) = '1') else
              '1' & Data (62 downto 56);

-- Selectia anodului activ
    An <= "11111110" when LedSel = "000" else
          "11111101" when LedSel = "001" else
          "11111011" when LedSel = "010" else
          "11110111" when LedSel = "011" else
          "11101111" when LedSel = "100" else
          "11011111" when LedSel = "101" else
          "10111111" when LedSel = "110" else
          "01111111" when LedSel = "111" else
          "11111111";

-- Selectia segmentelor cifrei active
    Seg <= Digit8 when LedSel = "000" else
           Digit7 when LedSel = "001" else
           Digit6 when LedSel = "010" else
           Digit5 when LedSel = "011" else
           Digit4 when LedSel = "100" else
           Digit3 when LedSel = "101" else
           Digit2 when LedSel = "110" else
           Digit1 when LedSel = "111" else
           X"FF";

end Behavioral;
