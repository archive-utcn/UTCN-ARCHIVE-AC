library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity t_ff is
	port (T, R, S:  in bit;
			Q, nQ: out bit);
end entity;

architecture a of t_ff is
signal clk: bit := '0';
signal aux: bit;
begin
	clock: process
	begin
		clk <= not clk;
		wait for 10 ns;
	end process;
	
	ff: process (R, S, clk)
	begin
		if (R = '1') then 
			aux <= '0'; 
	    elsif (S = '1') then
			aux <= '1';
		elsif clk'event and  clk = '1' then	
			if (T = '1') then
				aux <= not (aux);
			end if;						
		end if;
		Q <= aux;
		nQ<= not aux;
	end process;

end architecture;
		