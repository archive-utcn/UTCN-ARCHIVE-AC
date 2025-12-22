----------------------------------------------------------------------------------
-- Company:        UTCN
-- Engineer: 
-- 
-- Create Date:    11:15:34 02/09/2011 
-- Design Name:    clock
-- Module Name:    control - Behavioral 
-- Project Name: 
-- Target Devices: Nexys4 DDR (xc7a100tcsg324-1)
-- Tool versions:  Vivado 2015.4, Vivado 2016.4
-- Description:    Modul de control pentru ceasul de timp real
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

entity control is
    Port ( Clk     : in   STD_LOGIC;
           Rst     : in   STD_LOGIC;
           ModeIn  : in   STD_LOGIC;
           UpIn    : in   STD_LOGIC;
           DownIn  : in   STD_LOGIC;
           IncTime : out  STD_LOGIC;
           IncHour : out  STD_LOGIC;
           DecHour : out  STD_LOGIC;
           BlHour  : out  STD_LOGIC;
           IncMin  : out  STD_LOGIC;
           DecMin  : out  STD_LOGIC;
           BlMin   : out  STD_LOGIC;
           IncSec  : out  STD_LOGIC;
           DecSec  : out  STD_LOGIC;
           BlSec   : out  STD_LOGIC);
end control;

architecture Behavioral of control is

constant CNT_1HZ : INTEGER := 100000000;        -- divizor pentru 1 s (cu un ceas de 100 MHz)
type ctrl_type is (run, set_hour, set_hour_inc, set_hour_dec, set_min, set_min_inc,
                   set_min_dec, set_sec, set_sec_inc, set_sec_dec);
signal CtrlState : ctrl_type;

begin

ctrl: process (Clk)
variable Count : INTEGER range 0 to CNT_1HZ := 0;
begin
	if RISING_EDGE (Clk) then
        if (Rst = '1') then
            CtrlState <= run;
            Count := 0;
        else
            case CtrlState is
                when run =>
                    if Count = CNT_1HZ then
                        IncTime <= '1';
                    Count := 0;
                    else
                        IncTime <= '0';
                        Count := Count + 1;
                    end if;
                    if (ModeIn = '1') then
                        CtrlState <= set_hour;
                    else
                        CtrlState <= run;
                    end if;
                when set_hour =>
                    IncTime <= '0';
                    if (UpIn = '1') then
                        CtrlState <= set_hour_inc;
                    elsif (DownIn = '1') then
                        CtrlState <= set_hour_dec;
                    elsif (ModeIn = '1') then
                        CtrlState <= set_min;
                    else
                        CtrlState <= set_hour;
                    end if;
                when set_hour_inc =>
                    IncTime <= '0';
                    CtrlState <= set_hour;
                when set_hour_dec =>
                    IncTime <= '0';
                    CtrlState <= set_hour;
                when set_min =>
                    IncTime <= '0';
                    if (UpIn = '1') then
                        CtrlState <= set_min_inc;
                    elsif (DownIn = '1') then
                        CtrlState <= set_min_dec;
                    elsif (ModeIn = '1') then
                        CtrlState <= set_sec;
                    else
                        CtrlState <= set_min;
                    end if;
                when set_min_inc =>
                    IncTime <= '0';
                    CtrlState <= set_min;
                when set_min_dec =>
                    IncTime <= '0';
                    CtrlState <= set_min;
                when set_sec =>
                    IncTime <= '0';
                    Count := 0;
                    if (UpIn = '1') then
                        CtrlState <= set_sec_inc;
                    elsif (DownIn = '1') then
                        CtrlState <= set_sec_dec;
                    elsif (ModeIn = '1') then
                        CtrlState <= run;
                    else
                        CtrlState <= set_sec;
                    end if;
                when set_sec_inc =>
                    IncTime <= '0';
                    CtrlState <= set_sec;
                when set_sec_dec =>
                    IncTime <= '0';
                    CtrlState <= set_sec;
            end case;
        end if;
    end if;
end process ctrl;

    IncHour <= '1' when (CtrlState = set_hour_inc) else '0';
    DecHour <= '1' when (CtrlState = set_hour_dec) else '0';
    BlHour  <= '1' when (CtrlState = set_hour) else '0';
    IncMin  <= '1' when (CtrlState = set_min_inc) else '0';
    DecMin  <= '1' when (CtrlState = set_min_dec) else '0';
    BlMin   <= '1' when (CtrlState = set_min) else '0';
    IncSec  <= '1' when (CtrlState = set_sec_inc) else '0';
    DecSec  <= '1' when (CtrlState = set_sec_dec) else '0';
    BlSec   <= '1' when (CtrlState = set_sec) else '0';

end Behavioral;
