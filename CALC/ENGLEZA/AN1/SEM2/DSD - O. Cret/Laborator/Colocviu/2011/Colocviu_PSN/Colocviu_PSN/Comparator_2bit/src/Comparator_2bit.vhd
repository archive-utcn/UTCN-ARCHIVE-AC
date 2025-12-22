entity Comparator_2bit is
	port( A,B: in bit_vector(1 downto 0);
	Q: out bit);
end entity;

architecture ARH_STR of Comparator_2bit is
component COMP_1 is
	port(A: in bit;
	B: in bit;
	q: OUT bit);
end component COMP_1; 

signal A1,B1: bit;
begin
P1: COMP_1 port map (A(0),B(0),A1);
P2: COMP_1 port map (A(1),B(1),B1);
P3: Q<=A1 and B1;
end architecture;
