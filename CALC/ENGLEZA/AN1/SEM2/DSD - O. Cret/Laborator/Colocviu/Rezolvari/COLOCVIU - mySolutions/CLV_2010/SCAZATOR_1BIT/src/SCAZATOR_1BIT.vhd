library ieee;
use ieee.std_logic_1164.all;

entity SCAZATOR_1BIT is
	port(a,b,i: std_logic;
	br,d: out std_logic);
end SCAZATOR_1BIT;

architecture arh_structurala of SCAZATOR_1BIT is   

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

signal N1,N2,N3,N4,N5,N6: std_logic;

begin
	C1: XOR_GATE port map(a,b,N1);
	C2: XOR_GATE port map(N1,i,d);
	C3: NOT_GATE port map(a,N2);
	C4: AND_GATE port map(N2,i,N3);
	C5: AND_GATE port map(N2,b,N4);
	C6: AND_GATE port map(b,i,N5);
	C7: OR_GATE port map(N3,N4,N6);
	C8: OR_GATE port map(N5,N6,br);
	
end architecture arh_structurala;