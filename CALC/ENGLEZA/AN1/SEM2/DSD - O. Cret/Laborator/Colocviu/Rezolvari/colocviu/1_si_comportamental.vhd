library ieee;
use ieee.std_logic_1164.all;

entity poarta_si is
	port(a, b: in bit;
	c: out bit);
end entity;

architecture arh_poarta_si of poarta_si is
begin
    process(a, b)
	begin
		if a='1' and b='1' then c<='1';
			else c<='0';
		end if;
	end process;
end architecture;
	