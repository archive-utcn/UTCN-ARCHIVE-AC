library ieee;
use ieee.std_logic_1164.all;

entity ram is
	port(i: in bit_vector(3 downto 0);
	cs, we: in bit;			-- chip select, write enable
	o: inout bit_vector(15 downto 0));
end ram;

architecture a of ram is
type memorie is array(15 downto 0) of bit_vector(15 downto 0);
signal ram: memorie;

begin
	process(i, cs, we)
	begin
		if cs='0' then
			if we='1' then
				case i is
					when "0000"=>o<=ram(0);
					when "0001"=>o<=ram(1);
					when "0010"=>o<=ram(2);
					when "0011"=>o<=ram(3);
					when "0100"=>o<=ram(4);
					when "0101"=>o<=ram(5);
					when "0110"=>o<=ram(6);
					when "0111"=>o<=ram(7);
					when "1000"=>o<=ram(8);
					when "1001"=>o<=ram(9);
					when "1010"=>o<=ram(10);
					when "1011"=>o<=ram(11);
					when "1100"=>o<=ram(12);
					when "1101"=>o<=ram(13);
					when "1110"=>o<=ram(14);
					when others =>o<=ram(15);
				end case;
			else
				case i is
					when "0000"=>ram(0)<=o;
					when "0001"=>ram(1)<=o;
					when "0010"=>ram(2)<=o;
					when "0011"=>ram(3)<=o;
					when "0100"=>ram(4)<=o;
					when "0101"=>ram(5)<=o;
					when "0110"=>ram(6)<=o;
					when "0111"=>ram(7)<=o;
					when "1000"=>ram(8)<=o;
					when "1001"=>ram(9)<=o;
					when "1010"=>ram(10)<=o;
					when "1011"=>ram(11)<=o;
					when "1100"=>ram(12)<=o;
					when "1101"=>ram(13)<=o;
					when "1110"=>ram(14)<=o;
					when others =>ram(15)<=o;
				end case;
			end if;
		end if;
	end process;
end a;
	