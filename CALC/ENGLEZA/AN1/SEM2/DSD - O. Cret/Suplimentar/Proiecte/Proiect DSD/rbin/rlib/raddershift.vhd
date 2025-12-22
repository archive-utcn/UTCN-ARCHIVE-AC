library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity raddershift is
    generic (h, sh : natural) ; -- size of input in bit, sh : number of bit shifted
    Port ( input0,input1 : in  std_logic_vector (2*h-1 downto 0);
           output : out std_logic_vector (2*(h+sh)+1 downto 0));
end raddershift;


architecture combinatoire of raddershift is
component radder
    generic (h : natural);
    Port ( input0,input1 : in  std_logic_vector (2*h-1 downto 0);
           output : out std_logic_vector (2*h+1 downto 0));
end component;
signal add1, add2 : std_logic_vector (2*(h+sh)-1 downto 0);
begin
    zero1: for i in 0 to sh-1 generate
       -- set to zero
       add2(2*i) <= '1';
       add2(2*i+1) <= '0';
   end generate;
   zero2: for i in h to (h+sh-1) generate
      --set to zero
       add1(2*i) <= '1';
       add1(2*i+1) <= '0';
   end generate;
   
   add1( 2*h-1 downto 0) <= input0;
   add2( 2*(h+sh)-1 downto 2*sh) <= input1;
   
   myadder: entity work.radder(cased) generic map (h=> h + sh)
      port map ( input0 => add1, input1 => add2, output => output);

end architecture combinatoire;