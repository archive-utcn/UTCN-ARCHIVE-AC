--**********************************************************************--
-- file : e:\my designs\datapath\src\REG.vhd
-- created Wed Feb 10 14:05:32 1999
-- from : D:\TEMP\tmp2A4.tmp
-- by ITF2VHD generator version 1.0
--**********************************************************************--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {REG} architecture {REG}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REG is
	 generic(
		S : NATURAL := 15
	    );
	 port(
		 -- OUT --
		 DOUT : out STD_LOGIC_VECTOR(S downto 0);
		 -- IN --
		 RESET : in STD_LOGIC;
		 LOAD : in STD_LOGIC;
		 DIN : in STD_LOGIC_VECTOR(S downto 0);
		 CLK : in STD_LOGIC
	     );
end REG;

--}} End of automatically maintained section

architecture REG of REG is
begin		 
	process (CLK,RESET)
	begin	
		if RESET = '1' then	  
			DOUT <= (others => '0');				
		else
			if CLK'event and CLK = '1' then		  	 
				if LOAD = '1' then
					DOUT <= DIN;
				end if;
			end if;
		end if;
	end process;
end REG;
