----------------------------------------------------------------------------------
-- Company:        UTCN
-- Engineer: 
-- 
-- Create Date:    11:23:23 02/09/2011 
-- Design Name:    clock
-- Module Name:    time_cnt - Behavioral 
-- Project Name: 
-- Target Devices: Nexys4 DDR (xc7a100tcsg324-1)
-- Tool versions:  Vivado 2015.4, Vivado 2016.4
-- Description:    Modul contor de timp pentru ceasul de timp real
--
-- Dependencies: 
--
-- Revision:       0.01 - File Created
-- Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity time_cnt is
    Port ( Clk     : in   STD_LOGIC;
           Rst     : in   STD_LOGIC;
           IncTime : in   STD_LOGIC;
           IncHour : in   STD_LOGIC;
           DecHour : in   STD_LOGIC;
           IncMin  : in   STD_LOGIC;
           DecMin  : in   STD_LOGIC;
           IncSec  : in   STD_LOGIC;
           DecSec  : in   STD_LOGIC;
           HourHi  : out  STD_LOGIC_VECTOR (3 downto 0);
           HourLo  : out  STD_LOGIC_VECTOR (3 downto 0);
           MinHi   : out  STD_LOGIC_VECTOR (3 downto 0);
           MinLo   : out  STD_LOGIC_VECTOR (3 downto 0);
           SecHi   : out  STD_LOGIC_VECTOR (3 downto 0);
           SecLo   : out  STD_LOGIC_VECTOR (3 downto 0));
end time_cnt;

architecture Behavioral of time_cnt is

signal CntSecHi  : STD_LOGIC_VECTOR (3 downto 0) := X"0";
signal CntSecLo  : STD_LOGIC_VECTOR (3 downto 0) := X"0";
signal CntMinHi  : STD_LOGIC_VECTOR (3 downto 0) := X"0";
signal CntMinLo  : STD_LOGIC_VECTOR (3 downto 0) := X"0";
signal CntHourHi : STD_LOGIC_VECTOR (3 downto 0) := X"1";
signal CntHourLo : STD_LOGIC_VECTOR (3 downto 0) := X"2";
signal TcSec     : STD_LOGIC := '0';
signal TcMin     : STD_LOGIC := '0';

begin

sec_cnt: process (Clk)      -- Contor pentru secunde
begin
	if RISING_EDGE (Clk) then
        if (Rst = '1') then
            CntSecLo <= X"0";
            CntSecHi <= X"0";
		else
            TcSec <= '0';
            if ((IncTime = '1') or (IncSec = '1')) then
                if (CntSecLo = X"9") then
                    CntSecLo <= X"0";
                    if (CntSecHi = X"5") then
                        CntSecHi <= X"0";
                        if (IncTime = '1') then
                            TcSec <= '1';
                        end if;
                    else
                        CntSecHi <= CntSecHi + 1;
                    end if;
                else
                    CntSecLo <= CntSecLo + 1;
                end if;
            end if;
            if (DecSec = '1') then
                if (CntSecLo = X"0") then
                    CntSecLo <= X"9";
                    if (CntSecHi = X"0") then
                        CntSecHi <= X"5";
                    else
                        CntSecHi <= CntSecHi - 1;
                    end if;
                else
                    CntSecLo <= CntSecLo - 1;
                end if;
            end if;
        end if;
    end if;
end process sec_cnt;

min_cnt: process (Clk)      -- Contor pentru minute
begin
	if RISING_EDGE (Clk) then
        if (Rst = '1') then
            CntMinLo <= X"0";
            CntMinHi <= X"0";
        else
            TcMin <= '0';
            if ((TcSec = '1') or (IncMin = '1')) then
                if (CntMinLo = X"9") then
                    CntMinLo <= X"0";
                    if (CntMinHi = X"5") then
                        CntMinHi <= X"0";
                        if (TcSec = '1') then
                            TcMin <= '1';
                        end if;
                    else
                        CntMinHi <= CntMinHi + 1;
                    end if;
                else
                    CntMinLo <= CntMinLo + 1;
                end if;
            end if;
            if (DecMin = '1') then
                if (CntMinLo = X"0") then
                    CntMinLo <= X"9";
                    if (CntMinHi = X"0") then
                        CntMinHi <= X"5";
                    else
                        CntMinHi <= CntMinHi - 1;
                    end if;
                else
                    CntMinLo <= CntMinLo - 1;
                end if;
            end if;
        end if;
    end if;
end process min_cnt;

hour_cnt: process (Clk)     -- Contor pentru ore
begin
	if RISING_EDGE (Clk) then
        if (Rst = '1') then
            CntHourLo <= X"2";
            CntHourHi <= X"1";
        else
            if ((TcMin = '1') or (IncHour = '1')) then
                if ((CntHourHi = X"2") and (CntHourLo = X"3")) then
                    CntHourHi <= X"0";
                    CntHourLo <= X"0";
                elsif (CntHourLo = X"9") then
                    CntHourLo <= X"0";
                    CntHourHi <= CntHourHi + 1;
                else
                    CntHourLo <= CntHourLo + 1;
                end if;
            end if;
            if (DecHour = '1') then
                if ((CntHourHi = X"0") and (CntHourLo = X"0")) then
                    CntHourHi <= X"2";
                    CntHourLo <= X"3";
                elsif (CntHourLo = X"0") then
                    CntHourLo <= X"9";
                    CntHourHi <= CntHourHi - 1;
                else
                    CntHourLo <= CntHourLo - 1;
                end if;
            end if;
        end if;
    end if;
end process hour_cnt;

	HourHi <= CntHourHi;
	HourLo <= CntHourLo;
	MinHi  <= CntMinHi;
	MinLo  <= CntMinLo;
	SecHi  <= CntSecHi;
	SecLo  <= CntSecLo;
	
end Behavioral;
