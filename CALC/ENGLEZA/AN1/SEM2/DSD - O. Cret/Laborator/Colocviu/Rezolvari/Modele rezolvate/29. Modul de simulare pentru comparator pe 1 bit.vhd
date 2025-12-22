-- 29. Modul de simulare pentru comparator pe 1 bit

-- Comparator pe 1 bit:

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity comp1 is
	port (
			           A, B:  in STD_LOGIC;
			mic, mare, egal: out STD_LOGIC
		  );
end entity;

-- Arhitectura
architecture flux of comp1 is
begin
	mic <= (not A) and B;
	mare <= A and (not B);
	egal <= not (A xor B);
end;

-- Modul de simulare:
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity modul_comp1 is
end entity;

-- Arhitectura:
architecture comportamental of modul_comp1 is
	component comp1 is
		port (
				           A, B:  in STD_LOGIC;
				mic, mare, egal: out STD_LOGIC
		 	 );
	end component;
signal A, B, mic, mare, egal: STD_LOGIC;
begin									
	UST: comp1 port map ( A, B, mic, mare, egal);
	
	A <= '0', '1' after 80 ns;
	B <= '0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns;
end architecture;
	
	

