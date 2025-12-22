library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ram is
	port(a_ram : in std_logic_vector(3 downto 0);
	cs, we: in std_logic;
	d_data: in std_logic_vector(3 downto 0);
	d_ram: out std_logic_vector(3 downto 0));
end ram;

architecture arh of ram is
type matrix is array (0 to 15) of std_logic_vector(3 downto 0);
begin
	process(a_ram,cs,we)
	variable m: matrix:= ("0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110","1111");
	begin
		if( cs='0')
			then null;
		else
			if(we='1') then
				m(conv_integer(a_ram)):=d_Data;
			else
				d_ram<=	m(conv_integer(a_ram));
			end if;
		end if;
		end process;
		end architecture arh;
		
		
			
			
