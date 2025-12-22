library IEEE;
use ieee.std_logic_1164.all; 

entity Receipt is 
port(OPT: in std_logic; 
	 IESIRE_CHIT: out std_logic; 
     finish: out std_logic); 
end Receipt;

architecture ARCH_Receipt of Receipt is 
begin 
	process(OPT) 
		begin 
				if OPT='0' then IESIRE_CHIT<='0'; finish<='1'; 
				  elsif OPT='1' then IESIRE_CHIT<='1'; finish<='1';
					end if;  
				end process ; 
end ARCH_Receipt;