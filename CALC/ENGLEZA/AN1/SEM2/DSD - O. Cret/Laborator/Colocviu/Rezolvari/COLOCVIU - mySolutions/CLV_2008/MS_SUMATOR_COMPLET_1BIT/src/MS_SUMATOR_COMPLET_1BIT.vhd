library ieee;
use ieee.std_logic_1164.all;

entity SUMATOR_COMPLET_1BIT is 
	port( a,b,cin: in std_logic;
	cout,s: out std_logic);
end SUMATOR_COMPLET_1BIT;

architecture arh of SUMATOR_COMPLET_1BIT is
begin
	cout<= (a and b) or (cin and b) or (cin and a);
	s<=cin xor a xor b;
end architecture arh; 

--MS

library ieee;
use ieee.std_logic_1164.all;

entity ms_SUMATOR_COMPLET_1BIT is
end ms_SUMATOR_COMPLET_1BIT;

architecture arh of ms_SUMATOR_COMPLET_1BIT is

component SUMATOR_COMPLET_1BIT is  
	port( a,b,cin: in std_logic;
	cout,s: out std_logic);
end component SUMATOR_COMPLET_1BIT;

signal a,b,cin: std_logic;
signal cout,s: std_logic;

begin
	UST: SUMATOR_COMPLET_1BIT port map(a=>a,b=>b,cin=>cin,cout=>cout,s=>s);
	STIMULI : process
	begin
		a<='0','1' after 80 ns;
		b<='0','1' after 40 ns, '0' after 80 ns, '1' after 120 ns;
		cin<='0','1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns,'1' after 100 ns,'0' after 120 ns, '1' after 140 ns;
		wait;
	end process STIMULI;
end architecture arh;
	
		
		