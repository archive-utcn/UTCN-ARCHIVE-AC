library ieee;
use ieee.std_logic_1164.all;

entity JK_FF is
	port(j,k,set,reset: in std_logic;
	q,nq: out std_logic);
end JK_FF;

architecture arh of JK_FF is
signal clock: std_logic:='1';
begin
	
	tact: process
	begin
		clock<='0';
		wait for 100 ns;
		clock<='1';
		wait for 100 ns;
	end process;
	
	jk_ff: process(j,k,clock,set,reset)
	begin
		if (reset='1')
			then q<='0';nq<='1';
		elsif (set='1') then
			q<='1'; nq<='0';
		elsif clock'event and clock='1' then
			if (j='0') then
				if (k='0') then null;
				else q<='0'; nq<='1'; 
				end if;
			else
				if (k='0') then q<='1';nq<='0';
				else q<=not q'driving_value; nq<= not nq'driving_value;
				end if;
			end if;
		end if;
		end process;
end architecture arh;
		