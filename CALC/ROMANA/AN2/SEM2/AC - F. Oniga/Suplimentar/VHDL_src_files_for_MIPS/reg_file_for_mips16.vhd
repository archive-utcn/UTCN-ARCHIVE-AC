----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 06:26:42 PM
-- Design Name: 
-- Module Name: reg_file_for_mips16 - Behavioral
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

entity reg_file_for_mips16 is
  Port ( 
        clk: in std_logic;
        enable_mpg: in std_logic;
        RegWrite: in std_logic;
        RA1: in std_logic_vector(2 downto 0);
        RA2: in std_logic_vector(2 downto 0);
        WA: in std_logic_vector(2 downto 0);
        WD: in std_logic_vector(15 downto 0);
        RD1: out std_logic_vector(15 downto 0);
        RD2: out std_logic_vector(15 downto 0)
  );
end reg_file_for_mips16;

architecture Behavioral of reg_file_for_mips16 is
    type register_array is array (0 to 7) of std_logic_vector(15 downto 0);
    signal reg_file: register_array := (
        x"0001",
        x"0201",
        x"2402",
        x"ABCD",
        x"1BCA",
        others=>x"0000"
    );
begin
    process (clk) 
    begin
        if falling_edge(clk) then
            if RegWrite = '1' then
                if enable_mpg = '1' then
                    reg_file(conv_integer(WA)) <= WD;
                end if;
            end if;
        end if;
    end process;
    
    RD1 <= reg_file(conv_integer(RA1));
    RD2 <= reg_file(conv_integer(RA2));

end Behavioral;
