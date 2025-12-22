library IEEE;
use IEEE.std_logic_1164.all;

entity clk_gen is
  port
  (
    clk : out std_logic
  );
end entity;


architecture behavior of  clk_gen is
  constant clk_period  : time := 10 ns;
  constant half_period : time := clk_period/2;
begin

  process
  begin
    clk <= '0';
    wait for half_period;
    clk <= '1';
    wait for half_period;
  end process;

end architecture behavior;
