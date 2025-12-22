library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity r is
	port(clk, rst, din: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	load: in std_logic_vector(3 downto 0);
	q: out std_logic_vector(3 downto 0));
end r;

architecture a of r is
begin
	process(clk, rst, sel)
	variable intQ: std_logic_vector(3 downto 0);
	begin
		if rst='1' then intQ:="0000";
		else
			if (clk'event and clk='1') then
				case sel is
					when "01" => intQ:=load;
					when "10" =>
					for i in 3 downto 1 loop
						intQ(i):=intQ(i-1);
					end loop;
					intQ(0):=din;
					when "11"=>
					for i in 0 to 2 loop
						intQ(i):=intQ(i+1);
					end loop;
					when others => null;
				end case;
			end if;
		end if;
		Q<=intQ;
	end process;
end a;