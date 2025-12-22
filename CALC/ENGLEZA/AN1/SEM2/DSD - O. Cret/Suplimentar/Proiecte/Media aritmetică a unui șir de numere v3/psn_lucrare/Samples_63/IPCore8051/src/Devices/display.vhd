--
--  File: display.vhd
--  created by Design Wizard: 04/02/99 10:15:17
--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {display} architecture {display}}


library IEEE;
use IEEE.std_logic_1164.all;
use work.Types.all;

entity display is
    port (
		nCS: in STD_LOGIC;
		CTR: in STD_LOGIC;
		nWR: in STD_LOGIC;
        nRD: in STD_LOGIC;
		ADDRESS: in STD_LOGIC_VECTOR (4 downto 0);
        DATA: inout STD_LOGIC_VECTOR (7 downto 0);
        SCREEN: out ScrType
    );
end display;

--}} End of automatically maintained section

architecture display of display is

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

function bit2int(inp: bit_vector) return integer is
variable otp: integer:=0;
begin

	for i in 0 to (inp'length-1) loop
		if(inp(i)='1') then
			otp:=otp+2**i;
		end if;
 	end loop;

	return otp;
end function;

signal DisplayMem: MemType;
signal DisplayMemBuf: MemType; 
signal OrderReg: bit_vector (7 downto 0):="00000000";
begin
  -- <<enter your statements here>>

bus_ctr:
	process(nCS, CTR, nRD, nWR, ADDRESS, DATA)
	begin
		if(nCS='0') then
			if(CTR='0') then
				if(nRD='0') then
					DATA<= To_StdLogicVector( DisplayMem(std2int(ADDRESS)) );
					OrderReg<="00000000";
				elsif(nWR='0') then
					DisplayMemBuf(std2int(ADDRESS))<= To_BitVector(DATA);
					OrderReg<="00000000";
				else
					DATA<="ZZZZZZZZ";
				end if;
			elsif(CTR='1' or CTR='H') then
				if(nWR='0') then
				   	OrderReg<= To_BitVector(DATA);
				else
					DATA<="ZZZZZZZZ";
				end if;
			else
				DATA<="ZZZZZZZZ";
			end if;
		else
			DATA<="ZZZZZZZZ";
		end if;

	end process;
 
control:
	process(OrderReg)
	variable DisplayMemVariable: MemType; 
	begin
		if(OrderReg(0)='1') then		
			for i in 0 to 31 loop
				DisplayMemVariable(i) := "00100000";
				DisplayMem<=DisplayMemVariable;
			end loop;	
		elsif(OrderReg(1)='1') then
			   DisplayMem<=DisplayMemBuf;
		end if;
	end process;

disp:
	process(DisplayMem)
	variable pointerA, pointerB: integer;
	begin
		for i in 1 to 16 loop 
			pointerA:= bit2int(DisplayMem(i-1)) - 16#20#;
			pointerB:= bit2int(DisplayMem(i+15)) - 16#20#;
			if(pointerA >= 0 and pointerA < 96) then
				SCREEN.LineA(i)<= ASCII_Table(pointerA);
			end if;
			if(pointerB >= 0 and pointerB < 96) then
				SCREEN.LineB(i)<= ASCII_TABLE(pointerB);
			end if;
		end loop;		
	end process;

end display;
