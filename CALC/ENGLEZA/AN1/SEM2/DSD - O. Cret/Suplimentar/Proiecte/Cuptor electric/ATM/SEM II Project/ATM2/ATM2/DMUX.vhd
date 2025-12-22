library ieee;
use ieee.std_logic_1164.all;

entity DMUX is
	port(OPT:in std_logic;
	RESET:in std_logic;
	S,RN:out std_logic);-- S=SOLD, RN=Retragere Numerar
end DMUX;

architecture Arh of DMUX is
begin
	proc: process(RESET,OPT)
	begin
			if OPT='0'  then S<='0'; RN<='1'; --Retragere Numerar 
				elsif OPT='1' then RN<='0'; S<='1';--Sold
		end if;
		if RESET='1' then
			S<='0'; RN<='0';
			end if;
	end process proc;
end Arh;
