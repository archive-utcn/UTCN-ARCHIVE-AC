-----NOT 
library ieee;
use ieee.std_logic_1164.all;

entity NOT_GATE is
	port(x: in std_logic;
	y:out std_logic);
end NOT_GATE;

architecture arh of NOT_GATE is
begin
	process (x)
	begin 
		y<=not x;
	end process;
end architecture arh;

-----AND				   
library ieee;
use ieee.std_logic_1164.all;

entity AND_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end AND_GATE;

architecture arh of AND_GATE is
begin
	process(x,y)
	begin
		z<= x and y;
	end process;		 
end architecture arh;	

-----OR				   
library ieee;
use ieee.std_logic_1164.all;

entity OR_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end OR_GATE;

architecture arh of OR_GATE is
begin
	process(x,y)
	begin
		z<= x or y;
	end process;		 
end architecture arh; 	

-----XOR
library ieee;
use ieee.std_logic_1164.all;

entity XOR_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end XOR_GATE;

architecture arh of XOR_GATE is
begin
	z<= x xor y;
end architecture arh; 

--COMPARATOR_STRUCTURAL
library ieee;
use ieee.std_logic_1164.all;

entity COMPARATOR_STRUCTURAL is
	port(a,b: in std_logic_vector(1 downto 0);
	f1,f2,f3: out std_logic);
end COMPARATOR_STRUCTURAL;

architecture arh of COMPARATOR_STRUCTURAL is

component AND_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end component AND_GATE;

component OR_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end component OR_GATE;

component NOT_GATE is
	port(x: in std_logic;
	y:out std_logic);
end component NOT_GATE;	

component XOR_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end component XOR_GATE;

signal N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17: std_logic;

begin		
	C1: NOT_GATE port map(a(1),N1);
	C2: NOT_GATE port map(a(0),N2);
	C3: NOT_GATE port map(b(1),N3);
	C4: AND_GATE port map(N1,b(1),N4);
	C5: AND_GATE port map(N1,N2,N5);
	C6: AND_GATE port map(N5,b(0),N6);	
	C7: OR_GATE port map(N4,N6,f1);
	C8: XOR_GATE port map(a(1),b(1),N7);
	C9: NOT_GATE port map(N7,N8);
	C10: XOR_GATE port map(a(0),b(0),N9);
	C11: NOT_GATE port map(N9,N10);
	C12: AND_GATE port map(N8,N10,f2);
	C13: AND_GATE port map(a(1),N3,N11);
	C14: AND_GATE port map(a(1),a(0),N12);
	C15: NOT_GATE port map(b(0),N13);
	C16: AND_GATE port map(N12,N13,N14);
	C17: OR_GATE port map(N11,N14,N15);
	C18: AND_GATE port map(a(0),N3,N16);
	C19: AND_GATE port map(N16,N13,N17);
	C20: OR_GATE port map(N15,N17,f3);
end architecture arh;