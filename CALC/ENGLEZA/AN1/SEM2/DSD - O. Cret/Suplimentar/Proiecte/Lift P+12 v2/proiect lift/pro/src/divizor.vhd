library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity NUM is
	port( CLOCK: in STD_LOGIC;	 
	C: out STD_LOGIC);
	
	
end NUM;


architecture NUMARATOR of NUM is

begin 
	process (CLOCK)	
	variable V: STD_LOGIC_VECTOR(25 downto 0):="00000000000000000000000000";	  
	begin
	if CLOCK'EVENT and CLOCK='1' then V:=V+1; 				 
	end if;
	C<=V(25);
   end process;
 end architecture NUMARATOR;
				       