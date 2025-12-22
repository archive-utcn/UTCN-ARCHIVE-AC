library IEEE, SYNOPSYS;
use IEEE.STD_LOGIC_1164.all;
use SYNOPSYS.STD_LOGIC_UNSIGNED.all;

entity COUNTER is
  port (CLK    :in  STD_LOGIC;
        RESET  :in  STD_LOGIC;
        ENABLE :in  STD_LOGIC;
        LOAD   :in  STD_LOGIC;
        D      :in  STD_LOGIC_VECTOR (3 downto 0);
        Q      :out STD_LOGIC_VECTOR (3 downto 0));
end entity COUNTER;

architecture COUNTER_BEHAV of COUNTER is
begin
  process (CLK, RESET)
    variable QINT: STD_LOGIC_VECTOR (3 downto 0);
  begin
    if RESET='1' then  
      QINT:="0000"; 
    else
      if FALLING_EDGE(CLK) then
		if ENABLE='1' then
          if LOAD='1' then
      	    QINT:=D;
      	  else
            if QINT<15 then
              QINT:=QINT+1;
            else
              QINT:="0000";
            end if;
          end if;
		end if;
      end if;
    end if;
    Q<=QINT;
  end process;   
end architecture COUNTER_BEHAV;

