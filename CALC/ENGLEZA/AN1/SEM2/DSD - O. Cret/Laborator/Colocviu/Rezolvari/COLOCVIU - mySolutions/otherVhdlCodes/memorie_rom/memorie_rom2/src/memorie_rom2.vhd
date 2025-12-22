library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Memorie_ROM is
	port(A_ROM: in std_logic_vector(3 downto 0);
	CS_ROM: in BIT;
	D_ROM: out BIT_VECTOR(7 downto 0));
end Memorie_ROM;

architecture ArhROM of Memorie_ROM is 
type MATRIX is array (0 to 15) of BIT_VECTOR(7 downto 0); 
begin
   process (A_ROM, CS_ROM)
variable M : MATRIX :=("00000000","00000001","00000010","00000011","00000100","00000101","00000110","00000111","00001000","00001001","00001010","00001011","00001100","00001101","00001110","00001111");
begin	 
	if CS_ROM='0' then D_ROM<="11111111";
	else
		D_ROM<=M(to_integer(unsigned(A_ROM)));
	end if;
	end process;
end;