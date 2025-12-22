library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity input1 is
	port (i, reset: in std_logic_vector (12 downto 0); 
	clk: in std_logic;
	o: out std_logic_vector (12 downto 0));
end input1;

architecture arh of input1 is

begin
	process (i, reset,clk)
	begin
		if (clk='1' and clk'event) then
	for j in 0 to 12 loop
		if reset(j)='1' then o(j)<='U';
		elsif i(j)='1' then o(j)<='1';
		end if;
	end loop;
	end if;
	end process;
end arh;  