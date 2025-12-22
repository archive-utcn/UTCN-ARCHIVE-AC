-- 8. MUX cu parametri generici –-----------------
------ *exemplificare pt. MUX 8:1 ----------------

Library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity MUX is	  				        -- Entitate	
-- Parametrii genericii:
--     nr_sel : numarul intrarilor de selectie 

	generic (					        
			  nr_sel: INTEGER := 3      -- pentru MUX 8:1, nr_sel = 3
		     );

-- Semanle de intrare si de iesire:
--     S : intrari de selctie
--     X : intrari de date
--     Q : iesirea multiplexorului

	port (  						
			S:  in STD_LOGIC_VECTOR (nr_sel - 1 downto 0);
			X:  in STD_LOGIC_VECTOR (2**nr_sel - 1 downto 0);
			O: out STD_LOGIC
		  );
end entity;

architecture comportamental of MUX is	 -- Arhitectura
begin
	O <= X( conv_integer(S) );
end architecture;
									
	
