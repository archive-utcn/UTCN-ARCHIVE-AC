library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is
	port( set,reset,j,k: in std_logic;
	q,nq: out std_logic);
end jk_ff;

architecture arh of jk_ff is
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
		if(reset='1') then
			q<='0';nq<='1';
		else
			
			if set='1' then
				q<='1'; nq<='0';
				
			else
				if clock'event and clock='1' then
					if j='0' then
						if k='0' then null;
						else q<='0'; nq<='1';
						end if;
					else 
						if  k='0' then q<='1'; nq<='0';
						else
							q<= not q'driving_value;
						nq<= not nq'driving_value;
						end if;
					end if;
				end if;
				end if;	
				end if;
				end process;
				end architecture arh;
	