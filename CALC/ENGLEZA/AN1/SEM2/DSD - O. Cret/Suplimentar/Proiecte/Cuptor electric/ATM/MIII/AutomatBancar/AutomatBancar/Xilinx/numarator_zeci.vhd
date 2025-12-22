library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity numarator_zeci is
	port( clk: in std_logic;
	CL: in std_logic;
	zeci: out std_logic_vector (3 downto 0);
	enable : in std_logic);
end entity;
architecture arh of numarator_zeci is   
 signal Q: std_logic_vector(3 downto 0);
begin
    process(CLK, enable, CL)
    begin
	if CL = '1' then
 	    Q<=Q-Q;
	elsif (CLK='1' and CLK'EVENT) then
	    if enable = '1' then
		Q <= Q + 1;
		else Q<="ZZZZ";
	    end if;
		 	if Q(0)='1' and Q(3)='1' then Q<="0000";
		end if;
		
	end if;
    end process;	
    zeci <=Q;
		end architecture;