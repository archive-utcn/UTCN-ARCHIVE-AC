 library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


entity NUMARATOR_2 is
	port( CLOCK,RESET: in STD_LOGIC;
	UP:in STD_LOGIC;
	OUT_NUM: in STD_LOGIC_VECTOR(3 downto 0);
	C: out STD_LOGIC:='0'; 
	OUT_NUM2: out STD_LOGIC_VECTOR(3 downto 0));
end NUMARATOR_2;  

architecture num2 of NUMARATOR_2 is   

begin 
	
	process(CLOCK,RESET,OUT_NUM,UP) 
	variable V: STD_LOGIC_VECTOR(3 downto 0);
	begin
		--if PL='0' then V:=ETAJ; end if;
		--if CLOCK'EVENT and CLOCK='1' then 
       --if V<OUT_NUM then V:=V+"0001";
	   --els-e  C<='1'; 
		  -- end if;
			 
		--end if;  
		if RESET = '1' then V:="0000"; 
		else 
			
			if CLOCK'EVENT and CLOCK='1' then 
				if UP='1' then
				if V<OUT_NUM then V:=V+"0001"; 
				else C<='1'; end if; 	 
				else if V>OUT_NUM then V:=V-"0001";
				else C<='1';
				end if;
				end if;
				end if;
				end if;
		OUT_NUM2<=V;
		end process;
		end	num2;
			