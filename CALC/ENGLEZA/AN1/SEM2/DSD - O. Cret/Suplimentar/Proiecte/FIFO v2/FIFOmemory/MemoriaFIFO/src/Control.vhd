library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;	

entity control is
	port ( PUSH,POP,FULL,EMPTY : in std_logic;
	CE_WR, CE_RD: out std_logic);
end entity;

architecture arh_control of control is 

signal s:std_logic;

begin
	
process(POP,PUSH,EMPTY,FULL,s)
	begin
			
   CE_WR<=PUSH and (not(FULL));
   s<=POP and (not(PUSH));
   CE_RD<=s and (not(EMPTY));
	end process;
   
end arh_control;