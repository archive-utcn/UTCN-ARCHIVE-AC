----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:13 04/30/2015 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;	
use ieee.std_logic_arith.all;
entity num_sin is
	port(clk4:in std_logic;
	clk_div:out std_logic);
end num_sin;
architecture num_sin_arch of num_sin is
signal div: std_logic_vector (17 downto 0):=("000000000000000000");
begin	  
p1:process(clk4)
begin
if clk4'event and clk4='1' then
div <= div+1;
end if;
clk_div <= div(17);	 
end process;   
end  num_sin_arch;

