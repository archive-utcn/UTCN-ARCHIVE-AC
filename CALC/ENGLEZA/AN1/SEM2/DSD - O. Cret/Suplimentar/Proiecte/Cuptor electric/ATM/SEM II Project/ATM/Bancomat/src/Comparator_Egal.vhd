library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity COMP_EGAL IS 	
	PORT( A,B:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	BUT: in std_logic;
	C:OUT STD_LOGIC); 
END COMP_EGAL; 

architecture ARH OF COMP_EGAL IS 
BEGIN 
	PROCESS(BUT,A,B) 
	variable INTER: std_logic; 
	BEGIN 
		if BUT='1' then 
			INTER:='1';	
			FOR I IN 0 TO 15 LOOP
				IF A(I)/=B(I) THEN INTER:='0'; 
				END IF;	
			END LOOP;
			C<=INTER;
		ELSE C<='1';
		END IF;	
	END PROCESS;
END ARH;