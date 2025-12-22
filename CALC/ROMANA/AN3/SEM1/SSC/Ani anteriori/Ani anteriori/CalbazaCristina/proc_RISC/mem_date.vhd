----------------------------------------------------------------------------------
-- Company:         UTCN
-- Engineer: 
-- 
-- Create Date:     14:18:04 04/07/2015 
-- Design Name:     mem_date
-- Module Name:     mem_date - Behavioral 
-- Project Name:    proc_RISC
-- Target Devices: 
-- Tool versions:   Vivado 2016.4
-- Description:     Memorie de date (DIM_MD x 32 biti)
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

entity mem_date is
    Generic (DIM_MD : INTEGER := 256);          -- dimensiunea memoriei de date (cuvinte)
    Port ( Clk      : in  STD_LOGIC;
           Rst      : in  STD_LOGIC;
           WE       : in  STD_LOGIC;
           Adr      : in  STD_LOGIC_VECTOR (7 downto 0);
           Din      : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout     : out STD_LOGIC_VECTOR (31 downto 0));
end mem_date;

architecture Behavioral of mem_date is
    type MD_TYPE is array (0 to DIM_MD-1) of STD_LOGIC_VECTOR (31 downto 0);
    signal MD : MD_TYPE;
begin
    process (Clk)
    begin
        if RISING_EDGE (Clk) then
            if (WE = '1') then
                MD (CONV_INTEGER (Adr)) <= Din;
            else
                if (Rst = '1') then
                    Dout <= (others => '0');
                else
                    Dout <= MD (CONV_INTEGER (Adr));
                end if;
            end if;
        end if;
    end process;
end Behavioral;
