library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity scazator_3digit is
	port(a2, a1, a0, b2, b1, b0: in std_logic_vector(3 downto 0);
	rez2, rez1, rez0: out std_logic_vector(3 downto 0);
	cin: in std_logic;
	cout: out std_logic);
end entity;

architecture arh_scazator3digit of scazator_3digit is
component scazator4biti is
	port(a, b: in std_logic_vector(3 downto 0);
	rez: out std_logic_vector(3 downto 0);
	borr: out std_logic;
	cin: in std_logic);	
end component;
signal borr: std_logic_vector(1 downto 0);
begin
	unitati: scazator4biti port map(a0, b0, rez0, borr(0) ,cin);
	zeci: scazator4biti port map(a1, b1, rez1, borr(1), borr(0));
	sute: scazator4biti port map(a2, b2, rez2, cout, borr(1));
end architecture;
