-- 35. Modul de simulare pt. bistabil T sincron

-- Bistabil T:
library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity bistT is
	port (
			T, R, S:  in STD_LOGIC;
			      Q: out STD_LOGIC
		  );
end entity;

-- Arhitectura:
architecture comportamental of bistT is
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

-- Modul de simulare:
library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity modul_bistT is
end entity;

-- Arhitectura:
architecture comportamental of modul_bistT is
	component bistT is
		port (
				T, R, S:  in STD_LOGIC;
				      Q: out STD_LOGIC
			  );
	end component;
 
signal T, R, S, Q: STD_LOGIC;
begin
	
	UST: bistT port map (T, R, S, Q);
	
	R <= '1', '0' after 20 ns;
	S <= '0', '1' after 100 ns, '0' after 120 ns;
	T <= '0', '1' after 40 ns, '0' after 100 ns, '1' after 140 ns;
end architecture;

		