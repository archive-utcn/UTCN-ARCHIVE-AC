
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity mult is
	port(
		 Sin_wav1 : in STD_LOGIC_VECTOR(15 downto 0);
		 Sin_wav2 : in STD_LOGIC_VECTOR(15 downto 0);
		 Out1 : out STD_LOGIC_VECTOR(30 downto 0)
	     );
end mult;

architecture beh of mult is
begin
		Out1 <= CONV_STD_LOGIC_VECTOR ( SIGNED (Sin_wav1) * SIGNED (Sin_wav2), 31);
end beh;
