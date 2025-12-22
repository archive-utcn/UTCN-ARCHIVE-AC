----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2021 06:35:59 PM
-- Design Name: 
-- Module Name: EX - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EX is
  Port (
        RD1: in STD_LOGIC_VECTOR (15 downto 0);
        ALUSrc: in STD_LOGIC;
        RD2: in STD_LOGIC_VECTOR (15 downto 0);
        Ext_Imm: in STD_LOGIC_VECTOR (15 downto 0);
        sa: in STD_LOGIC;
        func: in STD_LOGIC_VECTOR (2 downto 0);
        ALUOp: in STD_LOGIC_VECTOR (2 downto 0);
        ALURes: out STD_LOGIC_VECTOR (15 downto 0);
        PCNext: in STD_LOGIC_VECTOR (15 downto 0);
        RegDst: in std_logic;
        rt: in std_logic_vector(2 downto 0);
        rd: in std_logic_vector(2 downto 0);
        Zero: out STD_LOGIC;
        Sign: out STD_LOGIC;
        BranchAddr: out STD_LOGIC_VECTOR (15 downto 0);
        Gez: out STD_LOGIC; -- iesire pentru bgez (sign negat)
        WriteAddress: out std_logic_vector(2 downto 0)
   );
end EX;

architecture Behavioral of EX is
    signal ALUCtrl: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal ALUIn2: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal ALUResAux: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    
begin
    -- ALUCtrl
    process(ALUOp, func)
    begin
        case ALUOp is
            when "000" =>
                case func is
                    when "000" => ALUCtrl <= "000"; -- add
                    when "001" => ALUCtrl <= "001"; -- sub
                    when "010" => ALUCtrl <= "010"; -- sll
                    when "011" => ALUCtrl <= "011"; -- srl
                    when "100" => ALUCtrl <= "100"; -- and
                    when "101" => ALUCtrl <= "101"; -- or
                    when "110" => ALUCtrl <= "110"; -- xor
                    when others => ALUCtrl <= "111"; -- slt - in ALU SE FACE O COMPARATIE
                end case;
            when "001" => -- addi, lw, sw
                ALUCtrl <= "000"; -- in ALU SE FACE ADUNARE
            when "010" => -- beq, bgez, bltz
                ALUCtrl <= "001"; -- in ALU SE FACE SCADERE
            when others => -- j
                ALUCtrl <= "XXX"; -- ALUCtrl este indiferent
        end case;
    end process;
    
    -- inputB - mux
    MUX2_1: ALUIn2 <= RD2 when ALUSrc = '0' else Ext_Imm;
    
    -- iesirea de semn
    Sign <= RD1(15);
    
    -- ALU
    process(RD1, ALUIn2, ALUCtrl, sa)
    begin
        case ALUCtrl is
            when "000" => ALUResAux <= RD1 + ALUIn2;
            when "001" => ALUResAux <= RD1 - ALUIn2;
            when "010" => if sa = '1' then
                                ALUResAux <= RD1(14 downto 0) & '0';
                          else
                                ALUResAux <= RD1;
                          end if;
            when "011" => if sa = '1' then
                                ALUResAux <= '0' & RD1(15 downto 1);
                          else
                                ALUResAux <= RD1;
                          end if;
            when "100" => ALUResAux <= RD1 and ALUIn2;
            when "101" => ALUResAux <= RD1 or ALUIn2;
            when "110" => ALUResAux <= RD1 xor ALUIn2;
            when others => if RD1 < ALUIn2 then
                                ALUResAux <= X"0001";
                           else
                                ALUResAux <= X"0000";
                           end if;
        end case;
    end process;
    
    -- iesirea de 0
    Zero <= '1' when ALUResAux = X"0000" else '0';
    
    ALURes <= ALUResAux;
    
    -- iesirea pentru bgez
    Gez <= not ALUResAux(15);
    
    -- iesirea pentru adresa de branch
    BranchAddr <= PCNext + Ext_Imm;
    
    -- pentru stabilirea adresei de scriere
    process(RegDst, rd, rt)
    begin
        if RegDst = '0' then
            WriteAddress <= rt;
        else 
            WriteAddress <= rd;
        end if; 
    end process;

end Behavioral;
