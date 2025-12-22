 library ieee;
 use ieee.std_logic_1164.all;
 
 entity dmux is
	 port(x: in std_logic_vector(2 downto 0);
	 sel: in std_logic_vector(1 downto 0);
	 y1,y2,y3,y4: out std_logic_vector(2 downto 0));
end dmux;

architecture arh of dmux is
begin
	process(sel)
	begin
		case sel is 
			
			when "00" => y1<=x; y2<="000"; y3<="000";y4<="000";
			when "01" => y1<="000"; y2<=x; y3<="000";y4<="000";
			when "10" => y1<="000"; y2<="000"; y3<=x;y4<="000";
			when "11" => y1<="000"; y2<="000"; y3<="000"; y4<=x;
			when others => null;
		end case;
	end process;
end architecture arh;
