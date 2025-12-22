library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rom is
	port( A_rom: in std_logic_vector(3 downto 0);
	CS: in std_logic;
	D_rom: out std_logic_vector(3 downto 0));
end rom;

architecture arh of rom is
type MATRIX is array ( 0 to 15) of std_logic_Vector(3 downto 0);
begin
	process( A_rom, CS)	
	variable M: MATRIX :=( "0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110","1111");
	begin
	if (cs= '0') then null;
	else
		d_rom<=M(conv_integer(a_rom));
	end if;
	end process;
end architecture arh;
