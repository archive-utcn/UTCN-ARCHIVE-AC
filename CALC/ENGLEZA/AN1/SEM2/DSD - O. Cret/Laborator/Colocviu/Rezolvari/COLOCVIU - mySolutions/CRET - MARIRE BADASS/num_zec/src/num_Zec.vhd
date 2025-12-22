library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity num_zec is
	port(clock,reset,load: in std_logic;
	data: in std_logic_vector(3 downto 0);
	q: out std_logic_vector(3 downto 0));
end num_zec;

architecture arh of num_zec is
begin
	process(load,clock,reset)
	variable intQ: std_logic_vector(3 downto 0):=(others=>'0');
	begin
		if clock'event and clock='1' then
			if reset='1' then intQ:="0000";
			else if load='1' then intQ:=data;
			else if(intQ < "1001") then
				intQ:=intQ+"0001"; 
				else intQ:="0000";
			end if;
			end if;
			end if;
		end if;	
		q<=intQ;
	end process;
	end architecture arh;