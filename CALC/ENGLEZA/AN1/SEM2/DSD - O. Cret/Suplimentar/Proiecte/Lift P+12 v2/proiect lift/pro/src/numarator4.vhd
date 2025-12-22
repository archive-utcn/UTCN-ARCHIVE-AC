library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity numarator4 is 
	port( CU,CD,RESET: in STD_LOGIC;
	O: out STD_LOGIC_VECTOR(3 downto 0));
end numarator4;

architecture num4 of numarator4 is
signal Y: STD_LOGIC_VECTOR(3 downto 0);
signal W: STD_LOGIC_VECTOR(3 downto 0);
begin 
	process(CU,RESET)
	variable V: STD_LOGIC_VECTOR(3 downto 0);
	begin
	
	if RESET='1' then V:="0000"; 
	else 
	if CU'EVENT and CU='1' then V:=V+"0001"; end if;
   
	 end if;
	 
		 Y<=V;
end process;
   process(CD,RESET)
	variable E: STD_LOGIC_VECTOR(3 downto 0);
	begin 
	 if RESET='1' then E:="0000";
	    else if CD'EVENT and CD='1' then E:=E-"0001";
		       end if;
		end if;
		 W<=E;
end process;
process(CU,CD,Y,W)
begin
if CU='1' then	  
O<=Y;
else if CD='1' then O<=W;end if;
end if;
end process;


end num4;