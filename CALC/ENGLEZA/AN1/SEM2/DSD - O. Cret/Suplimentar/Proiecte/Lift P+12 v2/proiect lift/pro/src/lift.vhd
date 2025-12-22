library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


entity LIFT is 		   
	port( CERERE: in STD_LOGIC_VECTOR(3 downto 0);
	--intrare:in std_logic_vector(3 downto 0);
	IEUD: in STD_LOGIC_VECTOR(3 downto 0);
	UI: in STD_LOGIC;
	UD: out STD_LOGIC;
	OK,RESET,CLOCK:in STD_LOGIC;
	SENZOR: in STD_LOGIC;
	SENZOR_O: out STD_LOGIC;
	CATOD: out STD_LOGIC_VECTOR(6 downto 0));
end LIFT;

architecture automat of lift is 
component poarta_si is
	port( A,B,C : in STD_LOGIC;
	Y: out STD_LOGIC);
end component poarta_si;

component poarta_nu is 
	port(A: in STD_LOGIC;
	B: out STD_LOGIC);
end component poarta_nu;

component RAM is
	port(  A1,A2 : in STD_LOGIC_VECTOR(3 downto 0);
	WE,reset: in STD_LOGIC;
    D: in STD_LOGIC_VECTOR(3 downto 0);
	B: out STD_LOGIC_VECTOR(3 downto 0));
	end component RAM;

component unit is
	port( IEUD : in STD_LOGIC_VECTOR(3 downto 0);
	--OUT_NUM: in STD_LOGIC_VECTOR(3 downto 0);
	  UP: in STD_LOGIC;
	CLK_NUM: out STD_LOGIC);
end component unit;


component  NUMARATOR1 is
	port(
		RESET:in STD_LOgic;
	CLK: in STD_LOGIC;
	UP: out STD_LOGIC;
	OUT_NUM: out STD_LOGIC_VECTOR(3 downto 0));
end component NUMARATOR1;

component NUMARATOR_2 is
	port( CLOCK,RESET: in STD_LOGIC;
	UP:in STD_LOGIC;
	OUT_NUM: in STD_LOGIC_VECTOR(3 downto 0);
	C: out STD_LOGIC:='0'; 
	OUT_NUM2: out STD_LOGIC_VECTOR(3 downto 0));
end component NUMARATOR_2; 

component numarator3 is 
	port(CLOCK: in STD_LOGIC;
	RESET: in STD_LOGIC;
	UP: in STD_LOGIC;
	UI: in STD_LOGIC;
	O: out STD_LOGIC_VECTOR(3 downto 0);
	CD,CU: out STD_LOGIC);
end component numarator3;	

component numarator4 is 
	port( CU,CD,RESET: in STD_LOGIC;
	O: out STD_LOGIC_VECTOR(3 downto 0));
end component numarator4;

component AFISOR is
    port( CLOCK : in STD_LOGIC;
	     RESET:in std_logic;
		  D1: in STD_LOGIC_VECTOR(3 downto 0); 
		  D2: in STD_LOGIC_VECTOR(3 downto 0);
          ANOD : out STD_LOGIC_VECTOR (3 downto 0);
          CATOD : out STD_LOGIC_VECTOR (6 downto 0));
  end component AFISOR;

signal OUT_NUM:STD_LOGIC_VECTOR(3 downto 0);
signal OUT_NUM2:STD_LOGIC_VECTOR(3 downto 0);
signal OUT_NUM3 : STD_LOGIC_VECTOR(3 downto 0);
signal OUT_NUM4:STD_LOGIC_VECTOR(3 downto 0);
signal ANOD: STD_LOGIC_VECTOR(3 downto 0);
--signal s1:STD_LOGIC;
--signal s2:STD_LOGIC;
signal CL: STD_LOGIC;
signal CU,CD: STD_LOGIC;
signal c:STD_LOGIC;
signal UP:STD_LOGIC;
signal CLK_NUM:STD_LOGIC;
signal CLK_NUM1:STD_LOGIC;
signal CLK_NUM2:STD_LOGIC;
signal IEUD_O: STD_LOGIC_VECTOR(3 downto 0);	 

begin

	P1: RAM port map ( CERERE,OUT_NUM,OK,reset,IEUD,IEUD_O); 
	P2: unit port map(IEUD_O,UP,CLK_NUM);
	P3: poarta_si port map(CLK_NUM,UI,SENZOR,CL);
	P4:poarta_si port map(CL,c,'1',CLK_NUM1);		
    P5:NUMARATOR1 port map(RESET,CL,UP,OUT_NUM); 
    P6: poarta_nu port map(c,UD); 					 
	P7: poarta_nu port map(CLK_NUM,CLK_NUM2);
    P8: NUMARATOR_2 port map(CLK_NUM2,RESET,UP,OUT_NUM,c,OUT_NUM2);
	P9: NUMARATOR3 port map(CLK_NUM2,RESET,UP,UI,OUT_NUM3,CD,CU);
	P10: NUMARATOR4 port map( CU,CD,RESET,OUT_NUM4);
	P11: AFISOR port map(CLOCK,RESET,OUT_NUM4,OUT_NUM3,ANOD,CATOD);
	--UD<=c;
end automat;
	

