library ieee;
use ieee.std_logic_1164.all;

entity rotate_seq is 
	port ( 
	
end rotate_seq;

architecture arh of rotate_seq is

	component shift_register is		 
		generic ( n: integer := 7);
		port ( clock, reset, din :  in std_logic;
		q : out std_logic_vector (n downto 1) );
	end component shift_register;	
	
	
	
