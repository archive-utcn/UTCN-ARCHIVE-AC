library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
uSE ieee.numeric_std.all;
uSE ieee.std_logic_arith.all;	   
use ieee.std_logic_unsigned.all; 


entity main is
	port(S: in STD_LOGIC_VECTOR(1 downto 0);
	CLK: in STD_LOGIC;
	anods: out STD_LOGIC_VECTOR(3 downto 0);
	display: out STD_LOGIC_VECTOR(6 downto 0));
end main;

architecture arch_main of main is
component SSDControl 
	
	port 	( 
	--- Inputs 
	CLK : in STD_Logic ; -- CLK 100 Hz	
	CHAR0 : in STD_Logic_Vector(6 downto 0);
    CHAR1 : in STD_Logic_Vector(6 downto 0);	
    CHAR2 : in STD_Logic_Vector(6 downto 0);
    CHAR3 : in STD_Logic_Vector(6 downto 0);
	---	Outputs
	Catods : out STD_Logic_Vector(6 downto 0) ;   
	Anods :  out STD_Logic_Vector(3 downto 0)
	
	) ;
	
end component SSDControl;	 

component CharGenerator	 
	
	port ( 	
	--- Inputs 	
	CLK : in STD_Logic ;-- Clk 100 Hz
	s: in STD_LOGIC_VECTOR(1 downto 0); 
	-- Outputs
	
	CHAR0 : out STD_Logic_Vector(6 downto 0);
    CHAR1 : out STD_Logic_Vector(6 downto 0);	
    CHAR2 : out STD_Logic_Vector(6 downto 0);
    CHAR3 : out STD_Logic_Vector(6 downto 0)
	)  ;	  
	
end component CharGenerator ;	

component FrequencyDivider
	port (
	CLK_Original  : in STD_logic;		--Orig Clk
	CLK_SSD : out Std_logic;			 -- 
	CLK_CharGen: out Std_logic
	);
	
end component FrequencyDivider;
signal CLK_SSD,CLK_CharGen: std_logic;
signal CHAR0 :  STD_Logic_Vector(6 downto 0);
signal CHAR1 :  STD_Logic_Vector(6 downto 0);	
signal CHAR2 :  STD_Logic_Vector(6 downto 0);
signal CHAR3 :  STD_Logic_Vector(6 downto 0);
begin
	comp1: FrequencyDivider port map(CLK,CLK_SSD,CLK_CharGen);
	comp2: CharGenerator port map(CLK_CharGen,S,CHAR0,CHAR1,CHAR2,CHAR3);
	comp3: SSDControl port map(CLK,CHAR0,CHAR1,CHAR2,CHAR3,display,anods);
end arch_main;
