library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity d_ff is
	port ( clock, reset, d: in std_logic;
	q,nq : out std_logic);
end d_ff;

architecture arh of d_ff is
begin 
	process (clock, reset)
	begin
		if (reset = '1') then
			q <= '0';
			nq<='1';
		else
			if clock'event and clock='1'
			then q <=d;
			nq<= not d;
			end if;
		end if;
		end process;
	end arh;
	
			
	