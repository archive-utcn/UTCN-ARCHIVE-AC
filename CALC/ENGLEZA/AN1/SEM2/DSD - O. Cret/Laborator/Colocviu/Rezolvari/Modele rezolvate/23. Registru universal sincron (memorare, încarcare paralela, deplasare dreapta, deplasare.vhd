--23. Registru universal sincron (memorare, încãrcare paralelã, deplasare dreapta, deplasare
--stânga, resetare)

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