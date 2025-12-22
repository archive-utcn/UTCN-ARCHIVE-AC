library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NUMARATOR_ZECIMAL is
	port( data: in std_logic_vector(3 downto 0);
	clock,reset,load: in std_logic;
	q: out std_logic_vector(3 downto 0));
end NUMARATOR_ZECIMAL;

architecture arh of NUMARATOR_ZECIMAL is
begin
	process(clock,reset,load)
	variable intQ: std_logic_vector(3 downto 0):= (others=>'0'); 
	begin
		if reset='1' then intQ:="0000";
		elsif load='1' then
			intQ:=data;
		elsif clock'event and clock='1' then 
			if intQ<"1001" then
			intQ:=intQ + "0001"; 
		else intQ:="0000";
		end if;
	end if;		 
	q<=intQ;
	end process;
end architecture arh;
	