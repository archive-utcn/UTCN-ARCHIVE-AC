LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity COMP_MIC IS 
	PORT (A,B:in std_logic_vector(15 downto 0); 
	BUT: in std_Logic;  
	C:OUT STD_LOGIC); 
end COMP_MIC; 

architecture X of COMP_MIC is
BEGIN 
	PROCESS(BUT,A,B)
		variable X,Y:INTEGER;
		BEGIN 
			if BUT='1' then 
				X:=CONV_INTEGER(A);
				Y:=CONV_INTEGER(B);
				if(X<=Y) then
					C<='1';
				else
					C<='0';
				end if;
				else C<='-';
				end if;
			end process;
end X;

