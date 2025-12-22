library ieee;
use ieee.std_logic_1164.all;

entity NOR_gate is
	port(x, y: in bit;
	z: out bit);
end NOR_gate;

architecture A of NOR_gate is
begin
	process(x, y)
	begin
		if(x='1' and y='1') then z<='0';
		else z<='1';
		end if;
	end process;
end A;
