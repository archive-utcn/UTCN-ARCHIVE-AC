library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity poarta_nu is 
	port(A: in STD_LOGIC;
	B: out STD_LOGIC);
end poarta_nu;

architecture nu of poarta_nu is
begin 
	B<=not(A);
end nu;
    