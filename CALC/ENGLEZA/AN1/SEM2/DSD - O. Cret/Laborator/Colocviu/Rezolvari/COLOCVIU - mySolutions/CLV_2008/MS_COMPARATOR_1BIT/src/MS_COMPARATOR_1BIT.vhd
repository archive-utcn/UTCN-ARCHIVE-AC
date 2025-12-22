library ieee;
use ieee.std_logic_1164.all;

entity COMPARATOR_1BIT is
	port(a,b: in std_logic;
	f1,f2,f3: out std_logic);
end COMPARATOR_1BIT;

architecture arh of COMPARATOR_1BIT is
begin
	f1<=(not a) and b;
	f2<= a xnor b;
	f3<=a and (not b);
end architecture arh;

--MS

library ieee;
use ieee.std_logic_1164.all;

entity MS_COMPARATOR_1BIT is
end MS_COMPARATOR_1BIT;

architecture arh of MS_COMPARATOR_1BIT is

component COMPARATOR_1BIT is
	port(a,b: in std_logic;
	f1,f2,f3: out std_logic);
end component COMPARATOR_1BIT;

signal a,b: std_logic;
signal f1,f2,f3: std_logic;

begin
	UST: COMPARATOR_1BIT port map(a=>a,b=>b,f1=>f1,f2=>f2,f3=>f3);
	STIMULI: process
	begin
		a<='0', '1' after 50 ns;
		b<='0','1' after 25 ns,'0' after 50 ns,'1' after 75 ns;
		wait;
	end process;
end architecture arh;
