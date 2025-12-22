library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port(clk, rst, sel, din: in bit;
	q: out bit_vector(3 downto 0));
end reg;

architecture a of reg is
begin
	process(clk, rst)
	variable intQ: bit_vector(3 downto 0);
	begin
		if rst='1' then
			intQ:="0000";
		else
			if (clk'event and clk='1') then
				if sel='0' then
					for i in 3 downto 1 loop
						intQ(i):=intQ(i-1);
					end loop;
					intQ(0):=din;
				else
					for i in 0 to 2 loop
						intQ(i):=intQ(i+1);
					end loop;
					intQ(3):=din;
				end if;
			end if;
		end if;
		q<=intQ;
	end process;
end a;
		