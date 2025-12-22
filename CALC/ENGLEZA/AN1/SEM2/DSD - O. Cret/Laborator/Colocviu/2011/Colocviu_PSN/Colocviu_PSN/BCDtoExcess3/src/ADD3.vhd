library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity ADD3 is
	port(A: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(3 downto 0):="0000");
end ADD3;

architecture ARH_ADD3 of ADD3 is
begin 
	S<=A+"0011";
end architecture ARH_ADD3;
