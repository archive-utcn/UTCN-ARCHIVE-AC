library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reclama is
	generic(n: natural:= 7);
	port(enT, enR: in bit;
	x: in std_logic_vector(n downto 0));
end reclama;

architecture a of reclama is
begin
	process
	variable aux: integer;
	begin
		aux:=conv_integer(x);
		assert enT='0' report "Test_PSN" severity note;
		assert enR='0' report "Rezultat_PSN" severity note;
		wait for aux*2 ns;
	end process;
end a;
	