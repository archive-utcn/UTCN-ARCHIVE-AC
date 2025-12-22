library ieee;
use ieee.std_logic_1164.all;

entity poarta_sau is
	port(a, b: in bit;
	c: out bit);
end entity;

architecture arh_poarta_sau of poarta_sau is
begin
    process(a, b)
	begin
		if a='1' or b='1' then c<='1';
			else c<='0';
		end if;
	end process;
end architecture;