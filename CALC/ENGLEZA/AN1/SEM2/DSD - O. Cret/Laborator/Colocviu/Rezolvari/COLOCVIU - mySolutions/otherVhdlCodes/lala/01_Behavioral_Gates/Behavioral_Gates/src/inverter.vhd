library ieee;
use ieee.std_logic_1164.all;

entity INVERTER is
	port(x: in bit;
	y: out bit);
end INVERTER;

architecture A of INVERTER is
begin
	process(x)
	begin
		if(x='0') then y<='1';
		else y<='0';
		end if;
	end process;
end A;
