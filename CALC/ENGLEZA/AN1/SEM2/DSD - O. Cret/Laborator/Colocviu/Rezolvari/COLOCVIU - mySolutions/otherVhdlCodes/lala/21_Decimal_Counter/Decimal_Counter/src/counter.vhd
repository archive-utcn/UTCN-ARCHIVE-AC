library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
	port(rst, pl, clk: in std_logic;
	din: in std_logic_vector(3 downto 0);
	q: out std_logic_vector(3 downto 0));
end counter;

architecture a of counter is
begin
	process(rst, pl, clk)
	variable intQ: std_logic_vector(3 downto 0);
	begin
		if rst='1' then intQ:="0000";
		elsif pl='1' then intQ:=din;
		elsif (clk'event and clk='1') then
			if intQ="1001" then intQ:="0000";
			else intQ:=intQ+1;
			end if;
		end if;
		Q<=intQ;
	end process;
end a;