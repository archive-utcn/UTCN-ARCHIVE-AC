library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
	port(x, y, bi: in bit;
	bo, z: out bit);
end full_subtractor;

architecture a of full_subtractor is
begin
	process(x, y, bi)
	begin
		bo <= ( (not x) and bi )	or ( (not x) and y ) or (y and bi);
		z <= x xor y xor bi;
	end process;
end a;