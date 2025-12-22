----------------------------------------------------------------------------------
-- Company:         UTCN
-- Engineer: 
-- 
-- Create Date:     12:18:31 04/14/2015 
-- Design Name:     conv_uart
-- Module Name:     conv_uart - Behavioral 
-- Project Name:    implem_RISC
-- Target Devices: 
-- Tool versions:   Vivado 2015.4, 2016.4
-- Description:     Modul pentru conversia iesirilor procesorului RISC in
--                  formatul necesar pentru afisare prin interfata seriala UART
--                  Genereaza vectorii de intrare pentru modulul afis_uart
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.RISC_pkg.ALL;

entity conv_uart is
    Port ( AdrInstr : in  STD_LOGIC_VECTOR (31 downto 0);
           Instr    : in  STD_LOGIC_VECTOR (31 downto 0);
           RA       : in  STD_LOGIC_VECTOR (31 downto 0);
           RB       : in  STD_LOGIC_VECTOR (31 downto 0);
           F        : in  STD_LOGIC_VECTOR (31 downto 0);
           Data1    : out STD_LOGIC_VECTOR (63 downto 0);
           Data2    : out STD_LOGIC_VECTOR (63 downto 0);
           Data3    : out STD_LOGIC_VECTOR (63 downto 0);
           Data4    : out STD_LOGIC_VECTOR (63 downto 0);
           Data5    : out STD_LOGIC_VECTOR (63 downto 0);
           Data6    : out STD_LOGIC_VECTOR (63 downto 0);
           Data7    : out STD_LOGIC_VECTOR (63 downto 0);
           Data8    : out STD_LOGIC_VECTOR (63 downto 0));
end conv_uart;

architecture Behavioral of conv_uart is
    alias  CODOP : STD_LOGIC_VECTOR (7 downto 0) is Instr (31 downto 24);
    signal Mnemo : STRING (1 to 4);
