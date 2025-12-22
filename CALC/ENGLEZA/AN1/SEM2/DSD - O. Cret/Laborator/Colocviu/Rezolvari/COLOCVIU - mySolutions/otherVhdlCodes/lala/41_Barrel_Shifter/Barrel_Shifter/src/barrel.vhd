library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity barrel is
	port(clk, rst: in bit;
	sel, n: in std_logic_vector(1 downto 0);
	load: in bit_vector(15 downto 0);
	q: out bit_vector(15 downto 0));
end barrel;

architecture a of barrel is
signal i: integer;
begin
	i<=conv_integer(n);
	process(clk, rst)
	variable intQ: bit_vector(15 downto 0):=(others=>'0');
	begin
		if rst='1' then
			intQ:=(others=>'0');
		else
			if (clk'event and clk='1') then
				case sel is
					when "01" => intQ:=intQ ror i;
					when "10" => intQ:=intQ rol i;
					when "11" => intQ:=load;
					when others => null;
				end case;
			end if;
		end if;
		Q<=intQ;
	end process;
end a;