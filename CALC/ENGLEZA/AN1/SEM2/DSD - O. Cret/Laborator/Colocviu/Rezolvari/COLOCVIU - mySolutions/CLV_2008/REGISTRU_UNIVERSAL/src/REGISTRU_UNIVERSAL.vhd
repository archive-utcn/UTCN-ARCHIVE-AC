library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity REGISTRU_UNIVERSAL is					 
	generic( n: integer :=3);
	port(clock,sl,sr,load,reset, sin: in std_logic;
	data: in std_logic_vector(n downto 0);
	output: out std_logic_vector( n downto 0));
end REGISTRU_UNIVERSAL;

architecture arh of REGISTRU_UNIVERSAL is
begin
	process(clock,sl,sr,load,reset,sin,data)
	variable temp: std_logic_vector(n downto 0):= (others=>'0');
	begin
		if clock'event and clock='1' then
			
			if(reset='1') then temp:=temp-temp;
		   
			elsif (load='1') then temp:=data;
		   
			elsif (sr='1') then temp(n-1 downto 0):=temp(n downto 1);
			   					temp(n):=sin;
			
			elsif (sl='1') then temp(n downto 1):=temp(n-1 downto 0);
				temp(0):=sin;
			end if;
		end if;	
	output<=temp;
	end process;
end architecture arh;
			   