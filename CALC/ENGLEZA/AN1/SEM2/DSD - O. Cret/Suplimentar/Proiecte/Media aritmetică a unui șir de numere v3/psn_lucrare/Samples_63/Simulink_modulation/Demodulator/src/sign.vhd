library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sign is
	port(
		 In1 : in STD_LOGIC_VECTOR(30 downto 0);
		 Out1 : out STD_LOGIC_VECTOR (7 downto 0)
	     );
end sign;

architecture beh of sign is
begin

process (In1)
begin
		if (In1(30) = '1') then
			Out1 <= "11111111";
		else
			Out1 <="00000001";
		end if;
end process;

end beh;
