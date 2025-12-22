library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
uSE ieee.numeric_std.all;
uSE ieee.std_logic_arith.all;	   
use ieee.std_logic_unsigned.all; 



entity FrequencyDivider is
	port (
	CLK_Original  : in STD_logic;		--Orig Clk
	CLK_SSD : out Std_logic;			 -- 
	CLK_CharGen: out Std_logic
	);
	
	end FrequencyDivider;
	
	
	architecture A of FrequencyDivider is
	signal Num24 : std_logic_vector(23 downto 0);	 --Counter 24 bits
	begin
	Num24 <= Num24 + 1 when rising_edge(CLK_Original);
	CLK_SSD <= NUM24 ( 17) ;
	CLK_CharGen <= NUM24 (22) ;
		
		
		end A;