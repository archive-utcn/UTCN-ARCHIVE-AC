library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity dmux is
	generic(number: integer:=3);
	port(SEL: in std_logic_vector((number-1) downto 0);
	I: in std_logic;
	O:out std_logic_vector((2**number-1) downto 0));
end dmux;

architecture A of dmux is
begin
	process(SEL, I)
	variable aux: std_logic_vector((2**number-1) downto 0);
	begin
		aux:=(aux'range => '0');
		aux(conv_integer(SEL)):=I;
		O<=aux;
		end process;
end A;
