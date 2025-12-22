library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;

entity C4UD is
	port(up, down, clk: in std_logic;
	q: out std_logic_vector(3 downto 0));
end C4UD;

architecture arh_C4UD of C4UD is
begin
	process(clk,up,down)
	variable v:std_logic_vector(3 downto 0):="0000";
	begin
		if clk='1' and clk'event then
			if up='1' and down='0' then 
				v:=v+"0001"; 
			elsif down='1' and up='0' then 
				v:=v-"0001";
			
			end if;
		end if;
	q<=v;
	end process;
end	arh_C4UD;
	