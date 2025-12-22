library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity alu is
	port( a,b: in std_logic;
	sel: in std_logic_vector (2 downto 0);
	c,d: out std_logic);
end alu;

architecture arh of alu is
begin
	process(a,b,sel)
	begin
		if(sel="000") then
			c<= a and b;
			d<= a xor b;
		
		elsif sel="001" then 
			c<=not a and b;
			d<= a xor b;
	
		elsif sel = "010"  then
			c<='0';
			d<=a and b;
			
		elsif sel="011" then
			if ( b='0')
				then c <= 'U';
				d <= 'U';
			else
				c<='0';
				d<=a;
			end if;
		
		elsif sel="100" then 
			c<='-';
			d<= a and b;
			
			
		elsif sel="101" then
			c<= not a;
			d<= not b;
		
		elsif sel="110" then
			c<='-';
			d<= a or b;
			
		else c<='-';
			d<= a xor b;
		end if;
		end process;
		end architecture arh;
		
		
		
		