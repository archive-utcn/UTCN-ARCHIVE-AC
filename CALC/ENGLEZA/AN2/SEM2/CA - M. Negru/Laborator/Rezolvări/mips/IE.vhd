----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:15:55 04/01/2013 
-- Design Name: 
-- Module Name:    IE - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IE is
    Port ( out_add : in  STD_LOGIC_VECTOR (31 downto 0);
           Sign_extended : in  STD_LOGIC_VECTOR (31 downto 0);
           Read_data_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Read_data_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUSrc : in  STD_LOGIC;
           Instruction5_0 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           out_add2 : out  STD_LOGIC_VECTOR(31 downto 0));
end IE;

architecture Behavioral of IE is
signal mux:std_logic_vector(31 downto 0);
signal ALUCI:std_logic_vector(3 downto 0);
signal auxResult:std_logic_vector(31 downto 0);

begin
--------------SUMATORUL DE SUS------------Pentru Branch
process(out_add,Sign_extended)
begin
out_add2<=out_add + Sign_extended;
end process;
------------------------------------------

--------------MULTIPLEXOR-----------------
process(Read_data_2,Sign_extended,ALUSrc)
begin
if ALUSrc='0' then mux <= Read_data_2; else mux<=Sign_extended; end if;
end process;
------------------------------------------

--------------ALU-------------------------
--0010 - add
--0110 - substract
--0000 - and
--0001 - or
--0111 - set_on_less_then
--1111 - add immmediate
process(Read_data_1,mux,ALUCI)
begin
case ALUCI is
when "0010" => auxResult <= Read_data_1 + mux;--adunare
when "0110" => auxResult <= Read_data_1 - mux;
when "0000" => auxResult <= Read_data_1 and mux;--and
when "0001" => auxResult <= Read_data_1 or mux;--or
when "1111" => auxResult <= Read_data_1 + mux;--add immediate
when "1000" => auxResult <= Read_data_1 * mux;--mul
when others => auxResult <= X"FFFFFFFF";--altfel
end case;
end process;
------------------------------------------

--------------ALU CONTROL-----------------
process(Instruction5_0,ALUOp)
begin

case ALUOp is
when "00" => ALUCI <= "0010";--add 
when "01" => ALUCI <= "0110";--substract
when "10" => case Instruction5_0 is
				 when "100000" => ALUCI <= "0010";--add
				 when "100010" => ALUCI <= "0110";--substract
				 when "100100" => ALUCI <= "0000";--and
				 when "100101" => ALUCI <= "0001";--or
				 when "101111" => ALUCI <= "1000";--mul
				 when others   => ALUCI <= "1111";--altfel
				 end case;
when "11" => ALUCI <= "1111";
when others =>ALUCI <="1111";
end case;

end process;
------------------------------------------
ALUResult <= auxResult;
--------------ZERO------------------------ 
process(auxResult)
begin
if auxResult = X"00000000" then Zero <='1'; else Zero <='0';end if;
end process;
------------------------------------------
end Behavioral;

