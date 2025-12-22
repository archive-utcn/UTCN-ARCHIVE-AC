library ieee;
use ieee.std_logic_1164.all;

entity sum2bant is
	port(
	X 	: in std_logic_vector(1 downto 0); 
	Y 	: in std_logic_vector(1 downto 0);
	Tin	: in std_logic;
	S	: out std_logic_vector(1 downto 0);
	P	: out std_logic;
	G	: out std_logic);
end sum2bant;

architecture sum2bant of sum2bant is
signal T1 : std_logic := '0';
begin
	S(0) <= X(0) xor Y(0) xor Tin;
	T1	 <= (X(0) and Y(0)) or ((X(0) or Y(0)) and Tin);
	S(1) <= X(1) xor Y(1) xor T1;
	
	P <= (X(1) or Y(1)) and (X(0) or Y(0));
	G <= (X(1) and Y(1)) or (X(0) and Y(0) and (X(1) or Y(1)));
end sum2bant;