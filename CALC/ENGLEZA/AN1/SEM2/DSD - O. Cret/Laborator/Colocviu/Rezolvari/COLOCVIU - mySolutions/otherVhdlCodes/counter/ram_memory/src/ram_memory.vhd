library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Memorie_RAM is
	port(A_RAM: in std_logic_vector(3 downto 0);
	CS_RAM: in BIT;
	WE : in BIT;
	D_DATA:  in STD_LOGIC_VECTOR(7 downto 0);
	D_RAM: out STD_LOGIC_VECTOR(7 downto 0));
end Memorie_RAM;

architecture ArhRAM of Memorie_RAM is 
type MATRIX is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);  
signal M:MATRIX;
begin
   process (A_RAM, CS_RAM, D_DATA,WE)
   begin 
	   if (CS_RAM = '0') then D_RAM<="11111111";
	   else
		   if WE='1' then
			   M(to_integer(unsigned(A_RAM))) <= D_DATA;
		   else
			   D_RAM <= M(to_integer(unsigned(A_RAM)));
		  	end if;
	end if;
	end process;
end ArhRam;