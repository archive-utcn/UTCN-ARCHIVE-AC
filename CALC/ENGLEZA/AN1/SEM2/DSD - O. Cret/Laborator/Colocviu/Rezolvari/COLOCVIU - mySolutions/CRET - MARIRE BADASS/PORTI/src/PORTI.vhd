library ieee;
use ieee.std_logic_1164.all;

entity NOT_GATE is
	port( a: in std_logic;
	y: out std_logic);
end entity NOT_GATE;

architecture arh of NOT_GATE is
begin
	y<= not a;
end architecture arh;

library ieee;
use ieee.std_logic_1164.all;

entity AND_GATE is
	port( a,b: in std_logic;
	y: out std_logic);
end entity AND_GATE;

architecture arh of AND_GATE is
begin
	y<= a and b;
end architecture arh;

library ieee;
use ieee.std_logic_1164.all;

entity OR_GATE is
	port( a,b: in std_logic;
	y: out std_logic);
end entity OR_GATE;

architecture arh of OR_GATE is
begin
	y<= a or b;
end architecture arh;

library ieee;
use ieee.std_logic_1164.all;

entity NOT_AND_GATE is
	port( a,b: in std_logic;
	y: out std_logic);
end entity NOT_AND_GATE;

architecture arh of NOT_AND_GATE is
begin
	y<= a nand b;
end architecture arh;

library ieee;
use ieee.std_logic_1164.all;

entity NOT_OR_GATE is
	port ( a,b: in std_logic;
	y: out std_logic);
end entity NOT_OR_GATE;

architecture arh of NOT_OR_GATE is
begin
	y<= a nor b;
end architecture arh;