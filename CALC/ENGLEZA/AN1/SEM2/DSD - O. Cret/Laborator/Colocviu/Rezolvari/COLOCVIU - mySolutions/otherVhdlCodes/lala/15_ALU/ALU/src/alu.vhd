library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port(a, b: in std_logic;
	sel: in bit_vector(2 downto 0);
	c, d: out std_logic);
end alu;

architecture a of alu is
begin
	process(sel, a, b)
	begin
		case sel is
		when "000" => c<=a and b; d<=a xor b;
		when "001" => c<=(not a) and b; d<=a xor b;
		when "010" => c<='0'; d<=a and b;
		when "011" =>
		if b='0' then
			c<='U'; d<='U';
		else
			c<='0';
			d<=a;
		end if;
		when "100"=> c<='-'; d<=a and b;
		when "101"=> c<=not a; d<=not b;
		when "110"=> c<='-'; d<=a or b;
		when others => c<='-'; d<=a xor b;
		end case;
	end process;
end a;	