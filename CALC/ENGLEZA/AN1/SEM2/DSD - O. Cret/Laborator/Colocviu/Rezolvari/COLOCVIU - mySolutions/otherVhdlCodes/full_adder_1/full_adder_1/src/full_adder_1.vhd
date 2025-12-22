library ieee;
use ieee.std_logic_1164.all;

entity full_adder_1 is
	port ( a, b,cin: in bit;
	cout, s: out bit);
end full_adder_1;

architecture arh of full_adder_1 is

	component half_adder is
		port( a,b : bit;
		cout, s: out bit);
	end component half_adder;
	
	component or_gate is
		port ( a,b: in bit;
		y: out bit);
	end component or_gate;
	
	signal n1,n2,n3: bit;
	
	begin
		L1: half_adder port map(a,b,n1,n2);
		L2:	half_adder port map(n2,cin, n3,s);
		L3: or_gate port map(n1,n3,cout);
		end arh;