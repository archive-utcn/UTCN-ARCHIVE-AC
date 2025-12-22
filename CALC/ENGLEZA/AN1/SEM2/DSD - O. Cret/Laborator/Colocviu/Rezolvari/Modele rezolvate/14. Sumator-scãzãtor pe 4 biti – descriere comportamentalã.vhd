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
			Z := "00000";
			Z(0) :=Cin;
			X(4) := '1';
			X(3 downto 0) := A;
			Y(4) := '0';
			Y(3 downto 0) := B;
			O := A - B - Z;
			S <= O(3 downto 0);
			Cout <= not ( O(4) );
		end if;
	end process;
end architecture;
			
			
			