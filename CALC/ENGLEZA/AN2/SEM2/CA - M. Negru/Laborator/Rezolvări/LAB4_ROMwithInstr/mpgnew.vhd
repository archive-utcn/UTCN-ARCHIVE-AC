----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2016 07:20:56 PM
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

entity mpgnew is
    Port ( btn : in STD_LOGIC_VECTOR(4 DOWNTO 0);
           clk : in STD_LOGIC;
           en : out STD_LOGIC_VECTOR(4 DOWNTO 0));
end mpgnew;

architecture Behavioral of mpgnew is
signal cnt: std_logic_vector(15 downto 0);
signal q1:STD_LOGIC_VECTOR(4 DOWNTO 0);
signal q2:STD_LOGIC_VECTOR(4 DOWNTO 0);
signal q3:STD_LOGIC_VECTOR(4 DOWNTO 0);

begin

count: process(clk)
        begin
            if rising_edge(clk) then
            cnt <= cnt+1;
            end if;
           end process count;
reg1: process(clk)
begin
	if rising_edge(clk) then
	if cnt = x"FFFF" then
		q1 <= btn;
	end if;
	end if;
	
end process;
reg2: process (clk)
begin
	if rising_edge(clk) then
	
		q2 <= q1;
	
	end if;
end process;

reg3: process (clk)
begin
	if rising_edge(clk) then
	
		q3 <= q2;
	end if;
end process;
              
en <= q2 and (not q3);
end Behavioral;
