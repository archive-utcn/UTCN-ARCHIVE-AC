library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity demux1 is 
	port(a,b,c,en:in std_logic;
	d,e:out std_logic);
end demux1;

architecture arh of demux1 is
begin
	process(a,b,c,en)
	begin
		if (en='1') then
		if(b='1' and c='0') then
			d<=a; e<='U';
		elsif(b='0' and c='1') then
			e<=a; d<='U';
		end if;
		elsif(en='0') then
			d<='U';e<='U';
			end if;
		end process;
		end arh;  