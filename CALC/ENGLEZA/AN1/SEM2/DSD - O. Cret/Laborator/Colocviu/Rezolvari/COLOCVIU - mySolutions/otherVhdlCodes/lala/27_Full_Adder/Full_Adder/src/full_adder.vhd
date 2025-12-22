library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(a, b, cin: in bit;
	cout, s: out bit);
end full_adder;

architecture a of full_adder is
begin
	process(a, b, cin)
	begin
		cout <= (b and cin) or (a and b) or (a and cin);
		s<= a xor b xor cin;
	end process;
end a;