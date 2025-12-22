library ieee;
use ieee.std_logic_1164.all;

entity synchronizer is
  generic
  (
    dw : integer := 9
  );
  port
  (
    clk  : in std_logic;
    rst  : in std_logic;
    di   : in std_logic_vector(dw+1 downto 0);
    sync : out std_logic
  );
end synchronizer;

architecture rtl of synchronizer is
begin

  process (clk)
  begin

    if falling_edge(clk) then
      if rst='1' then
        sync <= '1';
      else
        sync <= di(di'left) and not(di(di'right));
      end if;
    end if;

  end process;

end architecture;