-- 19. Bistabil JK sincron, cu intrãri asincrone si cu proces pt. tact – descriere comportamentalã

library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity bist_JK is
	port (
			J, K, R, S:  in STD_LOGIC;
				     Q: out STD_LOGIC
		  );
end entity;

-- Arhitectura:
architecture comportamental of bist_JK is
signal clk: STD_LOGIC := '1';
signal M: STD_LOGIC;
begin
	tact: process
	begin
		clk <= not clk;
		wait for 10 ns;
	end process;
	
	bist: process (M, J, K, R, S, clk)
	begin
		if (R = '1') then 
			M <= '0'; 
	    elsif (S = '1') then
			M <= '1';
		elsif clk'event and  clk = '1' then	
			if (J = '0') then
				if (K = '0') then
					null;
				else
					M <= '0';
				end if;
			else
				if (K = '0') then
					M <= '1';
				else
					M <= not(M);
				end if;
			end if;			
		end if;
		Q <= M;
	end process;

end architecture;

	
	
	
		
