library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity poarta_si is
	port( A,B,C : in STD_LOGIC;
	Y: out STD_LOGIC);
end poarta_si;

architecture si of poarta_si is
begin 
	Y<= A and B and C;
end si;