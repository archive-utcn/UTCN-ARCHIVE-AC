-- 31. Modul de simulare pt. DMUX 4:1

-- DMUX 4:1

Library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Entitate:
entity DMUX4_1 is	 
	port (  						
			S:  in STD_LOGIC_VECTOR (1 downto 0);
			O: out STD_LOGIC_VECTOR (3 downto 0);
			X:  in STD_LOGIC
		  );
end entity;

--Arhitectura:
architecture comportamental of DMUX4_1 is	 -- Arhitectura
begin
	process (S, X)
	variable temp:STD_LOGIC_VECTOR (3 downto 0);
	begin
		temp := "0000";
		temp( conv_integer(S) ) := X;
		O <= temp;
	end process;

end architecture;


-- Modul de simulare

library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate
entity modul_dmux4 is
end entity;

-- Arhitectura:
architecture comportamental of modul_dmux4 is
	component DMUX4_1 is	 
		port (  						
				S:  in STD_LOGIC_VECTOR (1 downto 0);
				O: out STD_LOGIC_VECTOR (3 downto 0);
				X:  in STD_LOGIC
		  	  );
	end component;
	
signal S: STD_LOGIC_VECTOR (1 downto 0);
signal O: STD_LOGIC_VECTOR (3 downto 0);
signal X: STD_LOGIC;

begin
	
	UST: DMUX4_1 port map (S, O, X);
	
	X <= '0', '1' after 80 ns;
	S <= "00", "01" after 20 ns, "10" after 40 ns, "11" after 60 ns,
	"00" after 80 ns, "01" after 100 ns, "10" after 120 ns, "11" after 140 ns;
	
end architecture;




