library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DMUX_GENERIC_1_LA_4 is
	generic (nr_sel:  integer:= 2);
	port( x: in std_logic;
	sel: in std_logic_vector(nr_sel-1 downto 0);
	y: out std_logic_vector(2**nr_sel-1 downto 0));
end DMUX_GENERIC_1_LA_4;

architecture arh of DMUX_GENERIC_1_LA_4 is
begin
	generate_output: for i in 0 to 2**nr_sel-1 generate
	y(i) <= x when conv_integer(sel) = i else '0';
	end generate generate_output;
end architecture arh;

--MS

library ieee;
use ieee.std_logic_1164.all;

entity MS_DMUX_GENERIC_1_LA_4 is
end MS_DMUX_GENERIC_1_LA_4;

architecture arh of MS_DMUX_GENERIC_1_LA_4 is

component DMUX_GENERIC_1_LA_4 is
	generic (nr_sel:  integer:= 2);
	port( x: in std_logic;
	sel: in std_logic_vector(nr_sel-1 downto 0);
	y: out std_logic_vector(2**nr_sel-1 downto 0));
end component DMUX_GENERIC_1_LA_4;

constant nr_sel: integer:= 2;

signal x: std_logic;
signal sel: std_logic_vector(nr_sel-1 downto 0);
signal y: std_logic_vector(2**nr_sel-1 downto 0);

begin
	UST: DMUX_GENERIC_1_LA_4 port map(x=>x,sel=>sel,y=>y);
	STIMULI: process
	begin
		x<='0','1' after 20 ns,'1' after 40 ns, '0' after 60 ns;
		sel<="11","00" after 20 ns,"01" after 40 ns, "11" after 60 ns;
		wait;
	end process;
end architecture arh;
