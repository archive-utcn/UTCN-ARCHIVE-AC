----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:02:21 03/27/2013 
-- Design Name: 
-- Module Name:    display - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity display is
    Port ( clk 	: in  STD_LOGIC;
           d1 		: in  STD_LOGIC_VECTOR (3 downto 0);
           d2 		: in  STD_LOGIC_VECTOR (3 downto 0);
           d3 		: in  STD_LOGIC_VECTOR (3 downto 0);
           d4 		: in  STD_LOGIC_VECTOR (3 downto 0);
			  cat 	: out  STD_LOGIC_VECTOR (6 downto 0);
           an 		: out  STD_LOGIC_VECTOR (3 downto 0));
end display;

architecture Behavioral of display is


signal cnt 		: std_logic_vector(15 downto 0);	
	signal sel 	: std_logic_vector(1 downto 0);	
	signal d 	: std_logic_vector(3 downto 0);
begin

	process(clk)
	begin
		if rising_edge(clk) then
			cnt <= cnt + 1;
		end if;
	end process;
	
	sel <= cnt(15 downto 14);
	
	process(sel)
	begin
		case sel is
			when "00"	=> d <= d1; an <= "1110";
			when "01"	=> d <= d2; an <= "1101";
			when "10"	=> d <= d3; an <= "1011";
			when others	=> d <= d4; an <= "0111";
		end case;
	end process;
	
	
	with d Select
	cat<= "1111001" when "0001",   --1
         "0100100" when "0010",   --2
         "0110000" when "0011",   --3
         "0011001" when "0100",   --4
         "0010010" when "0101",   --5
         "0000010" when "0110",   --6
         "1111000" when "0111",   --7
         "0000000" when "1000",   --8
         "0010000" when "1001",   --9
         "0001000" when "1010",   --A
         "0000011" when "1011",   --b
         "1000110" when "1100",   --C
         "0100001" when "1101",   --d
         "0000110" when "1110",   --E
         "0001110" when "1111",   --F
         "1000000" when others;   --0

end Behavioral;






