library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all; 

entity SUM_COMP is 
	port( BUT:in std_logic;
	SOLD:in std_logic_vector(15 downto 0);
	SOUT:out std_logic);
end SUM_COMP; 

architecture ARH of SUM_COMP is	
	signal SUMA_IN: std_logic_vector(15 downto 0);
	signal IES_SUMA: std_logic:='L'; --Iesirea de la comparatorul mai mic ca 1000,1-Daca este , 0-Daca nu 
	signal IES_SUMA2:std_logic:='L'; --IESIRE de la comparatorul mai mic ca sold-ul clientului,1-Daca este,0-Daca nu  

component COMP_MIC
	PORT (A,B:IN std_logic_vector(15 downto 0); 
	BUT: in std_Logic; 
	C:OUT STD_LOGIC); --IESIREA VA AVEA VALOAREA 1 DACA B<=A SI 0 IN CAZ CONTRAR 
end component; 
begin 
D1:COMP_MIC port map("0000001111101000",SUMA_IN,BUT,IES_SUMA); 
D2:COMP_MIC port map(SOLD,SUMA_IN,BUT,IES_SUMA2); 
SOUT<=IES_SUMA and IES_SUMA2 when IES_SUMA='1' and IES_SUMA2='1';  
end ARH;