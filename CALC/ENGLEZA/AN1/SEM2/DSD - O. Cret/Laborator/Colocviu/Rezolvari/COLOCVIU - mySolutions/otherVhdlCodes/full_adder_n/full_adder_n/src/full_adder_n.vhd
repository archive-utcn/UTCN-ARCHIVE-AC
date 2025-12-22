library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity full_adder_n is
    generic (N: integer:=4);
    port(A,B: in std_logic_vector (N-1 downto 0);
    CIN:in std_logic;
    SUM: out std_logic_vector (N-1 downto 0);
    COUT:out std_logic);
end full_adder_n;

architecture arh of full_adder_n is
signal Extended_SUM: std_logic_vector (N downto 0);

begin
    COUT<=Extended_SUM(N);
    SUM<=Extended_SUM(N-1 downto 0);

    Extended_SUM <= ('0' & A) + ('0' & B) + CIN;

end arh;
