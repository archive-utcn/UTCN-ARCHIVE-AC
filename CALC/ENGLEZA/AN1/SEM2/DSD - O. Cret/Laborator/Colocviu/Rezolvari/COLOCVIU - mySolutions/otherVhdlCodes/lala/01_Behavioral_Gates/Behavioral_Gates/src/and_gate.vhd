library ieee;
use ieee.std_logic_1164.all;

entity AND_gate is
	port(x, y: in bit;
	z: out bit);
end AND_gate;

architecture A of AND_gate is
begin
	process(x, y)
	begin
		if(x='1' and y='1') then z<='1';
		else z<='0';
		end if;
	end process;
end A;
