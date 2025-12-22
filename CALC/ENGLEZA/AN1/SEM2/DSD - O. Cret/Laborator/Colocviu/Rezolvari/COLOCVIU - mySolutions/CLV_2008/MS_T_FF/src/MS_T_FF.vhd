library ieee;
use ieee.std_logic_1164.all;

entity T_FF is
	port(t,set,reset: in std_logic;
	q,nq: out std_logic);
end T_FF;

architecture arh of T_FF is
signal clock: std_logic :='1';
begin
	
	tact: process  
	begin
		clock<='0';
		wait for 20 ns;
		clock<='1';
		wait for 20 ns;
	end process;
	
	t_ff: process(clock, t,set,reset)
	begin
		if (reset = '1')
			then q<='0'; nq<='1';
		elsif (set = '1') then
			q<='1';nq<='0';
		elsif clock'event and clock='1' then 
			if (t='1') then
				q<=not q'driving_value; nq<= not nq'driving_value;
			end if;
		end if;
	end process;
end architecture arh;

--MS

library ieee;
use ieee.std_logic_1164.all;

entity ms_T_FF is
end ms_T_FF;

architecture arh of ms_T_FF is 

 component T_FF is
	port(t,set,reset: in std_logic;
	q,nq: out std_logic);
end component T_FF;

signal t,set,reset: std_logic;
signal q,nq: std_logic;

begin
	UST: T_FF port map(t=>t,set=>set,reset=>reset,q=>q,nq=>nq);
	STIMULI: process 									   
	begin
		set<='0','1' after 20 ns, '0' after 40 ns;
		reset<='1','0' after 20 ns,'1' after 40 ns, '0' after 60 ns;
		t<='0','1' after 60 ns,'0' after 80 ns, '1' after 100 ns;
		wait;
	end process;
end architecture arh;