library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity FIFO is
	port(INDATA: in std_logic_vector(7 downto 0);
	CAT: out std_logic_vector(6 downto 0);
	AN: out std_logic_vector(3 downto 0);
	PUSH,POP: in std_logic;
	CLK:inout std_logic;
	EMPTY,LAST,FULL: out std_logic);
end FIFO;
architecture ARHFIFO of FIFO is	
component DIVIZOR is 
	port ( CLK_IN : in STD_LOGIC;
	      CLK_OUT : out STD_LOGIC);
end component;
component CONTROL is
	port( PUSH,POP,FULL,EMPTY: in std_logic;
	CE_WR,CE_RD: out std_logic);
end component;
component STATUS is
	port(CE_WR,CE_RD,RESET: in std_logic;
	CLK: in std_logic;
	EMPTY,LAST,FULL: out std_logic);
end component;	
component MEMORY is
	port(CE_WR,CE_RD: in std_logic;
	CLK: in std_logic;
	DATAIN: in std_logic_vector(7 downto 0);
	DATAOUT: out std_logic_vector(7 downto 0));
end component; 	 
component SSD is
port( clk: in STD_LOGIC;
		digits: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		an: out STD_LOGIC_VECTOR(3 DOWNTO 0);
		cat: out STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;
signal A,B,C,D,E,F,L: std_logic;
signal OUTDATA: std_logic_vector(7 downto 0); 
signal DIGITS: std_logic_vector(15 downto 0);
begin	
	  Frecventa: DIVIZOR port map(CLK,CLK); 
      A<='0';
	  Primaparte: CONTROL port map(PUSH,POP,F,E,C,D);   
	  Adouaparte: STATUS port map(C,D,A,CLK,E,L,F);
	  Atreiaparte: MEMORY port map(C,D,CLK,INDATA,OUTDATA);	
	  DIGITS<=x"00"&OUTDATA;
	  Afisare: SSD port map(CLK,DIGITS,AN,CAT);
	  EMPTY<=E;
	  FULL<=F;
	  LAST<=L;
end ARHFIFO;