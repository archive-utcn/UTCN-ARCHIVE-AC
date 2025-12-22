Library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity MEMORIE_ROM_16X16 is
	port( A_ROM: in std_logic_vector(3 downto 0);
	CS: in std_logic;
	D_ROM : out std_logic_vector(15 downto 0));
end MEMORIE_ROM_16X16;

architecture arh of MEMORIE_ROM_16x16 is
type MATRIX is array (0 to 15) of std_logic_vector(15 downto 0);
begin
	process (A_ROM,CS)
	variable M: MATRIX:=("0000000000000000","0000000000000001","0000000000000010","0000000000000011","0000000000000100","0000000000000101","0000000000000110","0000000000000111","0000000000001000","0000000000001001","0000000000001010","0000000000001011","0000000000001100","0000000000001101","0000000000001110","0000000000001111");
	begin
		if CS='0' then null;
		else
			D_ROM<=M(conv_integer(A_ROM));
		end if;
	end process;
end architecture arh;
	


