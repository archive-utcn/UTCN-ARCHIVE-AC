library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;

entity COMP_INTEGER is
	port(A,B: in integer range 0 to 11;
	BUT:in std_logic;
	C:out std_logic);
end COMP_INTEGER;

architecture A of COMP_INTEGER is
begin
	G:process(BUT,A,B)
	begin
	if BUT='1' then
		if(A=B) then
			C<='1';
		else
			C<='0';
			end if;
		else
			C<='-';
		end if;
	end process;
end A;
	
	