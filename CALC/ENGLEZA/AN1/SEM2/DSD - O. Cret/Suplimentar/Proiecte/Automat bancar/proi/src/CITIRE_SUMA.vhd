		LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CITIRE_SUMA IS
	PORT (	ENABLE: IN STD_LOGIC;
	SEL:IN STD_LOGIC_VECTOR(1 DOWNTO 0)	;
	X:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	BUT:IN STD_LOGIC;
	SUMA_INTRODUSA:OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	ENAB: out std_logic);
END CITIRE_SUMA;		 

ARCHITECTURE ARH_SUMA OF CITIRE_SUMA IS
BEGIN
	process(but)
	
	begin
	if but='1' and enable='1' then	
		case sel is			
			when "00"=>suma_introdusa(3 downto 0)<=x; 
			when "01"=>suma_introdusa(7 downto 4)<=x; 
			when "10"=>suma_introdusa(11 downto 8)<=x; 
			when "11"=>suma_introdusa(15 downto 12)<=x;  
			  when others => suma_introdusa <= (others => '0'); 
		  
		END CASE;
		 ENAB<='1';
	END IF;

	END PROCESS;
	 
END ARH_SUMA;