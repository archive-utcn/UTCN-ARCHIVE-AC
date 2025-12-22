library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DMUX_GENERIC_1_LA_8 is
	generic (nr_sel:  integer:= 3);
	port( x: in std_logic;
	sel: in std_logic_vector(nr_sel-1 downto 0);
	y: out std_logic_vector(2**nr_sel-1 downto 0));
end DMUX_GENERIC_1_LA_8;

architecture arh of DMUX_GENERIC_1_LA_8 is
begin
	generate_output: for i in 0 to 2**nr_sel-1 generate
	y(i) <= x when conv_integer(sel) = i else '0';
	end generate generate_output;
end architecture arh;
	