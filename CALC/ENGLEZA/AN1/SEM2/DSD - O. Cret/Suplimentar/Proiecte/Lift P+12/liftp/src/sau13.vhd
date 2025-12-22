library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sau13 is
	port(a:in std_logic_vector(12 downto 0);
	b:out std_logic);
end sau13;

architecture arh of sau13 is
begin
	process(a)
	begin
		b<='0';
		for j in 0 to 12 loop
			if(a(j)='1') then b<='1';
		end if;
		end loop;
		end process;
end arh;
