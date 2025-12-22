------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity poarta_sau is
port (A: in std_logic;
B: in std_logic;
Q: out std_logic);
end poarta_sau;

architecture poarta_sau_arh of poarta_sau is
signal Q_not: std_logic;
begin
 Q_not<=A or B;
 Q<=Q_not;
end poarta_sau_arh;

