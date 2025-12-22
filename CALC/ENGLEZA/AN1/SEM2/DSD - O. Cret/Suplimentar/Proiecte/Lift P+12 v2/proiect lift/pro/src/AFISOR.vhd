library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;

  entity AFISOR is
    port( CLOCK : in STD_LOGIC;
	     RESET:in std_logic;
		  D1: in STD_LOGIC_VECTOR(3 downto 0);
		  D2: in STD_LOGIC_VECTOR(3 downto 0);
          ANOD : out STD_LOGIC_VECTOR (3 downto 0);
          CATOD : out STD_LOGIC_VECTOR (6 downto 0));
  end AFISOR;

 architecture afis of AFISOR is
component NUM is
	port( CLOCK: in STD_LOGIC;	 
	C: out STD_LOGIC);
	
	
end component NUM;
	
component mux16_1 is
	port(I0 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I1 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I2 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I3 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I4 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I5 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I6 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I7 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I8 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I9 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I10 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I11 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I12 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I13 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I14 : in STD_LOGIC_VECTOR (3 downto 0);
 	     I15 : in STD_LOGIC_VECTOR (3 downto 0);
         SEL : in STD_LOGIC_VECTOR (3 downto 0);
         Y : out STD_LOGIC_VECTOR (3 downto 0));
end component mux16_1;

component REGISTRU is
 port ( CLK,RESET : in STD_LOGIC;
 	   Y : out STD_LOGIC_VECTOR (3 downto 0));
 end component REGISTRU;

 component BCD7 is
	port(BCD: in STD_LOGIC_vector(3 downto 0);
	DECOD: out STD_LOGIC_VECTOR(6 downto 0));
end component BCD7;


signal c:std_logic;
signal b:std_logic_vector(3 downto 0);
signal s:std_logic_vector(3 downto 0);

 begin

	--DIV_FRECV: NUM port map(CLOCK,c);
	DECOD: BCD7 port map(b,CATOD);
	MUXX: mux16_1 port map("0000","0000","0000","0000","0000","0000","0000","0000","0000","0000","0000","1111","0000",d2,d1,"0000",s,b);
	REG: REGISTRU port map(CLOCK,RESET,s);

   ANOD<=s;

      end afis;