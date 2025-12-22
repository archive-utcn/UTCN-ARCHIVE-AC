library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity system is
	port(boardCLK:in std_logic;
	RST:in std_logic;
	CONTROL: in std_logic_vector(7 downto 0);
	DISPcontrol: out std_logic_vector(3 downto 0);
	DISPdata: out std_logic_vector(7 downto 0));
end system;

architecture system_a of system is
signal dispCLK:std_logic;
signal CLK:std_logic;		   
signal fastCLK:std_logic;
signal internalDISP: std_logic_vector(3 downto 0); 
signal memPath: std_logic_vector(2 downto 0);
signal anim_1_addr: std_logic_vector(2 downto 0);
signal anim_2_addr: std_logic_vector(2 downto 0);
signal anim_3_addr: std_logic_vector(2 downto 0);
signal anim_4_addr: std_logic_vector(2 downto 0);
signal anim_5_addr: std_logic_vector(2 downto 0);
signal anim_6_addr: std_logic_vector(2 downto 0);
signal anim_7_addr: std_logic_vector(2 downto 0);
signal anim_8_addr: std_logic_vector(2 downto 0);
signal anim_1_enbl: std_logic;
signal anim_2_enbl: std_logic;
signal anim_3_enbl: std_logic;
signal anim_4_enbl: std_logic;
signal anim_5_enbl: std_logic;
signal anim_6_enbl: std_logic;
signal anim_7_enbl: std_logic;
signal anim_8_enbl: std_logic; 

component Hz1_Div
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end component; 		

component kHz20_Div
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end component;

component disp_control
	port(CLK: in std_logic;
	RST:in std_logic;
	D:out std_logic_vector(3 downto 0));
end component; 

component letters_ROM is
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(7 downto 0));
end component;	

component dmux_8_enable
	port(sel:in std_logic_vector(7 downto 0);
	A:out std_logic;
	B:out std_logic;
	C:out std_logic;
	D:out std_logic;
	E:out std_logic;
	F:out std_logic;
	G:out std_logic;
	H:out std_logic);
end component; 

component mux_8
	port(A:in std_logic_vector(2 downto 0);
	B:in std_logic_vector(2 downto 0);
	C:in std_logic_vector(2 downto 0);
	D:in std_logic_vector(2 downto 0);
	E:in std_logic_vector(2 downto 0);
	F:in std_logic_vector(2 downto 0);
	G:in std_logic_vector(2 downto 0);
	H:in std_logic_vector(2 downto 0);
	sel:in std_logic_vector(7 downto 0);
	O:out std_logic_vector(2 downto 0));
end component; 

component anim_zero
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end component;

component anim_one
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end component; 

component anim_two
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end component;

component anim_three
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));
end component;

component  anim_four
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end component;					 

component anim_five	  
	port(CLK:in std_logic;
	boardCLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end component;	

component  anim_sixv2 is
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end component;

component anim_seven is	 
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end component;
	

begin	
	DivFrecvAnim: Hz1_Div port map(boardCLK,RST,CLK);		
	DivFrecvDisp: kHz20_Div port map(boardCLK,RST,dispCLK);
	DisplayController: disp_control port map(dispCLK,RST,internalDISP);
	DISPcontrol<=internalDISP;
	CharacterMemory: letters_ROM port map(memPath,DISPdata);
	EnableDMUX: dmux_8_enable port map(CONTROL,anim_1_enbl,anim_2_enbl,anim_3_enbl,anim_4_enbl,
												  anim_5_enbl,anim_6_enbl,anim_7_enbl,anim_8_enbl);	
	AddressMUX: mux_8 port map(anim_1_addr,anim_2_addr,anim_3_addr,anim_4_addr,
									   anim_5_addr,anim_6_addr,anim_7_addr,anim_8_addr,CONTROL,memPath);
	Animation0: anim_zero port map(CLK,RST,anim_1_enbl,internalDISP,anim_1_addr);
	Animation1: anim_one port map(CLK,RST,anim_2_enbl,internalDISP,anim_2_addr);
	Animation2: anim_two port map(CLK,RST,anim_3_enbl,internalDISP,anim_3_addr);
	Animation3: anim_three port map(CLK,RST,anim_4_enbl,internalDISP,anim_4_addr);
	Animation4: anim_four port map(CLK,RST,anim_5_enbl,internalDISP,anim_5_addr);
	Animation5: anim_five port map(CLK,boardCLK,RST,anim_6_enbl,internalDISP,anim_6_addr);
	Animation6: anim_sixv2 port map(boardCLK,RST,anim_7_enbl,internalDISP,anim_7_addr);
	Animation7: anim_seven port map(boardCLK,RST,anim_8_enbl,internalDISP,anim_8_addr);
end system_a;
