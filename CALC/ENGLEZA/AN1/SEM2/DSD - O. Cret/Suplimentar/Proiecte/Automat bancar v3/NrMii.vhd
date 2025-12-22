 library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity numaratorm is
	port (CLK: in std_logic;
	      enable: in std_logic;
			CL: in std_logic;
	      mii: out std_logic_vector(1 downto 0));
end numaratorm;

architecture arh of numaratorm is		 	  
 
   signal Q: std_logic_vector (1 downto 0);
begin
    process(CLK, enable, CL)
    begin
	if CL = '1' then
 	    Q<=Q-Q;
	elsif (CLK='1' and CLK'EVENT) then
	    if enable = '1' then
		Q <= Q + 1;
		else Q<="ZZ";
	    end if;
	end if;	 
	if Q(1)='1' then Q<="00";
	end if;
    end process;	
    mii <=Q;

end arh;