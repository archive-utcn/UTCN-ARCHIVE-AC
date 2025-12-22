--
--  File: Latch.vhd
--  created by Design Wizard: 04/06/99 15:13:04
--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Latch} architecture {Latch}}

library IEEE;
use IEEE.std_logic_1164.all;

entity Latch is
    port (
        INP:  in  STD_LOGIC_VECTOR (7 downto 0);
        OUTP: out STD_LOGIC_VECTOR (7 downto 0);
        CLK:  in  STD_LOGIC
    );
end Latch;

--}} End of automatically maintained section

architecture Latch of Latch is
begin
  -- <<enter your statements here>>
 process(CLK, INP)
 begin
	if(CLK='1') then
		OUTP<=INP;
	end if;
 end process;
 
end Latch;
