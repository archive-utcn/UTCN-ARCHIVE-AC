library ieee;
use ieee.std_logic_1164.all;		
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity reg is
	generic( n: integer:= 3);
	port( clock,reset,load,sin,sl,sr: in std_logic;
	data: in std_logic_vector( n downto 0);
	q: out std_logic_vector( n downto 0));
end reg;

architecture arh of reg is
begin
	process(reset,clock,load,sr,sl)
	variable temp: std_logic_vector( n downto 0):= (others=>'0');
	begin
		if clock'event and clock='1' then
			if reset='1' then temp:=temp-temp;
			elsif 
				 load='1' then
					temp:=data;
				elsif
					sr='1' then temp(n-1 downto 0):=temp(n downto 1);
						temp(n):=sin;
					elsif
						 sl='1' then temp(n downto 1):= temp(n-1 downto 0);
							temp(0):=sin;  
		end if;
		end if;
		q<=temp;
		end process;
		end architecture arh;