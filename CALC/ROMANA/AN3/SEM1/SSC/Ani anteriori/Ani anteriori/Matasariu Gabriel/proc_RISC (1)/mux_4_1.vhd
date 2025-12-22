----------------------------------------------------------------------------------
-- Company:         UTCN
-- Engineer: 
-- 
-- Create Date:     13:58:52 04/01/2015 
-- Design Name:     mux_4_1
-- Module Name:     mux_4_1 - Behavioral 
-- Project Name:    proc_RISC
-- Target Devices: 
-- Tool versions:   Vivado 2016.4
-- Description:     Multiplexor 4:1 de un bit
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

entity mux_4_1 is
    Port ( I0  : in  STD_LOGIC;
           I1  : in  STD_LOGIC;
           I2  : in  STD_LOGIC;
           I3  : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Z   : out STD_LOGIC);
end mux_4_1;

architecture Behavioral of mux_4_1 is
begin
    with Sel select
        Z <= I0 when "00",
             I1 when "01",
             I2 when "10",
             I3 when others;
end Behavioral;
