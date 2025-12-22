library ieee;
use ieee.std_logic_1164.all;

entity cod is
	port(a: in std_logic_vector (6 downto 0);
	b: in std_logic_vector (6 downto 0);
	c: in std_logic_vector (6 downto 0);
	d: in std_logic_vector (6 downto 0);
	an1,an2,an3,an4 : in std_logic_vector (3 downto 0);
	s1: in std_logic_vector (1 downto 0);
	y: out std_logic_vector( 6 downto 0);
	y1: out std_logic_vector (3 downto 0));
end entity;

architecture arh of cod is
begin
	process(s1)
	begin
		case s1 is
			when "00"=>
			y<=a; y1<=an1;
			when "01"=>y<=b; y1<=an2;
			when "10"=>y<=c; y1<=an3;
			when "11"=>y<=d; y1<=an4;
			when others=>y<="ZZZZZZZ"; y1<="ZZZZ";
		end case;
	end process;
end architecture;