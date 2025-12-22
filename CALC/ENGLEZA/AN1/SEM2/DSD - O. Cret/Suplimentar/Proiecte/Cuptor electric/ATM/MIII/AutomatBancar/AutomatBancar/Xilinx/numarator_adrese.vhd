library	ieee;

use ieee.std_logic_1164.all;

use ieee.std_logic_arith.all;

use ieee.std_logic_unsigned.all;

entity numarator_adrese is

	port( clk: in std_logic;

	adrese: out std_logic_vector (2 downto 0));

end entity;

architecture ar of numarator_adrese is

signal temp: std_logic_vector (2 downto 0);


 begin 									   
	
process(clk)

	variable temp_var: std_logic_vector(2 downto 0):="000";

	begin 
		
if (clk='1') and (clk'event) then
		
			temp_var:=temp_var+1;
 
		end if;

		temp<=temp_var;

		end process;

		adrese<=temp;

		end architecture;