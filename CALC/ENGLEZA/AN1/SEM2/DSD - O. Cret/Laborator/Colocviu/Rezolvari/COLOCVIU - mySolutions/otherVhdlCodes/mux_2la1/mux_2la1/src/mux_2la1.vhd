library ieee;
use ieee.std_logic_1164.all;

entity mux_2la1 is
	port (i0,i1,sel : in bit;
	y: out bit);
end mux_2la1;

architecture arh of mux_2la1 is
begin
	process ( i0,i1 ,sel)
	begin
		if (sel = '0') then
			y <= i0;
		else
			y <= i1;
		end if;
	end process;
end arh;

