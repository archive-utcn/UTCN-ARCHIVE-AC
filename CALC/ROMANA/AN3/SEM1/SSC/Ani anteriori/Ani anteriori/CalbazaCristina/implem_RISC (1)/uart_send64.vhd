----------------------------------------------------------------------------------
-- Company:        UTCN
-- Engineer: 
-- 
-- Create Date:    04/10/2016 02:33:56 PM 
-- Design Name:    uart_send64
-- Module Name:    uart_send64 - Behavioral 
-- Project Name:   implem_RISC
-- Target Devices: 
-- Tool versions:  Vivado 2015.5, 2016.4
-- Description:    Modul pentru transmisia pe interfata seriala UART a 
--                 64 de caractere urmate de caracterele CR, LF
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

entity uart_send64 is
    Port ( Clk   : in STD_LOGIC;
           Rst   : in STD_LOGIC;
           Data1 : in STD_LOGIC_VECTOR (63 downto 0);
           Data2 : in STD_LOGIC_VECTOR (63 downto 0);
           Data3 : in STD_LOGIC_VECTOR (63 downto 0);
           Data4 : in STD_LOGIC_VECTOR (63 downto 0);
           Data5 : in STD_LOGIC_VECTOR (63 downto 0);
           Data6 : in STD_LOGIC_VECTOR (63 downto 0);
           Data7 : in STD_LOGIC_VECTOR (63 downto 0);
           Data8 : in STD_LOGIC_VECTOR (63 downto 0);
           Send  : in STD_LOGIC;
           Tx    : out STD_LOGIC;
           Rdy   : out STD_LOGIC);
end uart_send64;

architecture Behavioral of uart_send64 is
    constant CR    : STD_LOGIC_VECTOR (7 downto 0) := x"0D";
    constant LF    : STD_LOGIC_VECTOR (7 downto 0) := x"0A";
    type ST_TYPE is (ready, send_byte, wait_rdy, inc_cnt, test_cnt);
    signal St      : ST_TYPE := ready;
    signal TxData  : STD_LOGIC_VECTOR (7 downto 0) := x"00";
    signal Start   : STD_LOGIC := '0';
    signal TxRdy   : STD_LOGIC := '0';
    signal CntSend : INTEGER range 0 to 66 := 0;

begin

-- Instantierea modulului uart_tx
    uart_tx_i: entity WORK.uart_tx port map (
                Clk => Clk,
                Rst => Rst,
                TxData => TxData,
                Start => Start,
                Tx => Tx,
                TxRdy => TxRdy);

-- Automatul de stare pentru transmisia caracterelor
    proc_send: process (Clk)
    begin
        if rising_edge (Clk) then
            if (Rst = '1') then
                CntSend <= 0;
                St <= ready;
            else
                case St is
                    when ready =>
                        CntSend <= 0;
                        if (Send = '1') then
                            St <= send_byte;
                        end if;
                    when send_byte =>
                        St <= wait_rdy;
                    when wait_rdy =>
                        if (TxRdy = '1') then
                            St <= inc_cnt;
                        end if;
                    when inc_cnt =>
                        CntSend <= CntSend + 1;
                        St <= test_cnt;
                    when test_cnt =>
                        if (CntSend = 66) then
                            St <= ready;
                        else
                            St <= send_byte;
                        end if;
                    when others =>
                        St <= ready;
                end case;
            end if;
        end if;
    end process proc_send;

    Start <= '1' when St = send_byte else '0';
    Rdy   <= '1' when St = ready else '0';

-- Selectia octetului care trebuie transmis
    with CntSend select
        TxData <= Data1 (63 downto 56) when 00,
                  Data1 (55 downto 48) when 01,
                  Data1 (47 downto 40) when 02,
                  Data1 (39 downto 32) when 03,
                  Data1 (31 downto 24) when 04,
                  Data1 (23 downto 16) when 05,
                  Data1 (15 downto  8) when 06,
                  Data1 ( 7 downto  0) when 07,
                  Data2 (63 downto 56) when 08,
                  Data2 (55 downto 48) when 09,
                  Data2 (47 downto 40) when 10,
                  Data2 (39 downto 32) when 11,
                  Data2 (31 downto 24) when 12,
                  Data2 (23 downto 16) when 13,
                  Data2 (15 downto  8) when 14,
                  Data2 ( 7 downto  0) when 15,
                  Data3 (63 downto 56) when 16,
                  Data3 (55 downto 48) when 17,
                  Data3 (47 downto 40) when 18,
                  Data3 (39 downto 32) when 19,
                  Data3 (31 downto 24) when 20,
                  Data3 (23 downto 16) when 21,
                  Data3 (15 downto  8) when 22,
                  Data3 ( 7 downto  0) when 23,
                  Data4 (63 downto 56) when 24,
                  Data4 (55 downto 48) when 25,
                  Data4 (47 downto 40) when 26,
                  Data4 (39 downto 32) when 27,
                  Data4 (31 downto 24) when 28,
                  Data4 (23 downto 16) when 29,
                  Data4 (15 downto  8) when 30,
                  Data4 ( 7 downto  0) when 31,
                  Data5 (63 downto 56) when 32,
                  Data5 (55 downto 48) when 33,
                  Data5 (47 downto 40) when 34,
                  Data5 (39 downto 32) when 35,
                  Data5 (31 downto 24) when 36,
                  Data5 (23 downto 16) when 37,
                  Data5 (15 downto  8) when 38,
                  Data5 ( 7 downto  0) when 39,
                  Data6 (63 downto 56) when 40,
                  Data6 (55 downto 48) when 41,
                  Data6 (47 downto 40) when 42,
                  Data6 (39 downto 32) when 43,
                  Data6 (31 downto 24) when 44,
                  Data6 (23 downto 16) when 45,
                  Data6 (15 downto  8) when 46,
                  Data6 ( 7 downto  0) when 47,
                  Data7 (63 downto 56) when 48,
                  Data7 (55 downto 48) when 49,
                  Data7 (47 downto 40) when 50,
                  Data7 (39 downto 32) when 51,
                  Data7 (31 downto 24) when 52,
                  Data7 (23 downto 16) when 53,
                  Data7 (15 downto  8) when 54,
                  Data7 ( 7 downto  0) when 55,
                  Data8 (63 downto 56) when 56,
                  Data8 (55 downto 48) when 57,
                  Data8 (47 downto 40) when 58,
                  Data8 (39 downto 32) when 59,
                  Data8 (31 downto 24) when 60,
                  Data8 (23 downto 16) when 61,
                  Data8 (15 downto  8) when 62,
                  Data8 ( 7 downto  0) when 63,
                  CR when 64,
                  LF when 65,
                  x"20" when others;
end Behavioral;
