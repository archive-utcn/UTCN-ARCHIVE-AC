library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity COMPARATOR_DATA_FLOW is
	port(a,b: in std_logic_vector(1 downto 0);
	f1,f2,f3: out std_logic);
end COMPARATOR_DATA_FLOW;

architecture arh of COMPARATOR_DATA_FLOW is
begin	
	process(a,b)
	begin
		f1 <= '0' ;
		f2 <= '0' ;
		f3 <= '0' ;
			if conv_integer(a) < conv_integer(b) then f1<='1';
				elsif conv_integer(a) = conv_integer(b) then f2<='1';
					else f3<='1';
			end if;
	end process;
end architecture arh;	 