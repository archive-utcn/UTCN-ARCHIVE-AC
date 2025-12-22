LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;	   

ENTITY COMANDA IS 
	PORT(SWITCH:IN STD_LOGIC_VECTOR (7 downto 0);
	RESET:IN STD_LOGIC;
	CLK:IN STD_LOGIC;
	OPT:std_logic;
	ENABLE:std_logic;
	WE:std_logic;
	AFISOR:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	SOLD_NOU:OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	OK_CARD,OK_PIN,S,RN,CHITANTA,SOUT,PIN_INCORECT:OUT STD_LOGIC);
END COMANDA;

ARCHITECTURE ARCH_COMANDA OF COMANDA IS

COMPONENT DMUX
	port(OPT:in std_logic;
	RESET:in std_logic;
	S,RN:out std_logic);
END COMPONENT;

COMPONENT IDEN_CARD
	port(ADRESA_CARD: in std_logic_vector(3 downto 0);
	RESET: in std_logic;
	ADDR: inout INTEGER range 0 to 11;
	OK_CARD: out std_logic);
END COMPONENT;

COMPONENT Receipt
	port( OPT: in std_logic; 
	 IESIRE_CHIT: out std_logic; 
     finish: out std_logic);  
END COMPONENT;	  

COMPONENT COMP_MIC
	PORT (A,B:in std_logic_vector(15 downto 0); 
	BUT: in std_Logic;  
	C:OUT STD_LOGIC); 
END COMPONENT;	

COMPONENT PIN
	port(adresa_pin: in std_logic_vector(3 downto 0);
	Data: inout std_logic_vector(15 downto 0)); 
END COMPONENT;
 
COMPONENT RAM
	port(ADRESA_CARD: in std_logic_vector(3 downto 0);
	WE: in std_logic;
	SUMA: in std_logic_vector(15 downto 0);
	SOLD: out std_logic_vector(15 downto 0)); 
END COMPONENT;  

COMPONENT SUBTRACTOR
	port(A,B: in std_logic_vector(15 downto 0); 
	CLK: in std_logic;
	C: out std_logic_vector(15 downto 0));  
END COMPONENT;

COMPONENT COMP_EGAL 
	PORT( A,B:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	BUT: in std_logic;
	C:OUT STD_LOGIC);
END COMPONENT;

COMPONENT x7seg is
	port(BCD: in std_logic_vector(3 downto 0);
	ENABLE: in std_logic;
	Afisor: out std_logic_vector(6 downto 0));
END COMPONENT;

COMPONENT COMP_INTEGER 
	port(A,B: in integer range 0 to 11;
	BUT:in std_logic;
	C:out std_logic);
END COMPONENT;

COMPONENT DIVIZOR 
	PORT(ENABLE:IN STD_LOGIC; 
	CLOCK_DIV:IN STD_LOGIC; 
	CLK:OUT STD_LOGIC);
END COMPONENT;

COMPONENT CITIRE_ADRESA
	PORT(A:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	CLK:IN STD_LOGIC;
	ADR:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); 
END COMPONENT;

COMPONENT CITIRE_SUMA 
	PORT (A:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	CLK,ENABLE:IN STD_LOGIC;
	SUMA:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END COMPONENT;

COMPONENT CITIRE_PIN
	PORT (A:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	CLK,ENABLE:IN STD_LOGIC;
	PIN:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END COMPONENT;

COMPONENT REGISTRU 	
	PORT(A:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	CLK,ENABLE:IN STD_LOGIC;
	Y:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;

signal ADRESA_CARD:std_logic_vector(3 downto 0);
signal Addr:integer range 0 to 11;
signal CARD_OK:std_logic;
signal PIN_Mem:std_logic_vector(15 downto 0);--Pinul din memorie
signal OPIN:std_logic;--pinul este OK 
signal PIN_IN:std_logic_vector(15 downto 0);--Pinul introdus
signal Retragere:std_logic;
signal AFIS_SOLD:std_logic;
signal SUMA_IN: std_logic_vector(15 downto 0);--Suma introdusa
signal IES_SUMA:std_logic:='1'; --Iesirea de la comparatorul mai mic ca 1000,1-Daca este , 0-Daca nu 
signal IES_SUMA2:std_logic:='1';--IESIRE de la comparatorul mai mic ca sold-ul clientului,1-Daca este,0-Daca nu  
signal SOLD:std_logic_vector(15 downto 0);
signal FINISH:std_logic;
signal CLR:std_logic;
signal BCD:std_logic_vector(3 downto 0);
signal IESIRE_CHIT:std_logic;
signal AF1,AF2,AF3,AF4:std_logic_vector(6 downto 0);--anoduri
signal CLOCK_AFISOR:std_logic;
signal SEL_AFISOR:std_logic_vector(1 downto 0);
signal SUMA:std_logic_vector(15 downto 0);

begin
	P1: IDEN_CARD port map (ADRESA_CARD,Reset,Addr);
	P2: CITIRE_ADRESA port map (SWITCH,CLK,ADRESA_CARD);--citirea adreselor
	P3: COMP_INTEGER port map (conv_integer(SWITCH),Addr,ENABLE,CARD_OK);--compararea adreselor
	P4: PIN port map (ADRESA_CARD,PIN_MEM);
	P5: CITIRE_PIN port map (SWITCH,CLK,ENABLE,PIN_IN);
	P6: COMP_EGAL port map (PIN_MEM,PIN_IN,ENABLE,OPIN);
	P7: CITIRE_SUMA port map (SWITCH,CLK,ENABLE,SUMA_IN);
	P8: DMUX port map ('0',RESET,Retragere);--Retragere numerar
	P9: DMUX port map ('1',RESET,AFIS_SOLD);--Afisare sold
  P10: COMP_MIC port map ("0000001111101000",SUMA_IN,Retragere,IES_SUMA); --Compara cu 1000
  P11: COMP_MIC port map (SOLD,SUMA_IN,IES_SUMA,IES_SUMA2);--Compara cu soldul
  P12: RAM port map (ADRESA_CARD,WE,SUMA_IN,SOLD);
  P13: SUBTRACTOR port map (SOLD,SUMA_IN,CLK,SOLD_NOU);
  P14: RECEIPT port map (OPT,IESIRE_CHIT,FINISH);
  P15: x7seg port map (SOLD(15 downto 12),AFIS_SOLD,AF4);
  P16: x7seg port map (SOLD(11 downto 8),AFIS_SOLD,AF3);
  P17: x7seg port map (SOLD(7 downto 4),AFIS_SOLD,AF2);
  P18: x7seg port map (SOLD(3 downto 0),AFIS_SOLD,AF1);

	--LED
	OK_CARD<=CARD_OK when CARD_OK='1';
	OK_PIN<=OPIN when OPIN='1';
	PIN_INCORECT<=OPIN when OPIN='0';
	SOUT<=IES_SUMA and IES_SUMA2 when IES_SUMA='1' and IES_SUMA2='1';--daca suma este mai mica decat 1000 si decat sold-ul
	CHITANTA<=IESIRE_CHIT when IESIRE_CHIT='1';
	RN<=Retragere when Retragere='1';
	S<=AFIS_SOLD when AFIS_SOLD='1';
end ARCH_COMANDA;
	
	