--**********************************************************************--
-- file : e:\my designs\data_path\src\ADDSUB.vhd
-- created Wed Feb 10 13:59:52 1999
-- from : D:\TEMP\tmp287.tmp
-- by ITF2VHD generator version 1.0
--**********************************************************************--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ADDSUB} architecture {ADDSUB}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ADDSUB is
	 generic(
		S : NATURAL := 15
	    );
	 port(
		 -- OUT --
		 Q : out STD_LOGIC_VECTOR(S downto 0);
		 -- IN --
		 DATA_OUT : in STD_LOGIC_VECTOR(S downto 0);
		 DATA_IN : in STD_LOGIC_VECTOR(S downto 0);
		 ADD_SUB : in STD_LOGIC
	     );
end ADDSUB;

--}} End of automatically maintained section

library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.all;

architecture ADDSUB of ADDSUB is
begin

	 -- enter your statements here --
	 Q <= (DATA_IN + DATA_OUT) when ADD_SUB = '1' else (DATA_IN - DATA_OUT);
end ADDSUB;

