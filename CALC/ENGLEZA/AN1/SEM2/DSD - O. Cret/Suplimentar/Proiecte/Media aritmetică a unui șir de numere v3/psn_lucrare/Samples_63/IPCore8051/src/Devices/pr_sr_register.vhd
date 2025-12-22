--
--  File: serial_register.vhd
--  created by Design Wizard: 04/09/99 15:59:17
--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {serial_register} architecture {serial_register}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pr_sr_register is
    port (
        nWRS:  in STD_LOGIC;
        TXC:  in STD_LOGIC;
		RESET: in STD_LOGIC;
        DATAS: in STD_LOGIC_VECTOR (7 downto 0);
        INT:  out STD_LOGIC;
		BUSY: out STD_LOGIC;
        TXD:  out STD_LOGIC
    );
end pr_sr_register;

--}} End of automatically maintained section

architecture pr_sr_register of pr_sr_register is
signal REG: STD_LOGIC_VECTOR(7 downto 0);
signal BUSY_INT: STD_LOGIC;
begin
  -- <<enter your statements here>>

BUSY<=BUSY_INT;

write:
	process(RESET, nWRS)
	begin
		if(RESET='1') then
			REG<="00000000";
		elsif(nWRS='1' and nWRS'EVENT) then
			if(BUSY_INT='0') then
				REG<=DATAS;
			else
				REG<=REG;
			end if;
		end if;
	end process;

read:
	process(RESET, TXC)
	variable cnt: unsigned(0 to 2);
	begin
		if(RESET='1') then
			TXD<='1';
			BUSY_INT<='0';
			cnt:="000";
		elsif(TXC'event and TXC='0') then
			TXD<=REG(To_Integer(cnt));
			if(cnt=7) then
				cnt:="000";
				BUSY_INT<='0';
			else
				cnt:=cnt + 1;
				BUSY_INT<='1';
			end if;
		end if;
	end process;

intr_ctr:
	process(RESET, nWRS, BUSY_INT)
	begin
	if(RESET='1' or BUSY_INT='1') then
		INT<='1';
	elsif(nWRS='1' and nWRS'event) then
		INT<='0';
	end if;
	end process;
	
end pr_sr_register;
