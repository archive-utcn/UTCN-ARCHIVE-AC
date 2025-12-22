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

-----AND NOT 				   
library ieee;
use ieee.std_logic_1164.all;

entity AND_NOT_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end AND_NOT_GATE;

architecture arh of AND_NOT_GATE is
begin
	process(x,y)
	begin
		z<= not (x and y);
	end process;		 
end architecture arh;

-----OR NOT				   
library ieee;
use ieee.std_logic_1164.all;

entity OR_NOT_GATE is
	port(x,y: in std_logic;
	z: out std_logic);
end OR_NOT_GATE;

architecture arh of OR_NOT_GATE is	
signal a: std_logic;
begin
	process(x,y)
	begin
		a<= x or y;
		z<= not a;
	end process;		 
end architecture arh;