--1. Functiile logice SAU-EXCLUSIV, COINCIDENTÃ si SI-SAU-NU – descriere
--structuralã

-------------------------------- INVERTOR ------------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity INV is	  							 -- Entitate
	port ( X:  in STD_LOGIC;
		  nX: out STD_LOGIC);	
end INV;

architecture comportamental of INV is		 -- Arhitectura
begin
	nX <= not (X);
end architecture;


-------------------------------- POARTA SI -----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity SI is	  							 -- Entitate
	port ( A, B:  in STD_LOGIC;
		      Y: out STD_LOGIC);	
end SI;

architecture comportamental of SI is		 -- Arhitectura
begin
	Y <= A and B;
end architecture;							 


-------------------------------- POARTA SAU ----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity SAU is	  							 -- Entitate
	port ( A, B:  in STD_LOGIC;
		      Y: out STD_LOGIC);	
end SAU;

architecture comportamental of SAU is		 -- Arhitectura
begin
	Y <= A or B;
end architecture;		

------------------------------- POARTA SAU-EXCLUSIV --------------------
--Descriere structurala
--Ecuatie: A XOR B = (A and not(B)) or (not(A) and B)

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;

entity SAU_EXCLUSIV is						  -- Entitate		
	port ( A, B:  in STD_LOGIC;
		      Y: out STD_LOGIC);
end SAU_EXCLUSIV;

architecture structural of SAU_EXCLUSIV is	  -- Arhitectura
-- Componente:
   component SI is	  					 	  -- Poarta SI	   	 
	   port ( A, B:  in STD_LOGIC;
		         Y: out STD_LOGIC);	
   end component;
   
   component SAU is	  						  -- Poarta SAU
	   port ( A, B:  in STD_LOGIC;
		         Y: out STD_LOGIC);	
   end component;
   
   component INV is	  						  -- Invertor  	
	   port ( X:  in STD_LOGIC;
		     nX: out STD_LOGIC);	
   end component;			
   
-- Semnale:  
SIGNAL Aneg,		 		-- A negat
	   Bneg,			    -- B negat
	   	 o1,				-- iesirea poartei SI nr1, o1 = A and not(B) 
	   	 o2 :STD_LOGIC;		-- iesirea poartei SI nr2, o2 = not(A) and B
			
begin
	
	inv1: INV port map (A, Aneg);
	inv2: INV port map (B, Bneg);
	
	si1: SI port map (A, Bneg, o1);
	si2: SI port map (Aneg, B, o2);
	
	sau1: SAU port map (o1, o2, Y);

end architecture; 

--------------------- Fuctia logica de coincidenta (NXOR) ----------------------
--Descriere structurala
--Ecuatie: f = (A = B) = not (A xor B) = not ( (A and not(B)) or (not(A) and B) )

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;

entity egal is								  -- Entitate		
	port ( A, B:  in STD_LOGIC;
		      Y: out STD_LOGIC);
end egal;

architecture structural of egal is			  -- Arhitectura
-- Componente:
   component SI is	  					 	  -- Poarta SI	   	 
	   port ( A, B:  in STD_LOGIC;
		         Y: out STD_LOGIC);	
   end component;
   
   component SAU is	  						  -- Poarta SAU
	   port ( A, B:  in STD_LOGIC;
		         Y: out STD_LOGIC);	
   end component;
   
   component INV is	  						  -- Invertor  	
	   port ( X:  in STD_LOGIC;
		     nX: out STD_LOGIC);	
   end component;			
   
-- Semnale:  
SIGNAL Aneg,		 		-- A negat
	   Bneg,			    -- B negat
	   	 o1,				-- iesirea poartei SI nr1, o1 = A and not(B) 
	   	 o2,				-- iesirea poartei SI nr2, o2 = not(A) and B
		 o3	:STD_LOGIC;		-- iesirea poartei OR      o3 = A xor B 
 
begin
	
	inv1: INV port map (A, Aneg);
	inv2: INV port map (B, Bneg);
	
	si1: SI port map (A, Bneg, o1);
	si2: SI port map (Aneg, B, o2);
	
	sau1: SAU port map (o1, o2, o3);
	
	inv3: INV port map (o3, Y);

end architecture;


	
	
	