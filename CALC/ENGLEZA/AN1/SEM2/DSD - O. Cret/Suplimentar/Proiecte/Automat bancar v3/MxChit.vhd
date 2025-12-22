library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_chitanta is
port (A: in std_logic;
B: in std_logic;
S: in std_logic_vector (1 downto 0);
Q: out std_logic);
end mux_chitanta;

architecture arh of mux_chitanta is
begin
process(S)
begin
case S is
  when "00" => Q<=A;
  when "01" => Q<=B;
  when others => Q<='0';
  end case;
end process;
end arh;

