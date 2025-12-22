library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
	port(d,set,reset: in std_logic;
	q,nq : out std_logic);
end d_ff;

architecture arh of d_ff is	
signal clock: std_logic :='1';
begin
	
	tact: process  
	begin
		clock<='0';
		wait for 100 ns;
		clock<='1';
		wait for 100 ns;
	end process;
	
	bistabil: process(clock,set,reset)
	begin
		if(reset='1') then q<='0'; nq<='1';
		else
			if set='1' then q<='1'; nq<='0';
			else 
				if clock'event and clock='1' then
					q<=d; nq<=not d;
				end if;
			end if;
		end if;	
	end process;
end architecture arh;
		
		
