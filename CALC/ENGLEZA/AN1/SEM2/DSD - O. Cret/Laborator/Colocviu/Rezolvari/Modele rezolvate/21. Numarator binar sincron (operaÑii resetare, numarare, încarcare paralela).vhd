-- 21. Num„r„tor binar sincron (opera—ii: resetare, num„rare, Ónc„rcare paralel„)

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


-- Entitate:
entity num_bin is
	port (
			      Din:  in STD_LOGIC_VECTOR (3 downto 0);
			CLK, R, L:  in STD_LOGIC;
					Q: out STD_LOGIC_VECTOR (3 downto 0)
		  );
end entity;

-- Arhitectura:
architecture comportamental of num_bin is
signal M: STD_LOGIC_VECTOR (3 downto 0);
begin
	process (clk, r, l, Din)
	begin
		if (clk = '1') and (clk'event) then
			if (R = '1') then
				M <= "0000";
			elsif (L = '1') then 
				M <= Din;
			else 
				M <= M + "0001";
			end if;
		end if;
	end process;
	Q <= M;
end architecture;