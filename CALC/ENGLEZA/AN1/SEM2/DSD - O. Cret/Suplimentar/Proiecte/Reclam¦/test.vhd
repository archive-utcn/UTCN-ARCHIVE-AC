--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:04:02 05/11/2015
-- Design Name:   
-- Module Name:   C:/Users/Toshiba/Desktop/tuflici/test.vhd
-- Project Name:  tuflici
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CharGenerator
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CharGenerator
    PORT(
         CLK : IN  std_logic;
         s : IN  std_logic_vector(1 downto 0);
         CHAR0 : OUT  std_logic_vector(6 downto 0);
         CHAR1 : OUT  std_logic_vector(6 downto 0);
         CHAR2 : OUT  std_logic_vector(6 downto 0);
         CHAR3 : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal CHAR0 : std_logic_vector(6 downto 0);
   signal CHAR1 : std_logic_vector(6 downto 0);
   signal CHAR2 : std_logic_vector(6 downto 0);
   signal CHAR3 : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CharGenerator PORT MAP (
          CLK => CLK,
          s => s,
          CHAR0 => CHAR0,
          CHAR1 => CHAR1,
          CHAR2 => CHAR2,
          CHAR3 => CHAR3
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		s<= "00";
		       wait for 20 ns;	
      -- insert stimulus here 
s<= "01";
		       wait for 20 ns;
				 s<= "10";
		       wait for 20 ns;
				 s<= "11";
		       wait for 20 ns;
      wait;
   end process;

END;
