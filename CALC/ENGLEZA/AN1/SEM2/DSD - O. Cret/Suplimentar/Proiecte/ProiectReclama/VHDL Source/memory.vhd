library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity letters_ROM is
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(7 downto 0));
end letters_ROM;

architecture letters_ROM_a of letters_ROM is
begin
	process(A)
	type memmap is array(0 to 7) of std_logic_vector(7 downto 0);
	variable mMap:memmap:=("11111111","10001110","10001000","10001001",
								  "10000001","10100100","10110001","10110000");	
	--memorie litere: [ ], [F], [A], [H], [O], [S], [C], [E]
	
	begin
		O<=mMap(CONV_INTEGER(A));
	end process;
end letters_ROM_a;	   

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_zero_ROM is
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(11 downto 0));
end anim_zero_ROM;

architecture anim_zero_ROM of anim_zero_ROM is
begin
	process(A)
	type memmap is array(0 to 7) of std_logic_vector(0 to 11);
	variable mMap:memmap:=("001010001011","001010001011","001010001011","001010001011"
								 ,"001010001011","001010001011","001010001011","001010001011");
	begin --mem. litere "de afisat" - sunt adresele letters_ROM, dub forma lit4,lit3,lit2,lit1 pe cate 3 biti
			O<=mMap(CONV_INTEGER(A));
	end process;
end anim_zero_ROM;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--FOR animation_one \/

entity anim_one_ROM is
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(11 downto 0));
end anim_one_ROM;

architecture anim_one_ROM_a of anim_one_ROM is
begin
	process(A)
	type memmap is array(0 to 7) of std_logic_vector(0 to 11);
	variable mMap:memmap:=("000000000000","000000000001","000000001010","000001010001",
								  "001010001011","010001011000","001011000000","011000000000");
	begin	--mem. litere "de afisat" - sunt adresele letters_ROM, dub forma lit4,lit3,lit2,lit1 pe cate 3 biti
			O<=mMap(CONV_INTEGER(A));
	end process;
end anim_one_ROM_a;	 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--FOR animation_two \/

entity anim_two_ROM is
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(11 downto 0));
end anim_two_ROM;

architecture anim_two_ROM_a of anim_two_ROM is
begin
	process(A)
	type memmap is array(0 to 7) of std_logic_vector(0 to 11);
	variable mMap:memmap:=("000000000000","001010001011","000000000000","001010001011",
								  "000000000000","001010001011","000000000000","001010001011");
	begin
			O<=mMap(CONV_INTEGER(A));
	end process;
end anim_two_ROM_a;	

--FOR animation_three \/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_three_ROM is
	port(A:in std_logic_vector(2 downto 0);
	O:out std_logic_vector(11 downto 0));
end entity;

architecture anim_three_ROM of anim_three_ROM is
begin
	process(A)
	type memmap is array(0 to 7) of std_logic_vector(0 to 11);
	variable mMap:memmap:=("001011000000","000000001010","001000001000","000010000011","001000000011","000010001000","001010001011","001010001011");
	begin
			O<=mMap(CONV_INTEGER(A));
	end process;
end architecture;

--FOR animation_four \/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_four_ROM is
	port(A:in std_logic_vector(4 downto 0);
	O:out std_logic_vector(11 downto 0));
end entity;	   

architecture anim_four_ROM of anim_four_ROM is
begin
	process(A)
	type memmap is array(0 to 19) of std_logic_vector(0 to 11);
	variable mMap:memmap:=("000000000000","000000000001","000000001000","000001000000","001000000000",
	"001000000010","001000010000","001010000000","001010000001","001010001000",
	"001010001011","000010001011","010000001011","000000001011","000001000011",
	"001000000011","000000000011","000000011000","000011000000","011000000000");
	begin
			O<=mMap(CONV_INTEGER(A));
	end process;
end architecture;

--FOR animation_five \/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity anim_five_ROM is
	port(A:in std_logic_vector(2 downto 0);
	O:out std_logic_vector(11 downto 0));
end entity;

architecture anim_five_ROM_a of anim_five_ROM is
begin
	process(A)
	type memmap is array(0 to 7) of std_logic_vector(0 to 11);
	variable mMap:memmap:=("001011110101","010111001100","011101010001","110010100011",
								  "001010100101","101110001111","011010100101","100001011110");
	begin	
			O<=mMap(CONV_INTEGER(A));
	end process;
end architecture;

--architecture anim_five_ROM of anim_five_ROM is
--begin
--	process(A)
--	variable x,y,z,t:integer range 0 to 7;
----	variable t:std_logic_vector (11 downto 0);
--	variable c:integer range 0 to 4;
--	begin				
--		
--		--if (A="111") then		  
----			c:=c+1;
----		end if;
----		if (c=0) then
----			x:=(x+1) mod 8;
----			y:=(y-1) mod 8;	  
----			z:=(z+3) mod 8;
----			t:=(t-5) mod 8;
----		end if;	
----		if (c=1) then
----			x:=1;
----			y:=(y-1) mod 8;	  
----			z:=(z+3) mod 8;
----			t:=(t-5) mod 8;
----		end if;
----		if (c=2) then
----			x:=1;
----			y:=2;	  
----			z:=(z+3) mod 8;
----			t:=(t-5) mod 8;
----		end if;	
----		if (c=3) then
----			x:=1;
----			y:=2;	  
----			z:=1;
----			t:=(t-5) mod 8;
----		end if;	
----		if (c=4) then
----			x:=1;
----			y:=2;	  
----			z:=1;
----			t:=3;
----		end if;	 
----		if (c=5) then
----			c:=0;
----		end if;	
----		O<=conv_std_logic_vector(x,3) & conv_std_logic_vector(y,3) & conv_std_logic_vector(z,3) & conv_std_logic_vector(t,3);
--	end process;
--end architecture;

--FOR animation_seven \/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity anim_seven_ROM is
	port(A:in std_logic;
		O:out std_logic_vector(11 downto 0));
end entity;

architecture anim_seven_ROM of anim_seven_ROM is
begin
	process(A)
	type memmap is array(0 to 1) of std_logic_vector(0 to 11);
	variable mMap:memmap:=("000000000000","001010001011");
	begin
			O<=mMap(CONV_INTEGER(A));
	end process;
end anim_seven_ROM;

		

		
		
