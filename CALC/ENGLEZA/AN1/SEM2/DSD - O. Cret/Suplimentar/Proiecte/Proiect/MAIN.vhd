library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MAIN is
	port(boardCLK:in std_logic;
	RST:in std_logic;
	CONTROL: in std_logic_vector(3 downto 0);
	ANOD_CTRL: out std_logic_vector(3 downto 0);
	ANOD_DATA: out std_logic_vector(7 downto 0));
end MAIN;

architecture MAIN_a of MAIN is
signal dispCLK:std_logic;
signal CLK:std_logic;		   
signal intCLK:std_logic;
signal internalDISP: std_logic_vector(3 downto 0); 
signal memPath: std_logic_vector(1 downto 0);

signal address0: std_logic_vector(1 downto 0);
signal address1: std_logic_vector(1 downto 0);
signal address2: std_logic_vector(1 downto 0);
signal address3: std_logic_vector(1 downto 0);

signal enable0: std_logic;
signal enable1: std_logic;
signal enable2: std_logic;
signal enable3: std_logic;


component div_anim
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end component; 		

component div_anod
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end component;

component disp_control
	port(CLK: in std_logic;
	RST:in std_logic;
	D:out std_logic_vector(3 downto 0));
end component; 

component letters_ROM is
	port(A:in std_logic_vector(1 downto 0);
		O:out std_logic_vector(7 downto 0));
end component;	

component EN_DMUX_4_1
	port(sel:in std_logic_vector(3 downto 0);
	A:out std_logic;
	B:out std_logic;
	C:out std_logic;
	D:out std_logic);
end component; 

component MUX4_1
	port(A:in std_logic_vector(1 downto 0);
	B:in std_logic_vector(1 downto 0);
	C:in std_logic_vector(1 downto 0);
	D:in std_logic_vector(1 downto 0);
	sel:in std_logic_vector(3 downto 0);
	O:out std_logic_vector(1 downto 0));
end component; 

component anim0
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	address_out:out std_logic_vector(1 downto 0));	
end component;

component anim1
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	address_out:out std_logic_vector(1 downto 0));	
end component; 

component anim2
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	address_out:out std_logic_vector(1 downto 0));	
end component;



component anim3
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	address_out:out std_logic_vector(1 downto 0));	
end component;					 

	

begin	
	DivizorFrecventaAnimatie: div_anim port map(boardCLK,RST,CLK);		
	DivizorFrecventaAnod: div_anod port map(boardCLK,RST,dispCLK);
	DisplayController: disp_control port map(dispCLK,RST,internalDISP);
	ANOD_CTRL<=internalDISP;
	NumbersMemory: letters_ROM port map(memPath,ANOD_DATA);
	DMUX_MUX: EN_DMUX_4_1 port map(CONTROL,enable0,enable1,enable2,enable3);	
	AddressMUX: MUX4_1 port map(address0,address1,address2,address3,CONTROL,memPath);
	
	Animation0: anim0 port map(CLK,RST,enable0,internalDISP,address0);
	Animation1: anim1 port map(CLK,RST,enable1,internalDISP,address1);
	Animation2: anim2 port map(CLK,RST,enable2,internalDISP,address2);
	Animation3: anim3 port map(CLK,RST,enable3,internalDISP,address3);
	
	
end MAIN_a;
