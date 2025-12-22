library ieee;
use ieee.std_logic_1164.all;

entity fdn is
	generic(n : integer := 4);
	port(
	D: in std_logic_vector(n-1 downto 0);
	Clk: in std_logic;
	Rst: in std_logic;
	CE: in std_logic;
	Q: out std_logic_vector(n-1 downto 0)
	);
end fdn;

architecture fdn of fdn is
begin			
	process(Clk)
	begin
		if rising_edge(Clk) then
			if Rst = '1' then
				Q <= (others =>'0');
			elsif CE = '1' then
				Q <= D;
			end if;
		end if;
	end process;
end fdn;