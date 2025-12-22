library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity m_abs is
	port(
		 In1 : in STD_LOGIC_VECTOR(30 downto 0);
		 Out1 : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end m_abs;


architecture beh of m_abs is
begin

process	(In1)
begin
		Out1 <= ABS(SIGNED(In1(30 downto 23)));
end process;

end beh;
