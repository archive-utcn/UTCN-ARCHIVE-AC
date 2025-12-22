library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity poarta_or is
port (A: in std_logic;
B: in std_logic;
Q: out std_logic);
end poarta_or;

architecture arh of poarta_or is
signal Q_not: std_logic;
begin
 Q_not<=A or B;
 Q<=Q_not;
end arh;
