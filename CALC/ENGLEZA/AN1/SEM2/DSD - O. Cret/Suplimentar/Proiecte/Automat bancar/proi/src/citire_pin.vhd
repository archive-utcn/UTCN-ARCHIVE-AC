library IEEE;
use IEEE.std_logic_1164.all;	

entity citire_pin is
	port(
		ADRESA_CARD: in INTEGER range 0 to  31;
		SEL: in std_logic_vector(1 downto 0); --selectii
		x:in std_logic_vector(3 downto 0);--valoare introdusa de la switch
		but1:in std_logic;
	ENABLE: in std_logic;
		iesire: inout std_logic); --iesire comparator (1 daca pinul introdus este egal cu pinul din memorie altfel 0)
	end citire_pin;

architecture arh_citire_pin of citire_pin is

component PIN 
	port (ADRESA_PIN: in integer range 0 to 31 ; -- 32 de pinuri, 5 BITI pentru adrese.
		  MEMORIE_PIN:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)); --pinul are 4 cifre ,deci 16 biti pentru pin.
end component;

	 
component COMPARATOR_CARD_PIN
	port(ADRESA_PIN: in std_logic_vector(15 downto 0);
	PIN_INTRODUS: in std_logic_vector(15 downto 0);
	ENABLE: in std_logic;
	iesire: out std_logic);
end component;

signal pin2: std_logic_vector(15 downto 0);--Pinul din memorie 
signal pin1: std_logic_vector(15 downto 0);--Pinul introdus
begin  
	
	
	process(but1)
	begin
	if but1='1' then	
		case sel is
			when "00"=>pin1(3 downto 0)<=x(3 downto 0);
			when "01"=>pin1(7 downto 4)<=x(3 downto 0);
			when "10"=>pin1(11 downto 8)<=x(3 downto 0);
			when "11"=>pin1(15 downto 12)<=x(3 downto 0);	  
			  when others => pin1 <= (others => '0');
		end case;		  
	end if;
	end process;  
	
	P1:PIN port map(ADRESA_CARD,pin2);
	P2:COMPARATOR_CARD_PIN port map(pin2,pin1,ENABLE,iesire);
	
	
end arh_citire_pin;