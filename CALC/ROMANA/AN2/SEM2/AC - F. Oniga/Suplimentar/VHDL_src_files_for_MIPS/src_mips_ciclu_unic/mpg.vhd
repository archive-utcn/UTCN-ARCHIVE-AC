----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2021 09:42:32 PM
-- Design Name: 
-- Module Name: mpg - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mpg is
  Port ( clk : in std_logic;
        btn : in std_logic;
        en : out std_logic );
end mpg;

architecture Behavioral of mpg is
signal count : std_logic_vector(15 downto 0) := (others => '0');
signal q1 : std_logic;
signal q2 : std_logic;
signal q3 : std_logic;
begin
process(clk)
begin
    if rising_edge(clk) then
        count <= count + 1;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if count(15 downto 0) = x"1111" then
            q1 <= btn;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        q2 <= q1;
        q3 <= q2;
    end if;
end process;

en <= q2 and (not q3);

end Behavioral;