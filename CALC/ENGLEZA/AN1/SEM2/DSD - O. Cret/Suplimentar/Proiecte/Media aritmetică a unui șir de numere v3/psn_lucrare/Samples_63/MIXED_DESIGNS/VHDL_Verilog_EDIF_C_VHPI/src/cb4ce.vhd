library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;


entity CB4CE is
  port (C   :in  STD_LOGIC;
        CLR :in  STD_LOGIC;
        Q0  :out STD_LOGIC;
        Q1  :out STD_LOGIC;
        Q2  :out STD_LOGIC;
        Q3  :out STD_LOGIC);
end entity CB4CE;

architecture CB4CE of CB4CE is
    signal S: UNSIGNED (3 downto 0);
begin
  process (C,CLR)
  begin
    if To_X01(CLR)='1' then
      S <="0000";
    else
      if RISING_EDGE(C) then
        S<=S+"0001";
      end if;
    end if;
  end process;
    Q0 <= S(0);
    Q1 <= S(1);
    Q2 <= S(2);
    Q3 <= S(3);
	
end architecture CB4CE;
