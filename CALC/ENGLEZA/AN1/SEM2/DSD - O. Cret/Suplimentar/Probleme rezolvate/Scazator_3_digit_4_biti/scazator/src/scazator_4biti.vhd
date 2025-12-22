library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity scazator4biti is
	port(a, b: in std_logic_vector(3 downto 0);
	rez: out std_logic_vector(3 downto 0);
	borr: out std_logic;
	cin: in std_logic);
end entity;

architecture arh_scazator4biti of scazator4biti is
component scazator is
	port(a, b, cin: in std_logic;
	rez, cout: out std_logic);
end component;
signal cout: std_logic_vector(2 downto 0);
begin
	C1: scazator port map(a(0), b(0), cin, rez(0), cout(0));
	C2: scazator port map(a(1), b(1), cout(0), rez(1), cout(1));
 	C3: scazator port map(a(2), b(2), cout(1), rez(2), cout(2));
	C4: scazator port map(a(3), b(3), cout(2), rez(3), borr);
end architecture;
