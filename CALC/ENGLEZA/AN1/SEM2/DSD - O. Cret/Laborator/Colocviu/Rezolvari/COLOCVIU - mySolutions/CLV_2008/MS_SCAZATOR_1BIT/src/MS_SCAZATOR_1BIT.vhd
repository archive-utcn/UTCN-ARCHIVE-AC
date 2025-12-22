library ieee;
use ieee.std_logic_1164.all;

entity SCAZATOR_1BIT is
	port(i,a,b: in std_logic;
	br,d: out std_logic);
end SCAZATOR_1BIT;

architecture arh of SCAZATOR_1BIT is
begin
	br<=((not a) and b) or ((not a) and i) or ( b and i);
	d<= a xor b xor i;
end architecture arh;

--MS

library ieee;
use ieee.std_logic_1164.all;

entity MS_SCAZATOR_1BIT is
end MS_SCAZATOR_1BIT;

architecture arh of MS_SCAZATOR_1BIT is

component SCAZATOR_1BIT is
	port(i,a,b: in std_logic;
	br,d: out std_logic);
end component SCAZATOR_1BIT;

signal i,a,b: std_logic;
signal br,d: std_logic;

begin
	UST: SCAZATOR_1BIT port map(i=>i,a=>a,b=>b,br=>br,d=>d);
	STIMULI: process
	begin  
		a<='0','1' after 80 ns;
		b<='0','1' after 40 ns,'0' after 80 ns,'1' after 120 ns;
		i<='0','1' after 20 ns,'0' after 40 ns,'1' after 60 ns,'0' after 80 ns,'1' after 100 ns,'0' after 120 ns, '1' after 140 ns;
		wait;
	end process;
end architecture arh;