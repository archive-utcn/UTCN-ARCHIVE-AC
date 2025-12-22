----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2021 07:47:43 PM
-- Design Name: 
-- Module Name: MEM - Behavioral
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

entity MEM is
  Port ( 
        clk :       in STD_LOGIC;
        enable :    in STD_LOGIC;
        MemWrite :  in STD_LOGIC;
        Addr :      in STD_LOGIC_VECTOR (15 downto 0);
        w_data :    in STD_LOGIC_VECTOR (15 downto 0);
        r_data :    out STD_LOGIC_VECTOR (15 downto 0);
        ALUResult : out STD_LOGIC_VECTOR (15 downto 0)
  );
end MEM;

architecture Behavioral of MEM is
    type ram_array is array (0 to 31) of std_logic_vector(15 downto 0);
    signal RAM: ram_array := (
        X"000A",
        X"0001",
        X"0110",
        X"B001",
        X"0C60",
        X"1743",
        X"3F10",
        X"2008",
        X"0403",
        X"6005",
        others => x"0000"
    );
begin
    -- citirea este asincrona
    r_data <= RAM(conv_integer(Addr(7 downto 0)));
    process (clk) 
    begin
        if enable = '1' then
            -- scrierea este sincrona
            if rising_edge(clk) and MemWrite = '1' then
                RAM(conv_integer(Addr(7 downto 0))) <= w_data;
            end if;
        end if;
    end process;

    
    
    AlUresult <= Addr;

end Behavioral;
