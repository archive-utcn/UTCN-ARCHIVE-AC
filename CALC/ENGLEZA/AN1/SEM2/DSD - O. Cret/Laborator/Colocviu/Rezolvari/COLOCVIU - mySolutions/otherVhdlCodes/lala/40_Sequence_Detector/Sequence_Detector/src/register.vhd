library ieee;
use ieee.std_logic_1164.all;

entity r is
	port(clk, rst, din: in std_logic;
	q: out std_logic_vector(3 downto 0));
end r;

architecture a of r is
begin
	process(clk, rst)
	variable intQ: std_logic_vector(3 downto 0) := "0000";
	begin
		if rst='1' then
			intQ:="0000";
		else
			if (clk'event and clk='1') then
				for i in 0 to 2 loop
					intQ(i):=intQ(i+1);
				end loop;
				intQ(3):=din;
			end if;
		end if;
		q<=intQ;
	end process;
end a;	