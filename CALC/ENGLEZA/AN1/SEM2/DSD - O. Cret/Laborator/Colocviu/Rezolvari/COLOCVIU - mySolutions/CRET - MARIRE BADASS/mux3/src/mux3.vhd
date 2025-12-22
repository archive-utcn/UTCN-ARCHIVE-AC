library ieee;
use ieee.std_logic_1164.all;

entity mmux3 is
	port(a,b,c,d: in std_logic_Vector(3 downto 0);
	sel: in std_logic_Vector(1 downto 0);
	y: out std_logic_Vector(3 downto 0));
end mmux3;

architecture arh of mmux3 is
begin
	process(sel)
	begin
		case sel is
			when "00" => y<=a;
			when "01" => y<=b;
			when "10" => y<=c;
			when "11" => y<=d;
			when others => null;
		end case;
	end process;
end architecture arh;