library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX_GENERIC is
	generic (nr_sel: integer := 2);
	port( x: in std_logic_vector((2**nr_sel-1 ) downto 0);
	sel: in std_logic_vector( nr_sel-1 downto 0);
	y: out std_logic);
end MUX_GENERIC;

architecture arh of MUX_GENERIC is
begin
	y<=x(conv_integer(sel));
end architecture arh;

--MS

library ieee;
use ieee.std_logic_1164.all;

entity MS_MUX_GENERIC is
end MS_MUX_GENERIC;

architecture arh of MS_MUX_GENERIC is

component MUX_GENERIC is
	generic (nr_sel: integer := 2);
	port( x: in std_logic_vector((2**nr_sel-1 ) downto 0);
	sel: in std_logic_vector( nr_sel-1 downto 0);
	y: out std_logic);
end component MUX_GENERIC;	   

constant nr_sel: integer:= 2;

signal x: std_logic_vector((2**nr_sel-1 ) downto 0);
signal sel: std_logic_vector(nr_sel-1 downto 0);
signal y: std_logic;

begin 
	UST: MUX_GENERIC port map(x=>x, sel=>sel,y=>y);
	STIMULI : process  
	begin
	x<="0101", "0110" after 20 ns, "1110" after 40 ns, "0001" after 60 ns, "0101" after 80 ns;
	sel<="00","10" after 20 ns,"11" after 40 ns,"01" after 60 ns,"01" after 80 ns;
	wait;
	end process;
end architecture arh;
