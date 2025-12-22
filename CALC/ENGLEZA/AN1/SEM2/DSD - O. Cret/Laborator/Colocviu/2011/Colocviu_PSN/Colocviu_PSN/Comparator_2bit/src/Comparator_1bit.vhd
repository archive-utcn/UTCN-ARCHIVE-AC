--library IEEE;
--use IEEE.std_logic_1164.all;


entity COMP_1 is
	port(A: in bit;
	B: in bit;
	q: OUT bit);
end COMP_1;

architecture ARH_Comportamentala of COMP_1 is
begin  
	process(A,B)
	begin
	if(A=B) then
		q<='1';	
	else
		q<='0';
	end if;
	end process;
end architecture ARH_Comportamentala;

		