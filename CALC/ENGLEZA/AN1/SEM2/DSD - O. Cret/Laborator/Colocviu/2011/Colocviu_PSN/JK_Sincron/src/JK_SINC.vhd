library IEEE;
use IEEE.std_logic_1164.all; 

entity JK_Sinc is
	port (R,S,K,J: in bit;
	Q:inout bit);
	--Q_neg: inout bit);
end entity;

architecture ARH_COMP of JK_Sinc is
signal CLK: bit;
begin
Clock: process(CLK)
begin
	CLK<=not CLK after 5 ns;
end process;
JK: process(R,S,J,K,CLK) 
--variable A,B: bit;
begin	 
	if(CLK'event and CLK='1') then
	if(R='1' and S='1') then
	if(J='0' and K='0') then Q<=Q;
	elsif(J='0' and K='1') then Q<='0';
	elsif(J='1' and K='0') then Q<='1';
	elsif(J='1' and K='1') then Q<=not Q;
	end if;	
	end if;						  
	end if;
end process;
end architecture;

	