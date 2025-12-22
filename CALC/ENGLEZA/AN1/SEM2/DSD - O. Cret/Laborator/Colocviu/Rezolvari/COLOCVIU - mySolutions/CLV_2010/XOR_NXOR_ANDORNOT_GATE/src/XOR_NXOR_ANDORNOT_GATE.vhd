--AND_GATE
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

--OR_GATE
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

--NOT_GATE
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

--XOR_GATE
library ieee;
use ieee.std_logic_1164.all;

entity XOR_GATE is
	port(x,y: in std_logic;
	z:out std_logic);
end XOR_GATE;

architecture arh of XOR_GATE is

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

signal N1,N2,N3,N4: std_logic;

begin
	C1: NOT_GATE port map(x,N1);
	C2: NOT_GATE port map(y,N2);
	C3: AND_GATE port map(x,N2,N3);
	C4: AND_GATE port map(N1,y,N4);
	C5: OR_GATE port map(N3,N4,z);
	
end architecture arh;

--NXOR_GATE
library ieee;
use ieee.std_logic_1164.all;

entity NXOR_GATE is
	port(x,y: in std_logic;
	z:out std_logic);
end NXOR_GATE;

architecture arh of NXOR_GATE is

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

signal N1,N2,N3,N4: std_logic;

begin
	C1: NOT_GATE port map(x,N1);
	C2: NOT_GATE port map(y,N2);
	C3: AND_GATE port map(N1,N2,N3);
	C4: AND_GATE port map(x,y,N4);
	C5: OR_GATE port map(N3,N4,z);
	
end architecture arh;

--SI-SAU-NU
library ieee;
use ieee.std_logic_1164.all;

entity SI_SAU_NU_GATE is
	port(a,b,c,d: in std_logic;
	result:out std_logic);
end SI_SAU_NU_GATE;

architecture arh of SI_SAU_NU_GATE is

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

signal N1,N2,N3,N4: std_logic;

begin
	C1: AND_GATE port map(a,b,N1);
	C2: AND_GATE port map(c,d,N2);
	C3: OR_GATE port map(N1,N2,N3);
	C4: NOT_GATE port map(N3, result);
end architecture arh;