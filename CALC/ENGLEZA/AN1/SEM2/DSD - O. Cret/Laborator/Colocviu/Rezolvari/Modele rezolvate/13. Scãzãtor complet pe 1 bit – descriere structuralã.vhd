-- 13. Scãzãtor complet pe 1 bit – descriere structuralã

-------------------------------- INVERTOR ------------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity INV_1 is	  							 -- Entitate
	port ( X:  in STD_LOGIC;
		  nX: out STD_LOGIC);	
end INV_1;

architecture comportamental of INV_1 is		 -- Arhitectura
begin
	nX <= not (X);
end architecture;


-------------------------------- POARTA SI -----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity SI_2 is	  							 -- Entitate
	port ( A, B:  in STD_LOGIC;
		      Y: out STD_LOGIC);	
end SI_2;

architecture comportamental of SI_2 is		 -- Arhitectura
begin
	Y <= A and B;
end architecture;							 


-------------------------------- POARTA SAU ----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity SAU_3 is	  							 -- Entitate
	port ( A, B, C:  in STD_LOGIC;
		         Y: out STD_LOGIC);	
end SAU_3;

architecture comportamental of SAU_3 is		 -- Arhitectura
begin
	Y <= A or B or C;
end architecture;

-------------------------------- POARTA XOR ----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity XOR_2 is	  							 -- Entitate
	port ( A, B:  in STD_LOGIC;
		      Y: out STD_LOGIC);	
end XOR_2;

architecture comportamental of XOR_2 is		 -- Arhitectura
begin
	Y <= A xor B;
end architecture;

------------------------------------------------------------------------

library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity scazator is
	
	-- Semnale de intrare si de iesire:
	port (
			 A, B, Cin:  in STD_LOGIC;
			   S, Cout: out STD_LOGIC
		  );						 

end entity;


-- Arhitectura:
architecture structural of scazator is
-- Componente:
	   -- 1. Invertor:
	   component INV_1 is	  							
			port ( X:  in STD_LOGIC;
		  		  nX: out STD_LOGIC);	
	   end component INV_1;
	   -- 2. Poarta SI:
	   component SI_2 is	  							 -- Entitate
			port ( A, B:  in STD_LOGIC;
				      Y: out STD_LOGIC);	
	   end component SI_2;
	   -- 3. Poarta SAU:
	   component SAU_3 is	  							 -- Entitate
			port ( A, B, C:  in STD_LOGIC;
		    		     Y: out STD_LOGIC);	
	   end component SAU_3;
	   -- 4. Poarta SAU-EXCLUSIV:
	   component XOR_2 is	  							 -- Entitate
			port ( A, B:  in STD_LOGIC;
		    		  Y: out STD_LOGIC);	
	   end component XOR_2;
	
	   
-- Semnale:
signal nA, nCin,
	   x1, x2, x3,
	   y1, y2, y3: STD_LOGIC;

begin
	inv_nr1: INV_1 port map ( Cin, nCin);
	inv_nr2: INV_1 port map (   A,   nA);
	
-- S:
	xor_nr1: XOR_2 port map ( A, B, x1);
	inv_nr3: INV_1 port map (x1, x2);
	xor_nr2: XOR_2 port map (x2, Cin, x3);
	inv_nr4: INV_1 port map (x3, S);

-- Cout:
	si_nr1: SI_2 port map ( nA, B, y1);
	si_nr2: SI_2 port map ( nA, Cin, y2);
	si_nr3: SI_2 port map ( B, Cin, y3);
	sau_nr1: SAU_3 port map (y1, y2, y3, Cout);

end architecture;
	
	
		



