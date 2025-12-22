library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity raddertree is
   generic (h, i, nb, sh : natural) ; --h: bit width in, i : bit width out, nb : nb adders, sh : shift ammount
   port ( x : in std_logic_vector(2*h*nb-1 downto 0) ; -- 2 std_logic par bit * bit width * number of value to add
   y : out std_logic_vector(2*i*nb/2-1 downto 0)) ; -- same as x except that there is one more bit par value and half the value to add
end entity raddertree ;

architecture multi of raddertree is
component raddershift is
    generic (h, sh : natural) ; -- size of input in bit, sh : number of bit shifted
    Port ( input0,input1 : in  std_logic_vector (2*h-1 downto 0);
           output : out std_logic_vector (2*(h+sh)+1 downto 0));
end component raddershift;
begin
   
   adders: for num in 0 to nb/2-1 generate
       addshift : entity work.raddershift generic map ( h=> h, sh => sh)
          port map ( input0 => x ( 2*(2*num*h+h) -1 downto 2*2*num*h), input1 => x( 2*((2*num+1)*h+h)-1 downto 2*(2*num+1)*h) , output => y(num*2*i+2*i -1 downto num*2*i) );
    end generate;
   
end architecture multi ;