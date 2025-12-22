library IEEE; 
use IEEE.std_logic_1164.all;

entity PIN_Comp is
	port(ADRESA_CARD: in std_logic_vector(3 downto 0);
	PIN_IN:in std_logic_vector(15 downto 0);
	BUT:in std_logic;
	PIN_OUT:out std_logic);
end PIN_Comp;

architecture A of PIN_Comp is

component COMP_EGAL is
	PORT( A,B:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	BUT: in std_logic;
	C:OUT STD_LOGIC); 
end component; 

component PIN is
	port(adresa_pin: std_logic_vector(3 downto 0);
	Data: inout std_logic_vector(15 downto 0));
end component;

signal PIN_Mem:std_logic_vector(15 downto 0);--Pinul din memorie
signal OPIN:std_logic;--pinul este OK

begin 
	Q1:PIN port map(ADRESA_CARD,PIN_MEM);
	Q2:COMP_EGAL port map (PIN_MEM,PIN_IN,BUT,OPIN);
	PIN_OUT<=OPIN when OPIN='1';
end A;

				
