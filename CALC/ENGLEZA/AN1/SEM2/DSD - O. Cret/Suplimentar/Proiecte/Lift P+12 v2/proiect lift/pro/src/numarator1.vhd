library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity NUMARATOR1 is
	port(
		RESET:in STD_LOgic;
	CLK: in STD_LOGIC;
	UP: out STD_LOGIC;
	OUT_NUM: out STD_LOGIC_VECTOR(3 downto 0));
end NUMARATOR1;

architecture NUM of NUMARATOR1 is
begin
	
	process(RESET,CLK) 
	variable V: STD_LOGIC_VECTOR(3 downto 0);	  
	variable SENS: STD_LOGIC:='1';
	begin 	
	
			 	
		   if V="0000" then UP<='1';SENS:='1'; end if;	         
		if V="1100" then UP<='0'; SENS:='0'; end if;  
	if RESET='1' then V:="0000"; 
	else 
	 						   
		if CLK'EVENT and CLK='1' then	
			 
			
			if SENS='1' then 
				V:=V+"0001";
			end if;
			if SENS='0' then
				V:=V-"0001";	
				end if;
			end if;	  
		end if;
		OUT_NUM<=V;
			end process;
end NUM;
	
					
	
	