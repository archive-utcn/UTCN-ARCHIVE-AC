library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity rmul is
    generic (h : natural) ; --2**h bit width
    Port ( input0,input1 : in  std_logic_vector (2*2**h-1 downto 0);
           output : out std_logic_vector (2*(2*2**h+h-1)-1 downto 0);
           over : out std_logic); -- overflow
end rmul;

architecture combin of rmul is
    
constant wd : integer := 2**h;

component raddertree is
   generic (h, i, nb, sh : natural) ; --h: bit width in, i : bit width out, nb : nb adders, sh : shift ammount
   port ( x : in std_logic_vector(2*h*nb-1 downto 0) ; -- 2 std_logic par bit * bit width * number of value to add
   y : out std_logic_vector(2*i*nb/2-1 downto 0)) ; -- same as x except that there is one more bit par value and half the value to add
end component raddertree ;

type rvect is array ( natural range <> ) of std_logic_vector (2*wd*wd-1 downto 0);
type vect is array ( natural range <> ) of std_logic_vector (wd-1 downto 0);

signal negatives, values : vect (wd-1 downto 0);
signal partials : std_logic_vector ( 2*wd*wd-1 downto 0);
signal treecut : rvect (h downto 0);
begin
    adders: for i in 0 to wd-1 generate
       numbers: for j in 0 to wd-1 generate
       -- TODO: check if this is correctly optimized
          values(i)(j) <= not((input0(2*i) xor input0(2*i+1)) or (input1(2*j) xor input1(2*j+1)));
          negatives(i)(j) <= input0(2*i) xor input1(2*j);
          with std_logic_vector'(negatives(i)(j), values(i)(j)) select
          partials(2*i*wd+2*j+1 downto 2*i*wd+2*j) <= b"00" when "11",
                                                                                b"11" when "01",
                                                                                b"01" when others;
          --end select;
      end generate;
  end generate;
  
treecut(0) <= partials;

  addtree: for i in 0 to h-1 generate
     myaddertree: entity work.raddertree generic map (h => wd+2**i+i-1, i => wd+2**(i+1)+i, nb => wd/2**i, sh => 2**i)
        port map ( x => treecut(i)(2*(wd+2**i+i-1)*wd/2**i-1 downto 0),  y => treecut(i+1)(2*(wd+2**(i+1)+i)*wd/2**(i+1)-1 downto 0));
    end generate;
    
    output <= treecut(h)(2*(2*2**h+h-1)-1 downto 0);
    
end architecture;