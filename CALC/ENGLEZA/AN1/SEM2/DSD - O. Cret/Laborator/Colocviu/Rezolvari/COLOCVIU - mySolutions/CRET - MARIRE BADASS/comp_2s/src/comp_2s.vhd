library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity comp is
	port(a,b: in std_logic_vector(4 downto 0);
	f1,f2,f3: out std_logic);
end comp;

architecture arh of comp is	

begin
	
	process(a,b)
	
	variable x,y: std_logic_vector(3 downto 0);
	
	begin
		
		if a(4)='1' and b(4)='0' then f1<='1';f2<='0';f3<='0';
		else
			
			if a(4)='0' and b(4)='1' then f1<='0';f2<='0';f3<='1';
			else
					    
				if a(4)='0' and b(4)='0' then
					f1<= (not a(3) and b(3)) or ((a(3) xnor b(3)) and ( not (a(2)) and b(2))) or  ((a(3) xnor b(3)) and ( a(2) xnor b(2)) and( not (a(1)) and b(1))) or ((a(3) xnor b(3)) and (a(2) xnor b(2)) and (a(1) xnor b(1)) and ( not (a(0)) and b(0))); -- a < b 
					f2<=( a(3) xnor b(3)) and ( a(2) xnor b(2)) and ( a(1) xnor b(1)) and ( a(0) xnor b(0)); -- a = b
					f3<= (not b(3) and a(3)) or ((b(3) xnor a(3)) and ( not (b(2)) and a(2))) or  ((b(3) xnor a(3)) and ( b(2) xnor a(2)) and( not (b(1)) and a(1))) or ((b(3) xnor a(3)) and (b(2) xnor a(2)) and (b(1) xnor a(1)) and ( not (b(0)) and a(0))); -- a > b	
				else
					if a(4)='1' and b(4)='1'
						then
						x:=not(a(3)) & not(a(2)) & not(a(1)) & not(a(0)) + "0001";
						y:=not(b(3)) & not(b(2)) & not(b(1)) & not(b(0)) + "0001";
						if (conv_integer(x) < conv_integer(y)) then f1<='0';f2<='0';f3<='1';
							elsif  (conv_integer(x) = conv_integer(y)) then f1<='0';f2<='1';f3<='0';
							else  f1<='1';f2<='0';f3<='0';
						end if;		
					end if;	
				end if;
			end if;
		end if;
	end process;
end architecture arh;