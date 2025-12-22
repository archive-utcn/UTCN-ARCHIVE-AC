library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity mux is
	generic(intrari: natural := 8; selectii: natural :=3);
	port(input: in std_logic_vector(intrari-1 downto 0);
	sel: in std_logic_vector(selectii-1 downto 0);
	output: out std_logic);
end entity;

architecture arh_mux of mux is
begin
	output <= input(CONV_INTEGER(sel));
end architecture;
