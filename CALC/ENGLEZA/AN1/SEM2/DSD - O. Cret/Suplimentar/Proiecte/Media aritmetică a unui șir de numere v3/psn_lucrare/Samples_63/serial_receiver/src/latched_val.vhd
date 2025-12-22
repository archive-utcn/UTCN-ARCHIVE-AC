library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity latched_val is
  generic
  (
    dw : integer := 9
  );
  port
  (
    load  : in std_logic;
    clr   : in std_logic;
    di    : in std_logic_vector(dw+1 downto 0);
    do    : out std_logic_vector(dw-1 downto 0)
  );
end latched_val;

architecture rtl of latched_val is

begin

  process (clr, load)
    --synopsys translate_off
    variable l : line;
    --synopsys translate_on
  begin

    if clr = '1' then
      do <= (others => '0');
    elsif rising_edge(load) then
      do <= di(di'left-1 downto di'right+1);
      --synopsys translate_off
      write(l,character'val(CONV_INTEGER(di(di'left-1 downto di'right+1))));
      writeline(output,l);
      --synopsys translate_on
    end if;

  end process;

end architecture;