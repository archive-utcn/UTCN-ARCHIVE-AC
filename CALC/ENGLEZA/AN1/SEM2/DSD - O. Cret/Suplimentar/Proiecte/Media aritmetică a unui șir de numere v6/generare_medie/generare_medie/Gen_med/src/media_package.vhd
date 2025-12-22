 library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package media_package is
	type memorie is array (15 downto 0) of unsigned(11 downto 0);	
	type numere is array (15 downto 0) of std_logic_vector(7 downto 0);	 
	type sume is array (3 downto 0) of std_logic_vector(7 downto 0);
end package	;
