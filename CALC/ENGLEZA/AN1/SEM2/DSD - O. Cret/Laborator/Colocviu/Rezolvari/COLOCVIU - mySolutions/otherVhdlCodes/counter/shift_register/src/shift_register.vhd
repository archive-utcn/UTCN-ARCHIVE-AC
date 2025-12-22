library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity shift_register is		 
	generic ( n: integer := 5);
	port ( clock, reset, din :  in std_logic;
	q : out std_logic_vector (n downto 1) );
end shift_register;

architecture arh of shift_register is
begin
	process (clock, reset)
	variable intQ : std_logic_vector (n downto 1);
	begin
		if reset='1' then
			intQ := ( others => '0');
		else
			if (clock'event and clock='1') then
				for i in 1 to n-1 loop	-- shift la dreapta
					intQ(i) := intQ(i+1);  -- shift la dreapta
					--for i in n downto 2 loop -- shift la stanga
					--intQ(i)	:= intQ(i-1);  -- shift la stanga
				end loop;	
			intQ(n) := DIN;	-- shift la dreapta
			--intQ(1) := DIN; 	-- shift la stanga
			end if;
		end if;
	q<= intQ;			   
	end process;
end arh;
		
				