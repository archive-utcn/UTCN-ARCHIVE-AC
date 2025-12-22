library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;

entity C4U is
	port(ce, clk: in std_logic;
	q: out std_logic_vector(3 downto 0));
end C4U;

architecture arh_C4U of C4U is
begin
	process(clk,ce)
	variable v1:std_logic_vector(3 downto 0):="0000";
	begin
		if clk='1' and clk'event and ce='1' then
			v1:=v1+"0001"; 
	
		end if;
	q<=v1;
	end process;  
end architecture arh_C4U;