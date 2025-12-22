library ieee;		   
use ieee.std_logic_unsigned.all;
use ieee.std_logic_Arith.all;
use ieee.std_logic_1164.all;

entity sum is
	generic(n: integer:= 3);
	port(a,b:  in std_logic_vector( n-1 downto 0);
	cin: in std_logic;
	sum: out std_logic_Vector(n-1 downto 0);
	cout: out std_logic);
end sum;

architecture arh of sum is

signal extended_sum: std_logic_VEctor( n downto 0);

begin
	cout<=extended_Sum(n);
	sum<=extended_sum(n-1 downto 0);
	
	extended_sum<= ('0'&a) + ('0'&b) + cin;
end architecture arh;
	