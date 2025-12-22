----------------------------------------------------------------------------------
-- Company:        UTCN
-- Engineer: 
-- 
-- Create Date:    10:48:13 02/09/2011 
-- Design Name:    clock
-- Module Name:    clock - Behavioral 
-- Project Name: 
-- Target Devices: Nexys4 DDR (xc7a100tcsg324-1)
-- Tool versions:  Vivado 2015.4, Vivado 2016.4
-- Description:    Ceas de timp real pentru placa Nexys4 DDR
--                 Afiseaza ora, minutul, secunda
-- Dependencies: 
--
-- Revision:       0.01 - File Created
-- Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock is
    Port ( Clk  : in  STD_LOGIC;
           Rst  : in  STD_LOGIC;
           Mode : in  STD_LOGIC;
           Up   : in  STD_LOGIC;
           Down : in  STD_LOGIC;
           An   : out STD_LOGIC_VECTOR (7 downto 0);
           Seg  : out STD_LOGIC_VECTOR (7 downto 0));
end clock;

architecture Behavioral of clock is

-- Functie de decodificare pentru afisajul cu sapte segmente
-- Codificarea segmentelor (biti 7..0): hgfe dcba (h - punctul zecimal)
--      a
--     ---  
--  f |   | b
--     ---    <- g
--  e |   | c
--     ---  . <- h
--      d

function HEX2SSEG (Hex : in STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
	variable Sseg : STD_LOGIC_VECTOR (7 downto 0);
begin
    case Hex is
        when "0000" => Sseg := "11000000";  -- 0
        when "0001" => Sseg := "11111001";  -- 1
        when "0010" => Sseg := "10100100";  -- 2
        when "0011" => Sseg := "10110000";  -- 3
        when "0100" => Sseg := "10011001";  -- 4
        when "0101" => Sseg := "10010010";  -- 5
        when "0110" => Sseg := "10000010";  -- 6
        when "0111" => Sseg := "11111000";  -- 7
        when "1000" => Sseg := "10000000";  -- 8
        when "1001" => Sseg := "10010000";  -- 9
        when "1010" => Sseg := "10001000";  -- A
        when "1011" => Sseg := "10000011";  -- b
        when "1100" => Sseg := "11000110";  -- C
        when "1101" => Sseg := "10100001";  -- d
        when "1110" => Sseg := "10000110";  -- E
        when "1111" => Sseg := "10001110";  -- F
        when others => Sseg := "11111111";
    end case;
	return Sseg;
end function HEX2SSEG;

signal Data   : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');
signal Digit1 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit2 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit3 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit4 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit5 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit6 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit7 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal Digit8 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); 

signal IncTime : STD_LOGIC := '0';
signal IncHour : STD_LOGIC := '0';
signal DecHour : STD_LOGIC := '0';
signal BlHour  : STD_LOGIC := '0';
signal IncMin  : STD_LOGIC := '0';
signal DecMin  : STD_LOGIC := '0';
signal BlMin   : STD_LOGIC := '0';
signal IncSec  : STD_LOGIC := '0';
signal DecSec  : STD_LOGIC := '0';
signal BlSec   : STD_LOGIC := '0';
signal HourHi  : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal HourLo  : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal MinHi   : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal MinLo   : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal SecHi   : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal SecLo   : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal Rstp    : STD_LOGIC := '0';

begin

    Rstp <= not Rst;
	Digit1 <= (HEX2SSEG (HourHi) and X"7F") or (BlHour & "0000000");               -- cifrele 1-2: ora      
	Digit2 <= (HEX2SSEG (HourLo) and X"7F") or (BlHour & "0000000");
    Digit3 <= B"0011_1111" when (BlHour = '1') or (BlMin = '1') or (BlSec = '1')   -- cifra 3: fara palpaire la setarea ceasului, 
                           else B"1011_1111";                                      -- altfel cu palpaire
	Digit4 <= (HEX2SSEG (MinHi) and X"7F") or (BlMin & "0000000");                 -- cifrele 4-5: minutul
	Digit5 <= (HEX2SSEG (MinLo) and X"7F") or (BlMin & "0000000");
    Digit6 <= B"0011_1111" when (BlHour = '1') or (BlMin = '1') or (BlSec = '1')   -- cifra 6: fara palpaire la setarea ceasului, 
                           else B"1011_1111";                                      -- altfel cu palpaire
	Digit7 <= (HEX2SSEG (SecHi) and X"7F") or (BlSec & "0000000");                 -- cifrele 7-8: secunda
	Digit8 <= (HEX2SSEG (SecLo) and X"7F") or (BlSec & "0000000");
	Data   <= Digit1 & Digit2 & Digit3 & Digit4 & Digit5 & Digit6 & Digit7 & Digit8;
	
	control_i: entity WORK.control port map (
                      Clk => Clk, 
                      Rst => Rstp, 
                      ModeIn => Mode, 
                      UpIn => Up, 
                      DownIn => Down, 
                      IncTime => IncTime, 
                      IncHour => IncHour, 
                      DecHour => DecHour,
                      BlHour  => BlHour,
                      IncMin => IncMin, 
                      DecMin => DecMin,
                      BlMin  => BlMin,
                      IncSec => IncSec, 
                      DecSec => DecSec,
                      BlSec  => BlSec);

	time_cnt_i: entity WORK.time_cnt port map (
                      Clk => Clk,
                      Rst => Rstp, 
                      IncTime => IncTime, 
                      IncHour => IncHour, 
                      DecHour => DecHour, 
                      IncMin => IncMin, 
                      DecMin => DecMin, 
                      IncSec => IncSec, 
                      DecSec => DecSec, 
                      HourHi => HourHi, 
                      HourLo => HourLo, 
                      MinHi  => MinHi,
                      MinLo  => MinLo,
                      SecHi  => SecHi,
                      SecLo  => SecLo);

	displ7seg_blink_i: entity WORK.displ7seg_blink port map (
                      Clk => Clk,
                      Rst => Rstp,
                      Data => Data,
                      An => An,
                      Seg => Seg);

end Behavioral;
