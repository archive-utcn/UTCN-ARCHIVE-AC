library ieee;
use ieee.std_logic_1164.all;   
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter is
		port ( clock, reset: in std_logic;
	q: out std_logic_vector (3 downto 0));
end counter;

architecture arh of counter is	
begin
	process (clock, reset)
	variable intQ: std_logic_vector (n-1 downto 0) := (others => '0'); 
	begin
		if (reset = '1') then
			intQ := intQ - intQ;
		else
			if clock'event and clock='1'
			then
			intQ := intQ + 1;
		end if;
		q <= intQ; 			   
		end if;
	end process;
end arh;