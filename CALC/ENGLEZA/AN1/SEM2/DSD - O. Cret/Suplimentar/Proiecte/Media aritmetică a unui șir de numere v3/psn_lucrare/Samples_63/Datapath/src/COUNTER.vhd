--**********************************************************************--
-- file : e:\my designs\data_path\src\COUNTER.vhd
-- created Thu Feb 11 11:47:18 1999
-- from : D:\TEMP\tmp2B7.tmp
-- by ITF2VHD generator version 1.0
--**********************************************************************--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {COUNTER} architecture {COUNTER}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COUNTER is
	 port(
		 -- OUT --
		 ZERO : out STD_LOGIC;
		 -- IN --
		 CLK : in STD_LOGIC;
		 COUNT : in STD_LOGIC_VECTOR(3 downto 0);
		 LOAD_COUNT : in STD_LOGIC;
		 RESET : in STD_LOGIC
	     );
end COUNTER;

--}} End of automatically maintained section
library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.all;

architecture COUNTER of COUNTER is

	signal Q : STD_LOGIC_VECTOR(3 downto 0);	
	signal EMPTY : STD_LOGIC;	
	
begin
	process (CLK, RESET)
	begin		
		if RESET='1' then
			Q <= (others => '0');
			EMPTY <= '0';
		else	   
			if CLK'event and CLK='1' then
				if LOAD_COUNT = '1' then
					Q <= COUNT;
					EMPTY <= '0';
				else
					if Q = 0 then	 
						EMPTY <= '1';
					else			 
						Q <= Q - 1;
					end if;
				end if;	 
			end if;
		end if;
	end process;
	ZERO <= EMPTY;
	
end COUNTER;
