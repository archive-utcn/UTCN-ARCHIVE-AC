----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2016 12:47:04 PM
-- Design Name: 
-- Module Name: uart_tx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

entity uart_tx is
    Generic (BIT_RATE : INTEGER := 115_200);
    Port ( Clk    : in STD_LOGIC;
           Rst    : in STD_LOGIC;
           TxData : in STD_LOGIC_VECTOR (7 downto 0);
           Start  : in STD_LOGIC;
           Tx     : out STD_LOGIC;
           TxRdy  : out STD_LOGIC);
end uart_tx;

architecture Behavioral of uart_tx is

constant CLK_FREQ : INTEGER := 100_000_000;
constant T_BIT    : INTEGER := CLK_FREQ / BIT_RATE;
type ST_TYPE is (ready, load, send, waitbit, shift);
signal St      : ST_TYPE := ready;
signal CntBit  : INTEGER range 0 to 10 := 0;                -- contor pentru bitii transmisi
signal CntRate : INTEGER range 0 to T_BIT := 0;             -- contor pentru durata unui bit
signal LdData  : STD_LOGIC := '0';
signal ShData  : STD_LOGIC := '0';
signal TxEn    : STD_LOGIC := '0';
signal TSR     : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');

begin

-- Registrul TSR
    proc_tsr: process (Clk)
    begin
        if rising_edge (Clk) then
            if (Rst = '1') then
                TSR <= (others => '0');
            elsif (LdData = '1') then
                TSR <= '1' & TxData & '0';
            elsif (ShData = '1') then
                TSR <= '0' & TSR (9 downto 1);
            end if;
        end if;
    end process proc_tsr;

-- Automatul de stare pentru unitatea de control
    proc_control: process (Clk)
    begin
        if rising_edge (Clk) then
            if (Rst = '1') then
                St <= ready;
            else
                case St is
                    when ready =>
                        CntRate <= 0;
                        CntBit <= 0;
                        if (Start = '1') then
                            St <= load;
                        end if;
                    when load =>
                        St <= send;
                    when send =>
                        CntBit <= CntBit + 1;
                        St <= waitbit;
                    when waitbit =>
                        CntRate <= CntRate + 1;
                        if (CntRate = T_BIT-3) then
                            CntRate <= 0;
                            St <= shift;
                        end if;
                    when shift =>
                        if (CntBit = 10) then
                            St <= ready;
                        else
                            St <= send;
                        end if;
                    when others =>
                        St <= ready;
                end case;
            end if;
        end if;
    end process proc_control;

-- Setarea semnalelor de comanda
    LdData <= '1' when St = load else '0';
    ShData <= '1' when St = shift else '0';
    TxEn   <= '0' when St = ready or St = load else '1';

-- Setarea semnalelor de iesire
    Tx    <= TSR(0) when TxEn = '1' else '1';
    TxRdy <= '1' when St = ready else '0';

end Behavioral;
