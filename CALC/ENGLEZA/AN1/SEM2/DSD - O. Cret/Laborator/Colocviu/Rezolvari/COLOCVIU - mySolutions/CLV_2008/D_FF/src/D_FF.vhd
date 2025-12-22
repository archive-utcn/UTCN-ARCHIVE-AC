library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
	port(d,set,reset: in std_logic;
	q,nq: out std_logic);
end D_FF;

architecture arh of D_FF is	
signal clock: std_logic :='1';
begin  
	
	tact: process
			begin
			clock<='0';
			wait for 100 ns;
			clock<='1';
			wait for 200 ns;
	end process; 

	d_ff: process(clock,set,reset)
			begin
			if(reset='1')
				then q<='0'; nq<='1';
			elsif (set = '1') 
				then q<='1'; nq<='0';
			elsif clock'event and clock='1' 
				then q<=d; nq<= not d;
			end if;
	end process;

end architecture arh;
		
			
			



