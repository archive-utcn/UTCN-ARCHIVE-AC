library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NUMARATOR_BINAR is
	port( data: in std_logic_vector(3 downto 0);
	clock,reset,load: in std_logic;
	q: out std_logic_vector(3 downto 0));
end NUMARATOR_BINAR;

architecture arh of NUMARATOR_BINAR is
begin
	process(clock,reset,load)
	variable intQ: std_logic_vector(3 downto 0):= (others=>'0'); 
	begin
	if clock'event and clock='1' then
		if reset='1' then intQ:="0000";
		elsif load='1' then
			intQ:=data;
		else
			intQ:=intQ + "0001";
		end if;
	end if;		 
	q<=intQ;
	end process;
end architecture arh;
	