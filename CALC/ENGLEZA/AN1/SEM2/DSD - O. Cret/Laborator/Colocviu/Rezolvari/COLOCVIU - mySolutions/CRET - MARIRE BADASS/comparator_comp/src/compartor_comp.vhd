library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity compp is
	port(a,b : in std_logic_vector( 1 downto 0);
	f1,f2,f3: out std_logic);
end compp;

architecture arh of compp is
begin
	f1<= (not a(1) and b(1)) or ((a(1) xnor b(1)) and ( not (a(0)) and b(0))); -- a < b 
	f2<= ( a(1) xnor b(1)) and ( a(0) xnor b(0)); -- a = b
	f3<= ( a(1) and not(b(1))) or ( (a(1) xnor b(1)) and ( a(0) and not(b(0)))); -- a > b	 
end architecture arh;

