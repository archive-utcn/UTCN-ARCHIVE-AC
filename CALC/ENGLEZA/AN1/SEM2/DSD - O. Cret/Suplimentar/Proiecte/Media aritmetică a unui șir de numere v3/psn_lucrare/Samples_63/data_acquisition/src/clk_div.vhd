library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
  generic
  (
    clk_ratio : positive := 4
  );
  port
  (
    clk_in  : in std_logic;
    clk_out : out std_logic
  );
end entity;


architecture behavior of clk_div is
begin

  process
  
  	variable clk_intern : std_logic := '0';
  
  begin

    clk_out <= clk_intern;

    for i in 2 to clk_ratio-1 loop
      wait until rising_edge(clk_in);
    end loop;

    clk_intern := not clk_intern;

  end process;

end architecture;