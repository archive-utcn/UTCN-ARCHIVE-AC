library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity synchronizer is					  
	 port(
		 reset : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 inp : in STD_LOGIC;
		 outp : out STD_LOGIC
	     );
end synchronizer;

architecture synchronizer_arch of synchronizer is
signal int : STD_LOGIC;
begin

process (reset, clk)
  begin

    if reset = '1' then
      outp <= '0';
      int <= '0';
    elsif rising_edge(clk) then
      int <= inp;
      outp <= int;
    end if;

  end process;
end synchronizer_arch;
