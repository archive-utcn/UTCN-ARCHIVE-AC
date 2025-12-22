library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MEMORIE_ROM_16X4 is
	port( A_ROM: in std_logic_vector(3 downto 0);
	CS: in std_logic;
	D_ROM : out std_logic_vector(3 downto 0));
end MEMORIE_ROM_16X4;

architecture arh of MEMORIE_ROM_16X4 is
type MATRIX is array (0 to 15) of std_logic_vector(3 downto 0);
begin
	process (A_ROM,CS)
	variable M: MATRIX:=("0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110","1111");
	begin
		if CS='0' then null;
		else
			D_ROM<=M(conv_integer(A_ROM));
		end if;
	end process;
end architecture arh;