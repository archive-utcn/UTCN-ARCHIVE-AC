-- 18. Bistabil D sincron, cu intrãri asincrone si cu proces pt. tact – descriere comportamentalã

library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity bist_D is
	port (
			D, R, S:  in STD_LOGIC;
				  Q: out STD_LOGIC
		  );
end entity;

-- Arhitectura:
architecture comportamental of bist_D is
signal clk: STD_LOGIC := '1';
begin
	tact: process
	begin
		clk <= not clk;
		wait for 10 ns;
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
		
