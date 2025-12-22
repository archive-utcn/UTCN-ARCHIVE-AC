
-- VHDL Instantiation Created from source file disp_control.vhd -- 12:34:12 03/26/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT disp_control
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		D : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_disp_control: disp_control PORT MAP(
		CLK => ,
		RST => ,
		D => 
	);


