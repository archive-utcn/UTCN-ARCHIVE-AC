-- 33. Modul de simulare pt. bistabil D sincron

-- Bistabil D:
library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity bistD is
	port (
			D, R, S:  in STD_LOGIC;
				  Q: out STD_LOGIC
		  );
end entity;

-- Arhitectura:
architecture comportamental of bistD is
signal clk: STD_LOGIC := '1';
begin
	tact: process
	begin
		clk <= not clk;
		wait for 5 ns;
	end process;
	
	bist: process (D, R, S, clk)
	begin
		if (R = '1') then 
			Q <= '0';
	    elsif (S = '1') then
			Q <= '1';
		elsif clk'event and  clk = '1' then
			Q <= D;
		end if;
	end process;
end architecture;

-- Modul de simulare:
library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity modul_bistD is
end entity;

-- Arhitectura:
architecture comportamental of modul_bistD is

	component bistD is
		port (
				D, R, S:  in STD_LOGIC;
					  Q: out STD_LOGIC
		  	  );
	end component;
	
signal D, R, S, Q: STD_LOGIC;
begin
	UST: bistD port map (D, R, S, Q);
	
	S <= '1', '0' after 20 ns;
	R <= '0', '1' after 20 ns, '0' after 40 ns;
	D <= '0', '1' after 60 ns;
end architecture;
	

