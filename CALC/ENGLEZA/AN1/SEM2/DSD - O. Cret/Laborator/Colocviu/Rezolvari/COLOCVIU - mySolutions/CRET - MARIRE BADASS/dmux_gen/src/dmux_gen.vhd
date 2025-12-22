library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity dmux is
	generic ( nr: integer := 3);
	port(x: in std_logic;
	sel: in std_logic_vector( nr-1 downto 0);
	y: out std_logic_vector( 2**nr-1 downto 0));
end dmux;

architecture arh of dmux is
begin
	generate_output: for i in 0 to 2**nr-1 generate
	y(i)<=x when conv_integer(sel)=i else '0';
	end generate;
end architecture arh;
	
	