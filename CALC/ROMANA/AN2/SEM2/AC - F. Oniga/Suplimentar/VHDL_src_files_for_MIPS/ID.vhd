----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 06:38:26 PM
-- Design Name: 
-- Module Name: ID - Behavioral
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

entity ID is
  Port (
        clk: in std_logic;
        enable: in std_logic;
        RegWrite: in std_logic;
        instr: in std_logic_vector(15 downto 0);
        RegDst: in std_logic;
        WD: in std_logic_vector(15 downto 0);
        ExtOp: in std_logic;
        WriteAddress: in std_logic_vector(2 downto 0);
        RD1: out std_logic_vector(15 downto 0);
        RD2: out std_logic_vector(15 downto 0);
        ExtImm: out std_logic_vector(15 downto 0);
        func: out std_logic_vector(2 downto 0);
        sa: out std_logic;
        rt: out std_logic_vector(2 downto 0);
        rd: out std_logic_vector(2 downto 0)
   );
end ID;

architecture Behavioral of ID is

component reg_file_for_mips16 is
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
end component;

signal wrAddr: std_logic_vector(2 downto 0) := ( others => '0' );

begin

    register_file: reg_file_for_mips16 port map( clk => clk, enable_mpg => enable, RegWrite => RegWrite,  RA1 => instr(12 downto 10), RA2 => instr(9 downto 7), WA => WriteAddress, WD => WD, RD1 => RD1, RD2 => RD2 );
    
    -- mux_2_la_1: wrAddr <= instr(9 downto 7) when RegDst = '0' else instr(6 downto 4);
    
    sa <= instr(3);
    
    func <= instr(2 downto 0);
    
    ExtImm <= B"000_000_000" & instr(6 downto 0) when ExtOp = '0'
        else instr(6) & instr(6) & instr(6) & instr(6) & instr(6) & instr(6) & instr(6) & instr(6) & instr(6) & instr(6 downto 0);
        
    rt <= instr(9 downto 7);
    rd <= instr(6 downto 4);
    
end Behavioral;
