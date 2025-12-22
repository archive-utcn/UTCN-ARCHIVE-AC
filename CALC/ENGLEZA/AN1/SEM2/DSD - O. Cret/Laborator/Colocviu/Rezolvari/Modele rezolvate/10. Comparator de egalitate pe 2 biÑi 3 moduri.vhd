-- 10. Comparator de egalitate pe 2 bi—i ñ descriere structural„
-- 11. Comparator de egalitate pe 2 bi—i ñ descriere comportamental„
-- 12. Comparator de egalitate pe 2 bi—i ñ descriere ìflux de dateî

-- portii logice:
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


-------------------------------- POARTA AND -----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity AND3 is	  							 -- Entitate
	port ( A, B, C:  in STD_LOGIC;
		         Y: out STD_LOGIC);	
end AND3;

architecture comportamental of AND3 is		 -- Arhitectura
begin
	Y <= A and B and C;
end architecture;							 


-------------------------------- POARTA OR ----------------------------

library IEEE;								
use IEEE.STD_LOGIC_1164.ALL;				
											
entity OR3 is	  							 -- Entitate
	port ( A, B, C:  in STD_LOGIC;
		         Y: out STD_LOGIC);	
end OR3;

architecture comportamental of OR3 is		 -- Arhitectura
begin
	Y <= A or B or C;
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

-- Entitate:
entity comp2 is
	
	--Semnale de iesire si de intrare:
		-- A, B: cele doua intrari a comparatorul
		-- mic:  A<B
		-- mare: A>B
		-- egal: A=B
		
	port (
					   A, B:  in STD_LOGIC_VECTOR (1 downto 0);
			mic, mare, egal: out STD_LOGIC 
	   	  );
	
end entity;

-- Arhitectura:
-- Nr. 1. Descriere Structurala
	

architecture structural of comp2 is
	-- Componente:
	 -- 1. Invertor:
		component INV is	  					
			port ( X:  in STD_LOGIC;
		  		  nX: out STD_LOGIC);	
		end component INV;
	 -- 2. Poarta AND:	
		component AND3 is	  							 
			port ( A, B, C:  in STD_LOGIC;
		                 Y: out STD_LOGIC);	
		end component AND3;
	 -- 3. Poarta OR:
	 	component OR3 is	  							 -- Entitate
			port ( A, B, C:  in STD_LOGIC;
		    		     Y: out STD_LOGIC);	
		end component OR3;
	 -- 4. Poarta XOR:
	 	component XOR2 is	  							 -- Entitate
			port ( A, B:  in STD_LOGIC;
		   		      Y: out STD_LOGIC);	
		end component XOR2;
		
-- Semnale:
signal nA0, nA1, nB0, nB1,
	   p1, p2, p3,
	   q1, q2, q3,
	   t1, t2, t3 : STD_LOGIC;
	
begin
	
	inv_1: INV port map ( A(0), nA0);
	inv_2: INV port map ( A(1), nA1);
	inv_3: INV port map ( B(0), nB0);
	inv_4: INV port map ( B(1), nB1);

-- mic:
	and_1: AND3 port map ( B(1),  nA1,  '1', p1);
	and_2: AND3 port map ( B(0),  nA0,  nA1, p2);
	and_3: AND3 port map ( nA0,  B(1), B(0), p3);
	
	or1: OR3 port map (p1, p2, p3, mic);

-- mare: 
    and_4: AND3 port map ( A(1),   nB1,  '1', q1);
	and_5: AND3 port map ( A(0),   nB0,  nB1, q2);
	and_6: AND3 port map (  nB0,  A(1), A(0), q3);
	
	or2: OR3 port map (q1, q2, q3, mare);

-- egal:
	xor_1: XOR2 port map ( A(1), B(1), t1);
	xor_2: XOR2 port map ( A(0), B(0), t2);
	
	or_3: OR3 port map ( t1, t2, '0', t3);
	
	inv_5: INV port map (t3, egal);
	
end architecture;


-- Nr. 2. Descriere Comportamentala
architecture comportamental of comp2 is
begin
	process (A,B)
	begin
		if (A<B) then
			mic <= '1';
		else 
			mic <= '0';
		end if;
		
		if (A=B) then 
			egal <= '1';
		else
			egal <= '0';
		end if;
		
		if (A>B) then
			mare <= '1';
		else 
			mare <= '0';
		end if;
	end process;
end architecture;

-- Nr. 3. Descriere "Flux de Date"
architecture flux_de_date of comp2 is
begin
	 mic <= ( B(1) and (not(A(1)))) or ( B(0) and (not(A(0))) and (not(A(1)))) or ( (not(A(0))) and B(1) and B(0) );
	mare <= ( A(1) and (not(B(1)))) or ( A(0) and (not(B(0))) and (not(B(1)))) or ( (not(B(0))) and A(1) and A(0) );
	egal <=  not ( (A(1) xor B(1)) or (A(0) xor B(0)) );
end architecture;


	
	
		
	
		
