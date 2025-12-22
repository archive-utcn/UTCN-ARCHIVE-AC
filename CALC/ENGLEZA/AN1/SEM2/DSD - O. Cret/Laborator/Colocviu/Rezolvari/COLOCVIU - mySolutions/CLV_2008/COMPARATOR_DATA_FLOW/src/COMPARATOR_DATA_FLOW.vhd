library ieee;
use ieee.std_logic_1164.all;

entity COMPARATOR_COMPORTAMENTAL is
	port(a,b: in std_logic_vector(1 downto 0);
	f1,f2,f3: out std_logic);
end COMPARATOR_COMPORTAMENTAL;

architecture arh of COMPARATOR_COMPORTAMENTAL is
begin
		f1<= ( b(1) and (not(a(1))) ) or ( (a(1) xnor b(1)) and ( b(0) and (not(a(0))))); -- a < b
		f2<= (a(1) xnor b(1)) and (a(0) xnor b(0)); --  a = b
		f3<= ( a(1) and (not(b(1))) ) or ( (a(1) xnor b(1)) and ( a(0) and (not(b(0))))); -- a > b
end architecture arh;
