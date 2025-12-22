-- 14. Sumator-scãzãtor pe 4 biti – descriere comportamentalã

library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Entitate:
entity sumator_scazator is
	
	-- Semnale de intrare si de iesire:
	port (					  
		        A, B:  in STD_LOGIC_VECTOR (3 downto 0);
			Sel, Cin:  in STD_LOGIC;   
				   S: out STD_LOGIC_VECTOR (3 downto 0);
				Cout: out STD_LOGIC
		  );
		  
end entity;

-- Arhitectura:
architecture comportamental of sumator_scazator is
begin
	process ( A, B, Sel, Cin)
	variable X, Y, O, Z: STD_LOGIC_VECTOR (4 downto 0);
	begin
		if (Sel = '0') then 			-- adunare
			Z := "00000";
			Z(0) :=Cin;
			X(4) := '0';
			X(3 downto 0) := A;
			Y(4) := '0';
			y(3 downto 0) := B;
			O := X + Y + Z;
			S <= O(3 downto 0);
			Cout <= O(4);
		else		
			Z := "00001";
			Y(4) := '1';
			Y(3) := not B(3); 
			Y(2) := not B(2);
			Y(1) := not B(1);
			Y(0) := not B(0);
			X(4) := '0';
			X(3 downto 0) := A;
			O := X + Y + Z;
			S <= O(3 downto 0);
		end if;
	end process;
end architecture;
			
			
			