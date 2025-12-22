library ieee;	 
use ieee.std_logic_1164.all;

entity mux_2la1_n is
	generic ( n: integer:= 3) ;
	port ( i0, i1: in bit_vector ( 1 to n);	 
	sel: in bit;
	y: out bit_vector (1 to n));
end entity mux_2la1_n;

architecture arh of mux_2la1_n is
begin
	process ( i0,i1,sel)
	begin
		if (sel ='0') then
			y <= i0;
		else 
			y <= i1;
		end if;
	end process;
	end arh;