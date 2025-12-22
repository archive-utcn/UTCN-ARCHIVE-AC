library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Count_2bit is
	port(CLK: in bit;
	Q:inout std_logic_vector(1 downto 0):="00";
	over: out bit:='0');
end entity;

architecture ARH_Count of Count_2bit is
begin
	process(CLK)
	begin 
	if(CLK'event and CLK='1') then
	if(Q="11") then
		Q<=Q+"01";
		over<='1';	
	else
		Q<=Q+"01";
		over<='0';
	end if;						  
	end if;
	end process;
end architecture ARH_Count;
