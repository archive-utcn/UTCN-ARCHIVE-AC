library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;			
use ieee.math_real.all;

entity num is											
	generic ( n: integer := 5);
	port(clock,reset: in std_logic;
	q: out std_logic_vector((natural(ceil(log2(real(n)))))-1 downto 0));
end num;				

architecture arh of num is
begin
	process(clock,reset)
	variable intQ: std_logic_vector((natural(ceil(log2(real(n)))))-1 downto 0):= (others=>'0');
	begin
		if clock'event and clock='1' then
			if reset='1' then intQ:=intQ-intQ;
			else 
				if (conv_integer(intQ)= n-1)	then
					intQ:= (others=>'0');
				else
					intQ:=intQ+1;
				end if;
			end if;
			end if;	
		q<=intQ;
		end process;
		end architecture arh;
				