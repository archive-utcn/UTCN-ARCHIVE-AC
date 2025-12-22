-- 20. Bistabil T sincron, cu intrãri asincrone si cu proces pt. tact – descriere comportamentalã

library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity bist_T is
	port (
			T, R, S:  in STD_LOGIC;
			      Q: out STD_LOGIC
		  );
end entity;

-- Arhitectura:
architecture comportamental of bist_T is
signal clk: STD_LOGIC := '1';
signal M: STD_LOGIC;
begin
	tact: process
	begin
		clk <= not clk;
		wait for 10 ns;
	end process;
	
	bist: process (M, T, R, S, clk)
	begin
		if (R = '1') then 
			M <= '0'; 
	    elsif (S = '1') then
			M <= '1';
		elsif clk'event and  clk = '1' then	
			if (T = '1') then
				M <= not (M);
			end if;						
		end if;
		Q <= M;
	end process;

end architecture;
		