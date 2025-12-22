library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity RAM is
	port(  A1,A2 : in STD_LOGIC_VECTOR(3 downto 0);
	WE,reset: in STD_LOGIC;
    D: in STD_LOGIC_VECTOR(3 downto 0);
	B: out STD_LOGIC_VECTOR(3 downto 0));
	end RAM;
architecture RAAM of RAM is	 
type matrice is array (0 to 15) of STD_LOGIC_VECTOR (3 downto 0);  
	
begin 	 			
	process(WE,A1,A2,RESET,D)  
	 variable m: matrice;
	begin  
		if reset='1' then
			m(0):= "0000";	 
			m(1):= "0000";
			m(2):= "0000";
			m(3):= "0000";
			m(4):= "0000";
			m(5):= "0000";
			m(6):= "0000";
			m(7):= "0000";
			m(8):= "0000";
			m(9):= "0000";
			m(10):= "0000";
			m(11):= "0000";
			m(12):= "0000";
			m(13):= "0000";
			m(14):= "0000";
			m(15):= "0000";	
		else
		if (WE = '1') then 
			case A1 is
				when "0000" => m(0):=D;
				when "0001" => m(1):=D;
				when "0010" => m(2):=D;
				when "0011" => m(3):=D;
				when "0100" => m(4):=D;
				when "0101" =>m(5):=D;
				when "0110" =>m(6):=D;
				when "0111" =>m(7):=D;
				when "1000" =>m(8):=D;
				when "1001" => m(9):=D;	
				when "1010" => m(10):=D;
				when "1011" => m(11):=D;
				when "1100" => m(12):=D;
				when others=> m(15):="0000";	
			end case; 	
			else 
			case A2 is 
				when  "0000" => B<=m(0);
				when  "0001" => B<=m(1);
				when  "0010" => B<=m(2);
				when  "0011" => B<=m(3);
				when  "0100" => B<=m(4);
				when  "0101" => B<=m(5);
				when  "0110" => B<=m(6);
				when  "0111" => B<=m(7);
				when  "1000" => B<=m(8);
				when  "1001" => B<=m(9);
				when  "1010" => B<=m(10);
				when  "1011" => B<=m(11);
				when  "1100" => B<=m(12);
				when others => B<="0000";  
			end case;
		end if;	
		end if;	
			end process;
end RAAM;
				
	   
	