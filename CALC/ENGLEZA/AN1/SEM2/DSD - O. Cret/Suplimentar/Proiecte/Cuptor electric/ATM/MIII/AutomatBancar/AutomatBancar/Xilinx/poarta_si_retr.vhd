------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity poarta_si_retr is
port (A: in std_logic;
B: in std_logic;
Q: out std_logic);
end poarta_si_retr;

architecture poarta_si_retr_arh of poarta_si_retr is
signal Q_not: std_logic;
begin
 Q_not<=A and B;
 Q<=Q_not;
end poarta_si_retr_arh;
