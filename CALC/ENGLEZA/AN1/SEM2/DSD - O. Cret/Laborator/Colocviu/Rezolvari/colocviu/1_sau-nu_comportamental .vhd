library ieee;
use ieee.std_logic_1164.all;

entity poarta_sau_nu is
	port(a, b: in bit;
	c: out bit);
end entity;

architecture arh_poarta_sau_nu of poarta_sau_nu is
begin
    process(a, b)
	begin
		if a='1' or b='1' then c<='0';
			else c<='1';
		end if;
	end process;
end architecture;