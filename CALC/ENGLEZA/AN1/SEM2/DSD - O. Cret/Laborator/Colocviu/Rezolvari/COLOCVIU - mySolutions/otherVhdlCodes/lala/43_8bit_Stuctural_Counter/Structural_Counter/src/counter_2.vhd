library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_2 is
	port(clk, rst: in bit;
	carry: out bit;
	q: out std_logic_vector(1 downto 0));
end counter_2;

architecture a of counter_2 is
begin
	process(clk, rst)
	variable intQ: std_logic_vector(1 downto 0):="00";
	begin
		if rst='1' then
			intQ:="00";
		else
			if (clk'event and clk='1') then
				intQ:=intQ+1;
				if intQ="00" then
					carry<='1';
				else
					carry<='0';
				end if;
			end if;
		end if;
		q<=intQ;
	end process;
end a;