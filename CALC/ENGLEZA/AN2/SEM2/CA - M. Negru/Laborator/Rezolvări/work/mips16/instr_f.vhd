----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:55 04/14/2013 
-- Design Name: 
-- Module Name:    instr_f - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instr_f is
	Port (
		step	: in STD_LOGIC;
		ja		: in STD_LOGIC;
		breq	: in STD_LOGIC;
		zero	: in STD_LOGIC; 
		instr	: out STD_LOGIC_vector (15 downto 0)
		);
end instr_f;

architecture Behavioral of instr_f is

signal count: STD_LOGIC_VECTOR(7 downto 0); --iesirea de la numaratorul pe 8 biti

type rom_type is array (0 to 255) of std_logic_vector (15 downto 0); 
	 constant romInstr : rom_type:=    --memoria rom cu valorile ce la contine
			(
				--for alu with registers
				x"0000",  -- RF[0]=RF[0] and RF[0]
				x"1100",  -- RF[0]=RF[1] or RF[0]
				x"2110",  -- RF[0]=RF[1] + RF[1]=2
				x"3120",  -- RF[0]=RF[1] - RF[1]=0
				x"2230",  -- RF[0] = RF[2]+RF[3]=5
				x"4110",  -- RF[0]=RF[1] - RF[1]=0
				x"5110",  -- RF[0]=RF[1] xor RF[1]=0
				x"6110",  -- RF[0]=RF[1] nor RF[1]=0
				
				--for imm
				x"8202",  -- imm add: RF[0] = RF[2] and 2 => 2
				x"9200",  -- imm add: RF[0] = RF[2] or 0 => 0
				x"A207",  -- imm add: RF[0] = RF[2] + 7
				x"B207",  -- imm add: RF[0] = RF[2] - 7
				x"C207",  -- imm add: RF[0] = RF[2] xor 2 => 0
				x"D207",  -- imm add: RF[0] = RF[2] nor 7
				
				--for load and store
				x"E301",  -- store 1, 2: Mem[RF[3]+imm]=RF[0]
				x"6351",  -- load 0,1: RF[5]= Mem[RF[3]+imm]=1 
				
				x"A507",  -- imm add: RF[0] = RF[5] + 7 =FFF8 + 7;
				
				x"8002",  -- imm add: RF[0] = RF[0] = FFFF and 2 => 2

				
				--for jumps
				
			--	x"F230", -- cond jump la (nu face jump) *merge*
				x"700A",  -- uncond jump la 9 *merge*
				
			--	x"F229", -- cond jump la 9 (face jumpul) *merge*
				x"0111",
				others => x"0000");

signal dest			: STD_LOGIC_VECTOR (7 downto 0); 
signal brpc			: std_logic_vector (7 downto 0);
signal nextcount	: std_logic_vector (7 downto 0); 
signal jumpadr		: std_logic_vector (7 downto 0);
signal extins		: std_logic_vector (7 downto 0);

signal instri		: std_logic_vector (15 downto 0);
begin

--COUNTER 8 bits
	process (step) 
	begin
		if rising_edge(step) then
			if step='1' then
				count <= nextcount;
			end if;
      end if;
   end process;
 
---ROM 
instri <= romInstr(CONV_INTEGER(count)); 


---Generare nextpc

jumpadr <=instri (7 downto 0);  --adresa pentru jumpul neconditionat

--extins<="0000" & instr (3 downto 0)  when instr(3)='0'
	--else "1111" & instr (3 downto 0) ; 
	
brpc<= "0000" & instri (3 downto 0); ---count + 1 + instri (3 downto 0);  --adresa pentru jumpul conditionat

dest <= brpc WHEN (zero and breq)='1' ELSE 
        count+1; 
				
nextcount<= jumpadr when (ja = '1') else
				dest;

instr<= instri;

end Behavioral;


