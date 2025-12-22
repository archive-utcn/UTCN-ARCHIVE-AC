library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux is
	generic ( nr_sel: integer := 3);
	port(  x: in std_logic_vector ( 2**nr_sel-1 downto 0);
	sel: in std_logic_Vector( nr_sel-1 downto 0);
	y: out std_logic);
end mux;

architecture arh of mux is
begin
	y <= x(conv_integer(sel));
end architecture arh;

