----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:34 04/03/2013 
-- Design Name: 
-- Module Name:    memo_ram - Behavioral 
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

entity ram is
port (
	clk		: in std_logic;
	we			: in std_logic;							--write enable
	addr		: in std_logic_vector(15 downto 0);
	di			: in std_logic_vector(15 downto 0);
	m			: in std_logic; 							--selectul de la multiplexor
	wd			: out std_logic_vector (15 downto 0)
	);
	
end ram;

architecture syn of ram is



type ram_type is array (0 to 15) of std_logic_vector (15 downto 0);
signal RAM : ram_type
:= (
x"000A",
x"000B",
x"000C",
x"000D",
x"000E",
x"000F",
x"0006",
others => x"0000"
);
signal do: std_logic_vector(15 downto 0); --data output din rom

begin
		process (clk)
			begin
				if clk'event and clk = '1' then
					--if en = '1' then
							if we = '1' then
								RAM(conv_integer(addr(3 downto 0))) <= di;					
							end if;
					--end if;
			end if;
		end process;
	do <= RAM( conv_integer(addr)); --pt ca scrierea nu depinde de clk
   -- muxul de la iesire din ram
	wd<=do when m='0' --pt m=0 face load 
		else addr;
	
end syn;




