library ieee;
use ieee.std_logic_1164.all;

entity exclusiv_structural is
	port(a, b: in BIT;
	c: out BIT);
end entity;

architecture arh_exclusiv of exclusiv_structural is
component nu_comportamental port(a: in BIT;
	b: out BIT);
end component;
component poarta_si port(a, b: in BIT;
	c: out BIT);
end component;
component poarta_sau port(a, b: in BIT;
	c: out BIT);	  
end component;
signal N1, N2, S1, S2: BIT;
begin
	C1:nu_comportamental port map(a, N1);
	C2:nu_comportamental port map(b, N2);
	C3:poarta_si port map(N1, b, S1);
	C4:poarta_si port map(a, N2, S2);
	C5:poarta_sau port map(S1, S2, c);
end architecture;
