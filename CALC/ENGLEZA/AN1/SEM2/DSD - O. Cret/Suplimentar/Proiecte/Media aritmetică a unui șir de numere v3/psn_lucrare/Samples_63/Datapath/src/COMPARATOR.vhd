--**********************************************************************--
-- file : e:\my designs\datapath\src\COMPARATOR.vhd
-- created Wed Feb 10 14:23:01 1999
-- from : D:\TEMP\tmp2CC.tmp
-- by ITF2VHD generator version 1.0
--**********************************************************************--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {COMPARATOR} architecture {COMPARATOR}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COMPARATOR is
	 generic(
		S : NATURAL := 15
	    );
	 port(
		 -- OUT --
		 D0_GT_D1 : out STD_LOGIC;
		 -- IN --
		 D_1 : in STD_LOGIC_VECTOR(S downto 0);
		 D_0 : in STD_LOGIC_VECTOR(S downto 0)
	     );
end COMPARATOR;

--}} End of automatically maintained section

library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.all;

architecture COMPARATOR of COMPARATOR is
begin

	 -- enter your statements here --	 
	 D0_GT_D1 <= '1' when (D_0 >= D_1) else '0';
end COMPARATOR;

