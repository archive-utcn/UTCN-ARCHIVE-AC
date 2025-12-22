-- 17. Unitate aritmetico-logicã (+, -, x, /; SI, NU, SAU, SAU-EXCLUSIV)

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Entitatea:
entity UAL is
	Port (
			S:  in STD_LOGIC_VECTOR (2 downto 0);
			A,B: in STD_LOGIC_VECTOR (7 downto 0);
			Cin: in STD_LOGIC;
			O: out STD_LOGIC_VECTOR (7 downto 0);
			Cout: out STD_LOGIC
		 );
end entity;


architecture comportamental of UAL is
begin
	process (S, A, B, Cin)
	variable X, Y, Z, T: STD_LOGIC_VECTOR (8 downto 0);
	variable		  H: STD_LOGIC_VECTOR (15 downto 0);	
	begin
		if (S = "000") then		  -- Adunare (+)
			Z := "000000000";     Z(0) := Cin;
			X(7 downto 0) := A;	  X(8) := '0';
			Y(7 downto 0) := B;   Y(8) := '0';
			T := X + Y + Z;
			O <= T (7 downto 0);  Cout <= T(8);
	 elsif (S = "001") then		  -- Scadere (-)
			Z := "000000000";     Z(0) := Cin;
			X(7 downto 0) := A;	  X(8) := '1';
			Y(7 downto 0) := B;   Y(8) := '0';
			T := X - Y - Z;
			O <= T (7 downto 0);  Cout <= not T(8);
	 elsif (S = "010") then		  -- Inmultire (*)
		 	H := A * B;
		 	O <= H(7 downto 0);	
	 elsif (S = "011") then		  -- Inpartire (/)
			null;
	 elsif (S = "100") then		  -- AND
		    O <= A and B;
	 elsif (S = "101") then		  -- NOT
		    O <= not (A);
	 elsif (S = "110") then		  -- OR
		    O <= A or B;
	 elsif (S = "100") then		  -- XOR
		    O <= A xor B;
	 end if;
	end process;
end architecture;
			

			