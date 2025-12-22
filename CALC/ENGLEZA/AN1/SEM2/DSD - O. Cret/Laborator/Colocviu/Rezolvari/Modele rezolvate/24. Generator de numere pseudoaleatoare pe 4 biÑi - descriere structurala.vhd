-- 24. Generator de numere pseudoaleatoare pe 4 bi—i ñ descriere structural„

---------------------Registru universal ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity registru is
	port (
			CLK, L, ST, DR, R, SI:  in STD_LOGIC;
						      Din:  in STD_LOGIC_VECTOR (7 downto 0);
							 Dout: out STD_LOGIC_VECTOR (7 downto 0)
		  );
end entity;

-- Arhitectura:
architecture comportamental of registru is
signal M: STD_LOGIC_VECTOR (7 downto 0);
begin
	process (CLK, L, ST, DR, R, SI, Din)
	begin
		if (CLK = '1') and (CLK'EVENT) then
			if (R = '1') then 			   			-- Resetare
				M <= "00000000";
			elsif (L = '1') then					-- Incarcare paralela
				M <= Din;
			elsif (DR = '1') then					-- Deplasare dreapta
				M(6 downto 0) <= M(7 downto 1);
				M(7) <= SI; 
			elsif (ST = '1') then					-- Deplasare stanga
				M(7 downto 1) <= M(6 downto 0);
				M(0) <= SI;
			end if;
		end if;
	end process;
	Dout <= M;
end architecture;

-------------------------------- POARTA XOR ----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity XOR2 is	  							 -- Entitate
	port ( A, B:  in STD_LOGIC;
		      Y: out STD_LOGIC);	
end XOR2;

architecture comportamental of XOR2 is		 -- Arhitectura
begin
	Y <= A xor B;
end architecture;
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- Entitatea:
entity generator_SPA is
	port (
			R, CLK:  in STD_LOGIC;
		      Dout: out STD_LOGIC_VECTOR (3 downto 0)
		  );											 
end entity;

-- Arhitectura:
architecture structural of generator_SPA is
-- Componente:
	-- 1. Registru universal
	component registru is
		port (
				CLK, L, ST, DR, R, SI:  in STD_LOGIC;
							      Din:  in STD_LOGIC_VECTOR (7 downto 0);
								 Dout: out STD_LOGIC_VECTOR (7 downto 0)
		  	  );
	end component;
	-- 2. Poarta XOR
	component XOR2 is	  							 -- Entitate
		port ( A, B:  in STD_LOGIC;
			      Y: out STD_LOGIC);	
	end component;

-- Signal:
signal X: STD_LOGIC;
signal Y: STD_LOGIC_VECTOR (7 downto 0);
begin
	reg: registru port map (CLK => CLK, L=> R, ST => '0', DR => '1', R=> '0', SI => X, Din => "00010000", Dout => Y);
	xor1: XOR2 port map (Y(7), Y(4), X);
	Dout <= Y (7 downto 4);
end architecture;


