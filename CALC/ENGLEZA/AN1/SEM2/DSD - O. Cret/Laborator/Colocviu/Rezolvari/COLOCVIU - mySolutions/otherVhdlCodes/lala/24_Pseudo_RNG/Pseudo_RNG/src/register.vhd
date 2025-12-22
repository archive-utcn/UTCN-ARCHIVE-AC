library ieee;
use ieee.std_logic_1164.all;

entity r is
	port(clk, din, sel: std_logic;
	load: in std_logic_vector(3 downto 0);
	q: inout std_logic_vector(3 downto 0));
end r;

architecture a of r is
begin
	process(clk)
	variable intQ: std_logic_vector(3 downto 0) := (others => '0');
	begin
		if (clk'event and clk='1') then
			if sel='0' then
				intQ:=load;
			else
				for i in 0 to 2 loop
					intQ(i):=intQ(i+1);
				end loop;
				intQ(3):=din;
			end if;
			if intQ="0000" then intQ:="0001";
			end if;
		end if;
		Q<=intQ;
	end process;
end a;	