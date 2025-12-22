library ieee;
use ieee.std_logic_1164.all;

entity t_ff is
	port( set,reset,t: in std_logic;
	q,nq: out std_logic);
end t_ff;

architecture arh of t_ff is
signal clock: std_logic:='1';
begin
	
	tact: process			 
	begin
		clock<='0';
		wait for 100 ns;
		clock<='1';
		wait for 100 ns;
	end process;
	
	bistabil: process(set,reset,t,clock)
	begin
		if( reset='1') then
			q<='0'; nq<='1';
		elsif set='1' then
			q<='1'; nq<='0';
		else if clock'event and clock='1' then 
			if (t='1') then
				q<= not q'driving_value; nq<=not nq'driving_value;
			end if;
		end if;
		end if;
		end process;
		end architecture arh;