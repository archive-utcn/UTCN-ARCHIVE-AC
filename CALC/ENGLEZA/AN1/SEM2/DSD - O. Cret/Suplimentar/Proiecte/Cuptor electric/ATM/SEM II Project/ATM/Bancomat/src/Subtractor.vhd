library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity SUBTRACTOR is 
	port(A,B: in std_logic_vector(15 downto 0); 
	CLK: in std_logic;
	C: out std_logic_vector(15 downto 0));
end SUBTRACTOR; 

architecture ARCH of SUBTRACTOR is 
begin 
	process(CLK) 
	begin 
		if(CLK'EVENT and CLK='1') then 
			C <=STD_LOGIC_VECTOR(to_unsigned(conv_integer(A)-conv_integer(B),16));
			end if; 
	end process;
 end ARCH;