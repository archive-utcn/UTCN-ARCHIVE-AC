library IEEE;

use ieee.std_logic_unsigned.all;

use ieee.std_logic_1164.all;


entity memrom is 
	
port (A: in std_logic_vector (2 downto 0);

	CS: in std_logic;

	D: out std_logic_vector (3 downto 0));
 
end memrom;
	

architecture comp_rom of memrom is

type mem is array (7 downto 0) of std_logic_vector (3 downto 0);

constant ROM : mem := (
"1010",
"0101",
"1110",
"0110",
"0010",
"0111",
"1100",
"1111");
 
  begin

process (cs,a) is
begin
	if cs='1' then

		d<=ROM(conv_integer(a));
	
else
		d<="ZZZZ";

	end if;

end process;

end comp_rom;	