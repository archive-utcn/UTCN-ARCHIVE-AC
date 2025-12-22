library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;

entity counter is
	generic(n: natural:=5);
	port(rst, clk: in std_logic;
	q: out std_logic_vector((natural(ceil(log2(real(n)))))-1 downto 0));
end counter;

architecture a of counter is
begin
	process(rst, clk)
	variable intQ: std_logic_vector((natural(ceil(log2(real(n)))))-1 downto 0);
	begin
		if rst='1' then intQ:=(others=>'0');
		elsif (clk'event and clk='1') then
			if intQ=n-1 then intQ:=(others=>'0');
			else intQ:=intQ+1;
			end if;
		end if;
		Q<=intQ;
	end process;
end a;