----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2021 06:39:47 PM
-- Design Name: 
-- Module Name: instruction_fetch - Behavioral
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

entity instruction_fetch is
  Port ( clk : in STD_LOGIC;
         en : in STD_LOGIC;
         clr : in STD_LOGIC;
         branch_addr : in STD_LOGIC_VECTOR (15 downto 0);
         jmp_addr : in STD_LOGIC_VECTOR (15 downto 0);
         jump : in STD_LOGIC;
         PCSrc : in STD_LOGIC;
         current_instr : out STD_LOGIC_VECTOR (15 downto 0);
         next_instr_addr : out STD_LOGIC_VECTOR (15 downto 0));
end instruction_fetch;

architecture Behavioral of instruction_fetch is

signal pc_out : STD_LOGIC_VECTOR (15 DOWNTO 0) := X"0000";
signal sum_out : STD_LOGIC_VECTOR (15 downto 0) := X"0000";
signal mux1_out : STD_LOGIC_VECTOR (15 downto 0) := X"0000";
signal mux2_out : STD_LOGIC_VECTOR (15 downto 0) := X"0000";
type rom_array is array (0 to 255) of std_logic_vector(15 downto 0);
signal rom256x16: rom_array := (
    B"000_000_000_001_0_000",       -- add $1, $0, $0       #0010
    B"001_000_100_0001010",         -- addi $4, $0, 10      #220A
    B"000_000_000_010_0_000",       -- add $2, $0, $0       #0020
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"010_010_101_0000000",         -- lw $5, 0($2)         #4A80
    B"100_001_100_0010001",         -- beq $1, $4, 17       #8311
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"010_010_011_0000000",         -- lw $3, 0($2)         #4980
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_101_011_110_0_001",       -- sub $6, $5, $3       #15E1
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"101_110_000_0000100",         -- bgez $6, 4           #B804
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"000_000_011_101_0_000",       -- add $5, $0, $3       #01D0
    B"001_010_010_0000010",         -- addi $2, $2, 2       #2902
    B"001_001_001_0000001",         -- addi $1, $1, 1       #2401
    B"111_0000000000110",           -- j 6                  #E006
    B"000_000_000_000_0_000",       -- noop                 #0000
    B"011_000_101_0010100",         -- sw $5, 20($0)        #6294
    others => x"1111"
);

begin
    -- PC
    process(clk, en, clr)
    begin
        if clr = '1' then
            pc_out <= x"0000";
        else
            if rising_edge(clk) then
                if en = '1' then
                    pc_out <= mux2_out;
                end if;
            end if;
        end if;
    end process;
    
    -- sumator 
    sum_out <= pc_out + 1;
    
    -- memoria de instructiuni
    current_instr <= rom256x16(conv_integer(pc_out));
    
    next_instr_addr <= sum_out;
    
    -- mux1
    mux1_out <= sum_out when PCSrc = '0'
                else branch_addr;
    
    -- mux2
    mux2_out <= mux1_out when jump = '0'
                else jmp_addr;
    

end Behavioral;
