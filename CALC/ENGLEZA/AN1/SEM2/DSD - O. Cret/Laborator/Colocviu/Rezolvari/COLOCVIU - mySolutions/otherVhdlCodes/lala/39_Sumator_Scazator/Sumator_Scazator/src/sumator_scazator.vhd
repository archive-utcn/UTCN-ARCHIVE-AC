library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity ss is
	port (	a, b:  in STD_LOGIC_VECTOR (3 downto 0);
	sel:  in STD_LOGIC;   
	s: out STD_LOGIC_VECTOR (3 downto 0);
	cout: out STD_LOGIC);
end ss;

architecture a of ss is
begin
	process ( a, b, sel)
	variable X, Y, O: STD_LOGIC_VECTOR (4 downto 0);
	begin
		if (sel = '0') then 		
			X(4) := '0';
			X(3 downto 0) := A;
			Y(4) := '0';
			y(3 downto 0) := B;
			O := X + Y + sel;
			S <= O(3 downto 0);
			cout <= O(4);
		else		
			Y(4) := '1';
			Y(3) := not B(3); 
			Y(2) := not B(2);
			Y(1) := not B(1);
			Y(0) := not B(0);
			X(4) := '0';
			X(3 downto 0) := A;
			O := X + Y + sel;
			S <= O(3 downto 0);
			cout <= '0';
		end if;
	end process;
end a;