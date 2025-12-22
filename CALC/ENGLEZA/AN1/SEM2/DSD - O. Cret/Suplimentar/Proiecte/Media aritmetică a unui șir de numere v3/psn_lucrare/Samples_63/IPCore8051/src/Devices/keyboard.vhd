--
--  File: keyboard.vhd
--  created by Design Wizard: 04/06/99 13:48:02
--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {keyboard} architecture {keyboard}}

library IEEE;
use IEEE.std_logic_1164.all;

entity keyboard is
    port (
        Key_0: in  STD_LOGIC;
        Key_1: in  STD_LOGIC;
        Key_2: in  STD_LOGIC;
        Key_3: in  STD_LOGIC;
        Key_4: in  STD_LOGIC;
        Key_5: in  STD_LOGIC;
        Key_6: in  STD_LOGIC;
        Key_7: in  STD_LOGIC;
        Key_8: in  STD_LOGIC;
        Key_9: in  STD_LOGIC;
		RESET: in  STD_LOGIC;
		ACKA:  in  STD_LOGIC;
        INTA:  out STD_LOGIC;
		CODE:  out STD_LOGIC_VECTOR (3 downto 0)
    );
end keyboard;

--}} End of automatically maintained section

architecture keyboard of keyboard is
signal INT: std_logic;
begin
  -- <<enter your statements here>>
process(Key_0,Key_1,Key_2,Key_3,Key_4,Key_5,Key_6,Key_7,Key_8,Key_9,Key_0, ACKA, RESET)
begin
	if(RESET='1') then
		INT<='1';
		CODE<="0000";
	else
		if(INT='1' and (ACKA='1' or ACKA='H')) then
			if(Key_0='1')	then
				CODE<="0000";
				INT<='0';
			elsif(Key_1='1') then
				CODE<="0001";
				INT<='0';
			elsif(Key_2='1') then
				CODE<="0010";
				INT<='0';
			elsif(Key_3='1') then
				CODE<="0011";
				INT<='0';
			elsif(Key_4='1') then
				CODE<="0100";
				INT<='0';
			elsif(Key_5='1') then
				CODE<="0101";
				INT<='0';
			elsif(Key_6='1') then
				CODE<="0110";
				INT<='0';
			elsif(Key_7='1') then
				CODE<="0111";
				INT<='0';
			elsif(Key_8='1') then
				CODE<="1000";	
				INT<='0';
			elsif(Key_9='1') then
				CODE<="1001";
				INT<='0';
			else
				INT<='1';
			end if;
		elsif(INT='0' and ACKA='0') then
			INT<='1';
		end if;
	end if;
end process;

INTA<=INT;
end keyboard;
