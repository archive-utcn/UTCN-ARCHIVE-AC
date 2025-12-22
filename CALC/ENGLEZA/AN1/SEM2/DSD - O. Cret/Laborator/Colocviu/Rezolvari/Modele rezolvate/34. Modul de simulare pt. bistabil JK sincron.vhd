--34. Modul de simulare pt. bistabil JK sincron
library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity bistJK is
	port (
			J, K, R, S:  in STD_LOGIC;
				     Q: out STD_LOGIC
		  );
end entity;

-- Arhitectura:
architecture comportamental of bistJK is
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

--  Modul de simulare

library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate
entity modul_bistJK is
end entity;

-- Arhitectura
architecture comportamental of modul_bistJK is
	component bistJK is
		port (
				J, K, R, S:  in STD_LOGIC;
					     Q: out STD_LOGIC
		  	);
	end component;
	
signal J, K, R, S, Q: STD_LOGIC;

begin
	UST: bistJK port map(J, K, R, S, Q);
	
	S <= '1', '0' after 20 ns;
	R <= '0', '1' after 20 ns, '0' after 40 ns;
	J <= '0', '1' after 80 ns;
	K <= '0', '1' after 60 ns, '0' after 80 ns, '1' after 100 ns;
end architecture;