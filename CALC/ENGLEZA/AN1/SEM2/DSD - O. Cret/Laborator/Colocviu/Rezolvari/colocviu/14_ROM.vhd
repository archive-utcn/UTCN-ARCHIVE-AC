library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rom is
	port(addr: in std_logic_vector(3 downto 0);
	I3, I2, I1, I0: in std_logic_vector(15 downto 0);
	output: out std_logic_vector(3 downto 0));
end entity;

architecture arh_ROM of ROM is
begin
	process(addr)
	begin
		output(3) <= I3(CONV_INTEGER(addr));
		output(2) <= I2(CONV_INTEGER(addr));
		output(1) <= I1(CONV_INTEGER(addr));
		output(0) <= I0(CONV_INTEGER(addr));
	end process;
end architecture;

	