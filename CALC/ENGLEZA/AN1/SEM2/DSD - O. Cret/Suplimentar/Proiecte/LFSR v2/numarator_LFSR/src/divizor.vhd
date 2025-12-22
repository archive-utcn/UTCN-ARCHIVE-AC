library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity divizor_de_frecventa is 
	port ( CLK_IN : in STD_LOGIC;
	      CLK_OUT : out STD_LOGIC);
end divizor_de_frecventa;

architecture divizor of divizor_de_frecventa is 
begin
	process (CLK_IN)
	variable var_CLK : STD_LOGIC_VECTOR(0 to 26) := (others => '0');
	begin
		if (CLK_IN'event and CLK_IN = '1') then 
			var_CLK := var_CLK + 1;
		end if;	
	
	CLK_OUT <= var_CLK(0);
	end process;
	
end divizor;