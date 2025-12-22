----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:58 05/11/2015 
-- Design Name: 
-- Module Name:    U_EX - Behavioral 
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
use ieee.std_Logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity U_EX is

Port(PC_next : in std_Logic_vector(15 downto 0);
			RD1,RD2 : in std_Logic_vector(15 downto 0);
			Ext_imm : in std_Logic_vector(15 downto 0);
			ALUSrc : in std_logic;
			func : in std_Logic_vector(2 downto 0);
			ALUOp : in std_Logic_vector(1 downto 0);
			--sa : in std_logic;
			branch_adress : out std_Logic_vector(15 downto 0);
			zero : out std_logic;
			ALURez : out std_logic_vector(15 downto 0);
			regDst : in std_logic;
			rt : in std_logic_vector(2 downto 0);
			rd : in std_Logic_vector(2 downto 0);
			write_addres : out std_logic_vector(2 downto 0)
			);
end U_EX;

architecture Behavioral of U_EX is

signal alu2 : std_logic_vector(15 downto 0);
signal AluCtr : std_Logic_vector(3 downto 0);
begin

process(ALUSrc)
begin
	if (ALUSrc = '1') then 
		alu2<=Ext_imm;
	else
		alu2<=RD2;
	end if;
end process;

process(regDst)
begin
	if (regDst = '1') then
		write_addres<=rd;
	else
		write_addres<=rt;
	end if;
end process;


process(AluCtr)
begin

	Case AluCtr is
	when "0000"=>ALURez<=RD1 + alu2; zero<='0'; -- +
	when "0001"=>ALURez<=RD1 - alu2; zero<='0'; -- -
	when "0010"=>ALURez<=alu2(14 downto 0) & "0";  zero<='0'; -- sll
	when "0011"=>ALURez<= "0" & alu2(15 downto 1); zero<='0'; -- srl
	when "0100"=>ALURez<=RD1 and alu2; zero<='0'; -- and
	when "0101"=>ALURez<=RD1 or alu2;  zero<='0'; -- or
	when "0110"=>ALURez<=RD1 xor alu2; zero<='0'; --xor
	when "0111"=>if (RD1 = alu2) then zero<='1';
						end if;
	when "1001"=>if (RD1 < alu2) then
						ALURez<=x"0001";
						else ALURez <=x"0000";
					end if;
	when others=>ALURez<=x"1111";
	end case;
end process;

process(ALUop)
begin
	case ALUop is
	when "00"=>AluCtr<="0000"; -- adunare(lw sw addi lb)
	when "01"=>AluCtr<="0111"; -- beq, jmp
	when "10"=>AluCtr<="0" & func; -- de tipu R
	when "11"=>AluCtr<="1001"; -- slti
	when others=>AluCtr<="1111";
	end case;
end process;	

--branch_adress<= PC_next + (Ext_imm(14 downto 0) & '0');
branch_adress<=Ext_imm(15 downto 0);
end Behavioral;

