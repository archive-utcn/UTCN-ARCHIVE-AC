-- 9. DEMUX cu parametri generici –-----------------
------ *exemplificare pt. DEMUX 1:8 ----------------

Library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DEMUX is	  				        -- Entitate	
-- Parametrii genericii:
--     nr_sel : numarul intrarilor de selectie 

	generic (					        
			  nr_sel: INTEGER := 3      -- pentru DEMUX 1:8, nr_sel = 3
		     );

-- Semanle de intrare si de iesire:
--     S : intrari de selctie
--     X : intrarea de date
--     O : iesiriile demultiplexorului

	port (  						
			S:  in STD_LOGIC_VECTOR (nr_sel - 1 downto 0);
			O: out STD_LOGIC_VECTOR (2**nr_sel - 1 downto 0);
			X:  in STD_LOGIC
		  );
end entity;

architecture comportamental of DEMUX is	 -- Arhitectura
begin

	process (S,X) 
	variable tempO: STD_LOGIC_VECTOR (2**nr_sel - 1 downto 0);
	begin
		tempO := (tempO'range => '0');	 -- umplam vectorul cu '0' uri
	    tempO(conv_integer (S)) := X;	 -- pe pozitia corespunzatoare punem pe X
		O <= tempO;
	end process;
	
end architecture;