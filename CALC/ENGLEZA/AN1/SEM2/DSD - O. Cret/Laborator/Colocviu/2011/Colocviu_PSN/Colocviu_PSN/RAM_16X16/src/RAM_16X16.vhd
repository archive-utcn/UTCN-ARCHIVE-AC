library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity RAM16x16 is
	port (adr: in std_logic_vector(3 downto 0):="0000";
	w: in bit;
	A: in bit_vector(15 downto 0);
	Q: out bit_vector(15 downto 0));
end;

architecture ARH_COMP of RAM16x16 is
type MATRIX is array (0 to 15) of bit_vector(15 downto 0);
signal mem: MATRIX;
begin
	process (adr,w,A)
	begin
		if (w='0') then
			Q <= mem(conv_integer(adr));
		else
			mem(conv_integer(adr)) <= A;
		end if;
	end process;
	
	end;	   
