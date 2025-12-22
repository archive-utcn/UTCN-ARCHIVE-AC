--
--  File: ram.vhd
--  created by Design Wizard: 04/07/99 15:44:30
--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ram} architecture {ram}}

library IEEE;
use IEEE.std_logic_1164.all;

entity ram is
	generic(AddSize: integer:=4);
	port (
        nRD: in STD_LOGIC;
        nWR: in STD_LOGIC;
        nCS: in STD_LOGIC;
        DATA: inout STD_LOGIC_VECTOR (7 downto 0);
        ADDRESS: in STD_LOGIC_VECTOR (AddSize-1 downto 0)
    );
end ram;

--}} End of automatically maintained section

architecture ram of ram is

type RamType is array(0 to 2**AddSize) of bit_vector(7 downto 0);

function std2int(inp: std_logic_vector) return integer is
variable otp: integer:=0;
begin

	for i in 0 to (inp'length-1) loop
		if(inp(i)='1' or inp(i)='H') then
			otp:=otp+2**i;
		end if;
 	end loop;

	return otp;
end function;

signal RAM: RamType;
begin
  -- <<enter your statements here>>
bus_cntr:
	process(nCS, nRD, nWR, DATA, ADDRESS, RAM)
	begin
		if(nCS='0') then
			if(nRD='0') then
				DATA<=To_StdLogicVector( RAM(std2int(ADDRESS)) );
			elsif(nWR='0') then
				RAM(std2int(ADDRESS))<= To_BitVector(DATA);
			else
				DATA<="ZZZZZZZZ";
			end if;
		else
			DATA<="ZZZZZZZZ";
		end if;
	end process;

end ram;