begin
    -- Asignarea caracterelor pentru vectorul Data1
    -- Caracterele 1-2: adresa instructiunii
    -- Caracterul  3:   spatiu
    -- Caracterele 4-7: mnemonica instructiunii
    -- Caracterul  8:   spatiu
    Data1 (63 downto 48) <= HEX_TOASCII (AdrInstr(7 downto 4)) & HEX_TOASCII (AdrInstr(3 downto 0));
    Data1 (47 downto 40) <= C_TOASCII (' ');
    Data1 (39 downto 8)  <= S4_TOASCII (Mnemo);
    Data1 (7  downto 0)  <= C_TOASCII (' ');

    process (CODOP)
    begin
        case CODOP is
            when NOP    => Mnemo <= "NOP ";
            when MOVA   => Mnemo <= "MOVA";
            when ADD    => Mnemo <= "ADD ";
            when SUB    => Mnemo <= "SUB ";
            when ANDC   => Mnemo <= "AND ";
            when ORC    => Mnemo <= "OR  ";
            when XORC   => Mnemo <= "XOR ";
            when NOTC   => Mnemo <= "NOT ";
            when ADDI   => Mnemo <= "ADDI";
            when SUBI   => Mnemo <= "SUBI";
            when ANDI   => Mnemo <= "ANDI";
            when ORI    => Mnemo <= "OR  ";
            when XORI   => Mnemo <= "XOR ";
            when ADDU   => Mnemo <= "ADDU";
            when SUBU   => Mnemo <= "SUBU";
            when MOVB   => Mnemo <= "MOVB";
            when SHR    => Mnemo <= "SHR ";
            when SHL    => Mnemo <= "SHL ";
            when LOAD   => Mnemo <= "LD  ";
            when ST     => Mnemo <= "ST  ";
            when JMPR   => Mnemo <= "JMPR";
            when SGTE   => Mnemo <= "SGTE";
            when SLT    => Mnemo <= "SLT ";
            when BZ     => Mnemo <= "BZ  ";
            when BNZ    => Mnemo <= "BNZ ";
            when JMP    => Mnemo <= "JMP ";
            when JMPL   => Mnemo <= "JMPL";
            when HALT   => Mnemo <= "HALT";
            when others => Mnemo <= "xxxx";
        end case;
    end process;

    -- Asignarea caracterelor pentru vectorul Data2 si a caracterelor 1-2 pentru Data3
    -- Caracterele 1-2:  'Rd' (d - adresa registrului destinatie)
    -- Caracterul  3:    ','
    -- Caracterele 4-5:  'Ra' (a - adresa registrului sursa A)
    -- Caracterul  6:    ','
    -- Caracterele 7-8:  'Rb' (b - adresa registrului sursa B) sau octetul superior al campului IM/OFFS
    -- Caracterele 9-10: octetul inferior al campului IM/OFFS
    process (Instr, CODOP)
        variable C12 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');   -- caracterele 1-2 ale vectorului Data2
        variable C3  : STD_LOGIC_VECTOR ( 7 downto 0) := (others => '0');   -- caracterul 3 al vectorului Data2
        variable C45 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');   -- caracterele 4-5 ale vectorului Data2
        variable C6  : STD_LOGIC_VECTOR ( 7 downto 0) := (others => '0');   -- caracterul 6 al vectorului Data2
        variable C78 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');   -- caracterele 7-8 ale vectorului Data2
        variable C9a : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');   -- caracterele 1-2 ale vectorului Data3
        variable Im  : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');   -- caracterele pentru campul IM sau OFFS
    begin
        C12 := C_TOASCII ('R') & HEX_TOASCII (Instr(23 downto 20));         -- caractere pentru registrul destinatie
        C3  := C_TOASCII (',');
        C45 := C_TOASCII ('R') & HEX_TOASCII (Instr(19 downto 16));         -- caractere pentru registrul sursa A
        C6  := C_TOASCII (',');
        C78 := C_TOASCII ('R') & HEX_TOASCII (Instr(15 downto 12));         -- caractere pentru registrul sursa B
        C9a := C_TOASCII (' ') & C_TOASCII (' ');                           -- spatii
        Im  := B2_TOASCII (Instr (15 downto 0));                            -- 4 caractere pentru campul IM sau OFFS

        case CODOP is
            when NOP | HALT =>
                C12 := x"2020"; C3 := x"20"; C45 := x"2020";                -- spatii pentru toate campurile
                C6 := x"20"; C78 := x"2020";
            when MOVA | NOTC | LOAD => 
                C6 := x"20"; C78 := x"2020";                                -- spatii pentru registrul sursa B
            when MOVB =>
                C45 := x"2020"; C6 := x"20";                                -- spatii pentru registrul sursa A
            when ST =>
                C12 := x"2020"; C3 := x"20";                                -- spatii pentru registrul destinatie
            when JMPR =>
                C12 := x"2020"; C3 := x"20"; C6 := x"20"; C78 := x"2020";   -- spatii pentru registrele destinatie si sursa B
            when ADDI | SUBI | ANDI | ORI | XORI | ADDU | SUBU | SHR | SHL =>
                C78 := Im (31 downto 16); C9a := Im (15 downto 0);          -- caractere pentru campul IM
            when BZ | BNZ =>
                C12 := x"2020"; C3 := x"20";                                -- spatii pentru registrul destinatie
                C78 := Im (31 downto 16); C9a := Im (15 downto 0);          -- caractere pentru campul OFFS
            when JMP =>
                C12 := x"2020"; C3 := x"20"; C45 := x"2020"; C6 := x"20";   -- spatii pentru registrele destinatie si sursa A
                C78 := Im (31 downto 16); C9a := Im (15 downto 0);          -- caractere pentru campul OFFS
            when JMPL =>
                C45 := x"2020"; C6 := x"20";                                -- spatii pentru registrul sursa A
                C78 := Im (31 downto 16); C9a := Im (15 downto 0);          -- caractere pentru campul OFFS
            when others => null;
        end case;

        Data2 (63 downto 40) <= C12 & C3;
        Data2 (39 downto 16) <= C45 & C6;
        Data2 (15 downto  0) <= C78;
        Data3 (63 downto 48) <= C9a;
    end process;

    -- Asignarea caracterelor 3-8 pentru vectorul Data3
    -- Caracterele 3-5: spatii
    -- Caracterele 6-7: 'F:'
    -- Caracterul  8:   bitii 31..28 de la iesirea UAL
    Data3 (47 downto 24) <= x"202020";
    Data3 (23 downto  8) <= C_TOASCII ('F') & C_TOASCII (':');
    Data3 (7  downto  0) <= HEX_TOASCII (F (31 downto 28));

    -- Asignarea caracterelor pentru vectorul Data4
    -- Caracterul  1:   bitii 27..24 de la iesirea UAL
    -- Caracterele 2-3: bitii 23..16 de la iesirea UAL
    -- Caracterul  4:   '_'
    -- Caracterele 5-8: bitii 15..0 de la iesirea UAL
    Data4 (63 downto 56) <= HEX_TOASCII (F (27 downto 24));
    Data4 (55 downto 40) <= HEX_TOASCII (F (23 downto 20)) & HEX_TOASCII (F (19 downto 16));
    Data4 (39 downto 32) <= C_TOASCII ('_');
    Data4 (31 downto  0) <= B2_TOASCII (F (15 downto 0));

    -- Asignarea caracterelor pentru vectorul Data5
    -- Caracterele 1-3: spatii
    -- Caracterele 4-6: 'RA:'
    -- Caracterele 7-8: bitii 31..24 de la intrarea X la UAL
    Data5 (63 downto 40) <= x"202020";
    Data5 (39 downto 16) <= C_TOASCII ('R') & C_TOASCII ('A') & C_TOASCII (':');
    Data5 (15 downto  0) <= HEX_TOASCII (RA (31 downto 28)) & HEX_TOASCII (RA (27 downto 24));

    -- Asignarea caracterelor pentru vectorul Data6
    -- Caracterele 1-2: bitii 23..16 de la intrarea X la UAL
    -- Caracterul  3:   '_'
    -- Caracterele 4-7: bitii 15..0 de la intrarea X la UAL
    -- Caracterul  8:   spatiu
    Data6 (63 downto 48) <= HEX_TOASCII (RA (23 downto 20)) & HEX_TOASCII (RA (19 downto 16));
    Data6 (47 downto 40) <= C_TOASCII ('_');
    Data6 (39 downto  8) <= B2_TOASCII (RA (15 downto 0));
    Data6 (7  downto  0) <= x"20";

    -- Asignarea caracterelor pentru vectorul Data7
    -- Caracterele 1-2: spatii
    -- Caracterele 3-5: 'RB:'
    -- Caracterele 6-7: bitii 31..24 de la intrarea Y la UAL
    -- Caracterul  8:   bitii 23..20 de la intrarea Y la UAL
    Data7 (63 downto 48) <= x"2020";
    Data7 (47 downto 24) <= C_TOASCII ('R') & C_TOASCII ('B') & C_TOASCII (':');
    Data7 (23 downto  8) <= HEX_TOASCII (RB (31 downto 28)) & HEX_TOASCII (RB (27 downto 24));
    Data7 ( 7 downto  0) <= HEX_TOASCII (RB (23 downto 20));

    -- Asignarea caracterelor pentru vectorul Data8
    -- Caracterul  1:   bitii 19..16 de la intrarea Y la UAL
    -- Caracterul  2:   '_'
    -- Caracterele 3-6: bitii 15..0 de la intrarea Y la UAL
    -- Caracterele 7-8: spatii
    Data8 (63 downto 56) <= HEX_TOASCII (RB (19 downto 16));
    Data8 (55 downto 48) <= C_TOASCII ('_');
    Data8 (47 downto 16) <= B2_TOASCII (RB (15 downto 0));
    Data8 (15 downto  0) <= x"2020";

end Behavioral;
