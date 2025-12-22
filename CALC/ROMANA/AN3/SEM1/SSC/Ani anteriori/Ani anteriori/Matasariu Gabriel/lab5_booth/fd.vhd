library ieee;
use ieee.std_logic_1164.all;

entity fd is 
	port(
	Clk: in std_logic;
	D:	in std_logic;
	Rst: in std_logic;
	CE: in std_logic;
	Q: out std_logic
	);
end fd;				
architecture fd of fd is
begin  
	process(Clk)
	begin
		if rising_edge(Clk) then
			if Rst = '1' then 
				Q <= '0';
			elsif CE = '1' then 
				Q <= D;
			end if;
		end if;
	end process;
end fd;