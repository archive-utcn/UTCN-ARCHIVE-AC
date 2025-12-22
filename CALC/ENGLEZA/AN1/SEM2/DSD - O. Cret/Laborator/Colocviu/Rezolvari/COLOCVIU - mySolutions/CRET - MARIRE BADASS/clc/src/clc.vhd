library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clc is
	port( sel: in std_logic_vector(1 downto 0);
	a: in std_logic_vector(3 downto 0);
	q: out std_logic);
end entity clc;

architecture arh of clc is
begin
	process(sel,a)
	begin
		case sel is
			
			when "00" => 
				if a(0)='0' then q<='1'; 
				else q<='0';
				end if;
				
			when "01"=>
				if a(1)='0' and a(0)='0' then q<='1';
				else q<='0';
				end if;
				
			when "10"=>
				if a(3)='1' and a(2)='0' and a(1)='1' and a(0)='1' then q<='1';
				else q<='0';
				end if;
				
			when "11"=>
				if(conv_integer(a) > 4 ) then q<='1';
				else q<='0';
				end if;
				
			when others=>null;
			end case;
			end process;
			end architecture arh;