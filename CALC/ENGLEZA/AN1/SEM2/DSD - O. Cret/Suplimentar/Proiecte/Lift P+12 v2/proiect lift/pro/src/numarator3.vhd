library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity numarator3 is 
	port(CLOCK: in STD_LOGIC;
	RESET: in STD_LOGIC;
	UP: in STD_LOGIC;
	UI :in STD_LOGIC;
	O: out STD_LOGIC_VECTOR(3 downto 0);
	CD,CU: out STD_LOGIC);
end numarator3;

architecture num3 of numarator3 is 
begin 
	process(CLOCK,RESET,UP,UI) 
	variable V: STD_LOGIC_VECTOR(3 downto 0);
	begin    
		if RESET='1' then V:="0000";
		else
		if UI='1' then
			if CLOCK'EVENT and CLOCK='1' then 
				if UP='1' then 
					if V<"1001" then V:=V+"0001"; 
						
					                       
					else V:="0000";
						CU<='1','0' after 1 ns;
						end if;
			    else 
					if V>"0000" then V:=V-"0001";
					
					else V:="1001";
					CD<='1','0' after 1 ns;
					end if;
		end if;
		end if;
			   end if;
				end if;
			   O<=V;
				end process;
end num3;