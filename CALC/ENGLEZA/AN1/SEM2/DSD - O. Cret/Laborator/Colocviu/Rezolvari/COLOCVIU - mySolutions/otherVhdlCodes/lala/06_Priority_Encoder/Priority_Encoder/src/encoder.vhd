library ieee;
use ieee.std_logic_1164.all;

entity ENCODER is
	port(X: in std_logic_vector(0 to 9);
	B: out bit_vector(3 downto 0));
end ENCODER;

architecture A of ENCODER is
begin
	process(X)
	begin														
		if X(9)='1' then B<="1001";
		elsif X(8)='1' then B<="1000";
		elsif X(7)='1' then B<="0111";
		elsif X(6)='1' then B<="0110";
		elsif X(5)='1' then B<="0101";
		elsif X(4)='1' then B<="0100";
		elsif X(3)='1' then B<="0011";
		elsif X(2)='1' then B<="0010";
		elsif X(1)='1' then B<="0001";
		else B<="0000";
		end if;
	end process;
end A;
		