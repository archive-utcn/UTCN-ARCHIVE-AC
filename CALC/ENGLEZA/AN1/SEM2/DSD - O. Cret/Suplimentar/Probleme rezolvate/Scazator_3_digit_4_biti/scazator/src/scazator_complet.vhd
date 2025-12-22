library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity scazator is
	port(a, b, cin: in std_logic;
	rez, cout: out std_logic);
end entity;

architecture arh_scazator of scazator is
begin
	rez <= a xor b xor cin;
	cout <= ((not a) and b) or (cin and (not a)) or (cin and b);	
end architecture;
