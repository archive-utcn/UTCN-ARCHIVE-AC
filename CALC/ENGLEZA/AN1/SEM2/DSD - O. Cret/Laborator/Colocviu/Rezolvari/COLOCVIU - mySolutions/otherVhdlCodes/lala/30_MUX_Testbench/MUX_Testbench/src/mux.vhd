library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port(i: in bit_vector(3 downto 0);
	sel: in bit_vector(1 downto 0);
	o: out bit);
end mux;

architecture a of mux is
begin
	process(i, sel)
	begin
		case sel is
			when "00"=> o<=i(0);
			when "01"=> o<=i(1);
			when "10"=> o<=i(2);
			when others=> o<=i(3);
		end case;
	end process;
end a;