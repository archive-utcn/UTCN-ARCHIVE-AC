library ieee;
use ieee.std_logic_1164.all;

entity buf is
	port(x: in std_logic_vector(7 downto 0);
	t: in std_logic;
	y: out std_logic_vector(7 downto 0));
end buf;

architecture a of buf is
begin
	process(x, t)
	begin
		if t='1' then y<=x;
		else y<="ZZZZZZZZ";
		end if;
	end process;
end a;	