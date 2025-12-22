-- 30. Modul de simulare pt. MUX 4:1

-- MUX 4:1

Library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Entitate:
entity MUX4_1 is	 
	port (  						
			S:  in STD_LOGIC_VECTOR (1 downto 0);
			X:  in STD_LOGIC_VECTOR (3 downto 0);
			O: out STD_LOGIC
		  );
end entity;

--Arhitectura:
architecture comportamental of MUX4_1 is	 -- Arhitectura
begin
	O <= X( conv_integer(S) );
end architecture;


-- Modul de simulare

library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate
entity modul_mux4 is
end entity;

-- Arhitectura:
architecture comportamental of modul_mux4 is
	component MUX4_1 is	 
		port (  						
				S:  in STD_LOGIC_VECTOR (1 downto 0);
				X:  in STD_LOGIC_VECTOR (3 downto 0);
				O: out STD_LOGIC
		  	  );
	end component;
	
signal S: STD_LOGIC_VECTOR (1 downto 0);
signal X: STD_LOGIC_VECTOR (3 downto 0);
signal O: STD_LOGIC;

begin
	
	UST: MUX4_1 port map (S, X, O);
	
	X <= "0001", "0010" after 20 ns, "0100" after 40 ns, "1000" after 60 ns,
	     "1110" after 80 ns, "1101" after 100 ns, "1011" after 120 ns, "0111" after 140 ns;
	S <= "00", "01" after 20 ns, "10" after 40 ns, "11" after 60 ns,
	"00" after 80 ns, "01" after 100 ns, "10" after 120 ns, "11" after 140 ns;
	
end architecture;




