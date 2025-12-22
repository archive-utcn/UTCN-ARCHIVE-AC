--library ieee;
--use ieee.std_logic_1164.all;
--
--entity dmux is
--	port ( inp : in bit;
--	s1,s0: in bit;
--	y: out bit_vector ( 3 downto 0));
--end dmux;			  
--
--
--architecture arh of dmux is
--begin
--	process (inp, s1, s0)
--	variable sel: bit_vector (1 downto 0);
--	begin
--		sel := s1&s0;
--		case sel is
--			when "00" => y(0) <= inp; y(1) <= '0';  y(2) <= '0'; y(3) <= '0';
--			when "01" => y(1) <= inp; y(0) <= '0';  y(2) <= '0'; y(3) <= '0';
--			when "10" => y(2) <= inp; y(0) <= '0';  y(1) <= '0'; y(3) <= '0';
--			when "11" => y(3) <= inp; y(1) <= '0';  y(2) <= '0'; y(0) <= '0';
--		end case;
--	end process;
--end arh;


library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity dmux_n is
	generic ( n: integer := 4);
	port ( input:  in std_logic;
	sel : in std_logic_vector ( n downto 1);
	output : out std_logic_vector( 2**n downto 1));
end dmux_n;

architecture arh of dmux_n is
begin
	generate_output: for i in 1 to (2**n) generate  
	output(i) <= input when (to_integer ( unsigned (sel) )) = i else '0';
	end generate generate_output;
end arh; 

