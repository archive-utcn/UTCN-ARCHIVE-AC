library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity alu is
	port( a,b: in std_logic_vector(7 downto 0);
	cin : in std_logic;
	sel: in std_logic_vector(2 downto 0);
	o: out std_logic_vector( 7 downto 0);
	cout: out std_logic);
end alu;

architecture arh of alu is
begin
	process(a,b,sel)
	variable x,y,z,t: std_logic_vector( 8 downto 0);
	variable h: std_logic_Vector (15 downto 0);
	begin
		case sel is
			when "000" =>
				z:="000000000";
				z(0):=cin;	  
				x( 7 downto 0):= a;
				x(8):='0';
				y( 7 downto 0):= b;
				y(8):='0';
				t := x+y+z;
				o<=t( 7 downto 0);
				cout<=t(8);
			
			when "001" =>
				z:="000000000";
				z(0):=cin;	  
				x( 7 downto 0):= a;
				x(8):='1';
				y( 7 downto 0):= b;
				y(8):='0';
				t := x-y-z;
				o<=t( 7 downto 0);
				cout<=not t(8);
				
			when "010" =>
			h:= a*b;
			o<=h( 7 downto 0);
			
			when "011" => null;
			
			when "100" =>
			o<=a and b;
			
			when "101" =>
			o<= a or b;
			
			when "110" =>
			o<= not a;
			
			when others => o<= a xor b;
			
		end case;
	end process;
	end architecture arh;
			
		
			