
-- VHDL Instantiation Created from source file kHz20_Div.vhd -- 21:17:11 05/18/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT kHz20_Div
	PORT(
		Main_CLK : IN std_logic;
		RST : IN std_logic;          
		New_CLK : OUT std_logic
		);
	END COMPONENT;

	Inst_kHz20_Div: kHz20_Div PORT MAP(
		Main_CLK => ,
		RST => ,
		New_CLK => 
	);


