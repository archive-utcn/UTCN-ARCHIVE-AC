-- 27. Modul de simulare pentru sumator complet pe 1 bit

-- Sumator complet pe 1 bit:

 library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


-- Entitate:
entity Sumator1 is
	port (
			A, B, Cin:  in STD_LOGIC;
			  S, Cout: out STD_LOGIC
	      );
end entity;

-- Arhitectura:
architecture comportamental of Sumator1 is
begin
	process (A, B, Cin)
	variable X, Y, Z, T: STD_LOGIC_VECTOR(1 downto 0);
	begin
		X(0) := A;   X(1) := '0';
		Y(0) := B;   Y(1) := '0';
		Z(0) := Cin; Z(1) := '0';
		T := X + Y + Z;
		S <= T(0);
		Cout <= T(1);
	end process;
end architecture; 

-- Modul de simulare
library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


-- Entitate:
entity Modul_sumator is
end entity;


-- Arhitectura:
architecture comportamental of Modul_sumator is
	component Sumator1 is
		port (
				A, B, Cin:  in STD_LOGIC;
				  S, Cout: out STD_LOGIC
	      	  );	
	end component;

signal A, B, Cin, S, Cout: STD_LOGIC;	
begin								
	
	UST: Sumator1 port map (A, B, Cin, S, Cout);
	
	A <= '0', '1' after 80 ns;
	B <= '0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns;
	Cin <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns, '0' after 120 ns, '1' after 140 ns;

end architecture;
	
	
		
		