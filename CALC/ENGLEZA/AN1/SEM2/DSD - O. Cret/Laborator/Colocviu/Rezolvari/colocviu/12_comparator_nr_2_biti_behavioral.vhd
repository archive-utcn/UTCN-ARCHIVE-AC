library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comparator_behavioral is
	port(a, b: in std_logic_vector(1 downto 0);
	mare, mic, egal: out std_logic);
end entity;

architecture arh_comp_behavioral of comparator_behavioral is
begin
	process(a, b)
	begin
		mare <= '0';
		mic  <= '0';
		egal <= '0';
		if CONV_INTEGER(a) > CONV_INTEGER(b) then mare <='1';
			elsif CONV_INTEGER(a) < CONV_INTEGER(b) then mic <= '1';
			else egal <= '1';
		end if;		 
	end process;
end architecture;
	