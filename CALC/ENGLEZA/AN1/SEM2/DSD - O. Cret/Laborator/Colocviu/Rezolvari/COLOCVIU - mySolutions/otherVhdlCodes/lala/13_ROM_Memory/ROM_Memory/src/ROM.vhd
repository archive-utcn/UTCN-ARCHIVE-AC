library ieee;
use ieee.std_logic_1164.all;

entity rom is
	port(i: in bit_vector(3 downto 0);
	cs: in bit;			-- chip select
	o: out bit_vector(15 downto 0));
end rom;

architecture a of rom is
type memory is array(15 downto 0) of bit_vector(15 downto 0);
signal r: memory;
begin
	r(0)<="0000000000000000";
	r(1)<="0000000000000000";
	r(2)<="0000000000000000";
	r(3)<="0000000000000000";
	r(4)<="0000000000000000";
	r(5)<="0000000000000000";
	r(6)<="0000000000000000";
	r(7)<="0000000000000000";
	r(8)<="0000000000000000";
	r(9)<="0000000000000000";
	r(10)<="0000000000000000";
	r(11)<="0000000000000000"; 
	r(12)<="0000000000000000";
	r(13)<="0000000000000000";
	r(14)<="0000000000000000";
	r(15)<="0000000000000000";
	process (i, cs)
	begin
		if cs='0' then
			case i is
				when "0000"=> o<=r(0);
				when "0001"=> o<=r(1);
				when "0010"=> o<=r(2);
				when "0011"=> o<=r(3);
				when "0100"=> o<=r(4);
				when "0101"=> o<=r(5);
				when "0110"=> o<=r(6);
				when "0111"=> o<=r(7);
				when "1000"=> o<=r(8);
				when "1001"=> o<=r(9);
				when "1010"=> o<=r(10);
				when "1011"=> o<=r(11);
				when "1100"=> o<=r(12);
				when "1101"=> o<=r(13);
				when "1110"=> o<=r(14);
				when others=> o<=r(15);
			end case;
		end if;
	end process;
end a;
