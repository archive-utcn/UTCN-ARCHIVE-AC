library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux is
	generic(number: integer:=3);
	port(SEL: in std_logic_vector((number-1) downto 0);
	I: in std_logic_vector((2**number-1) downto 0);
	O: out std_logic);
end mux;

architecture A of mux is
begin
	process(SEL, I)
	begin
		O <= I(conv_integer(SEL));
	end process;
end A;
