library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity onerconv is
    generic (h : natural := 32) ; -- size of input in bit
    Port ( input : in  std_logic_vector (h-1 downto 0);
           output : out std_logic_vector (2*h-1 downto 0));
end onerconv;

architecture std of onerconv is
begin
    through: for i in 0 to h-1 generate
       output(2*i) <= input(i);
       output(2*i+1) <= '1';
   end generate;
end architecture;