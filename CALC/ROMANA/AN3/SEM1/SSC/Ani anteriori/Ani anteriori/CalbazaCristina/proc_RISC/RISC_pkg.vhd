library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package RISC_pkg is

-- Coduri de operatii pentru instructiuni

constant NOP    : STD_LOGIC_VECTOR (7 downto 0) := x"00";
constant MOVA   : STD_LOGIC_VECTOR (7 downto 0) := x"40";
constant ADD    : STD_LOGIC_VECTOR (7 downto 0) := x"02";
constant SUB    : STD_LOGIC_VECTOR (7 downto 0) := x"05";
constant ANDC   : STD_LOGIC_VECTOR (7 downto 0) := x"08";
constant ORC    : STD_LOGIC_VECTOR (7 downto 0) := x"09";
constant XORC   : STD_LOGIC_VECTOR (7 downto 0) := x"0A";
constant NOTC   : STD_LOGIC_VECTOR (7 downto 0) := x"0B";
constant ADDI   : STD_LOGIC_VECTOR (7 downto 0) := x"22";
constant SUBI   : STD_LOGIC_VECTOR (7 downto 0) := x"25";
constant ANDI   : STD_LOGIC_VECTOR (7 downto 0) := x"28";
constant ORI    : STD_LOGIC_VECTOR (7 downto 0) := x"29";
constant XORI   : STD_LOGIC_VECTOR (7 downto 0) := x"2A";
constant ADDU   : STD_LOGIC_VECTOR (7 downto 0) := x"42";
constant SUBU   : STD_LOGIC_VECTOR (7 downto 0) := x"45";
constant MOVB   : STD_LOGIC_VECTOR (7 downto 0) := x"0C";
constant SHR    : STD_LOGIC_VECTOR (7 downto 0) := x"0D";
constant SHL    : STD_LOGIC_VECTOR (7 downto 0) := x"0E";
constant LOAD   : STD_LOGIC_VECTOR (7 downto 0) := x"10";
constant ST     : STD_LOGIC_VECTOR (7 downto 0) := x"20";
constant JMPR   : STD_LOGIC_VECTOR (7 downto 0) := x"70";
constant SGTE   : STD_LOGIC_VECTOR (7 downto 0) := x"75";
constant SLT    : STD_LOGIC_VECTOR (7 downto 0) := x"65";
constant BZ     : STD_LOGIC_VECTOR (7 downto 0) := x"60";
constant BNZ    : STD_LOGIC_VECTOR (7 downto 0) := x"50";
constant JMP    : STD_LOGIC_VECTOR (7 downto 0) := x"68";
constant JMPL   : STD_LOGIC_VECTOR (7 downto 0) := x"30";
constant HALT   : STD_LOGIC_VECTOR (7 downto 0) := x"69";

-- Coduri de functii pentru UAL

constant FX     : STD_LOGIC_VECTOR (3 downto 0) := x"0";            -- Transfer X
constant FADD   : STD_LOGIC_VECTOR (3 downto 0) := x"2";            -- Adunare
constant FSUB   : STD_LOGIC_VECTOR (3 downto 0) := x"5";            -- Scadere
constant FANDC  : STD_LOGIC_VECTOR (3 downto 0) := x"8";            -- SI logic
constant FORC   : STD_LOGIC_VECTOR (3 downto 0) := x"9";            -- SAU logic
constant FXORC  : STD_LOGIC_VECTOR (3 downto 0) := x"A";            -- SAU EXCLUSIV logic
constant FNOTC  : STD_LOGIC_VECTOR (3 downto 0) := x"B";            -- Complement logic
constant FY     : STD_LOGIC_VECTOR (3 downto 0) := x"C";            -- Transfer Y
constant FSHR   : STD_LOGIC_VECTOR (3 downto 0) := x"D";            -- Deplasare dreapta
constant FSHL   : STD_LOGIC_VECTOR (3 downto 0) := x"E";            -- Deplasare stanga

-- Definitii de functii pentru conversii

function HEX_TOASCII (Hex : in STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR;
function C_TOASCII   (C   : in CHARACTER) return STD_LOGIC_VECTOR;
function B2_TOASCII  (B2  : in STD_LOGIC_VECTOR (15 downto 0)) return STD_LOGIC_VECTOR;
function B4_TOASCII  (B4  : in STD_LOGIC_VECTOR (31 downto 0)) return STD_LOGIC_VECTOR;
function S4_TOASCII  (S4  : in STRING (1 to 4)) return STD_LOGIC_VECTOR;
function S8_TOASCII  (S8  : in STRING (1 to 8)) return STD_LOGIC_VECTOR;

end RISC_pkg;

package body RISC_pkg is

-- Functie de conversie a unei cifre hexazecimale in codul ASCII
function HEX_TOASCII (Hex : in STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
	variable Ascii : STD_LOGIC_VECTOR (7 downto 0);
begin
	if (Hex > x"9") then
		Ascii := x"0" & Hex + x"37";
	else
		Ascii := x"0" & Hex + x"30";
	end if;
	return Ascii;
end function HEX_TOASCII;

-- Functie de conversie a unui caracter intr-un vector
-- de 8 biti continand codul ASCII al caracterului
function C_TOASCII (C : in CHARACTER) return STD_LOGIC_VECTOR is
	variable Poz   : INTEGER;
	variable Ascii : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
	Poz := CHARACTER'pos (C);			-- pozitia caracterului in tipul enumerat CHARACTER
	for i in 0 to 7 loop
		if ((Poz/(2**i)) mod 2 = 1) then
			Ascii (i) := '1';
		end if;
	end loop;
	return Ascii;
end function C_TOASCII;

-- Functie de conversie a doi octeti intr-un vector de 32 de biti
-- continand codurile ASCII ale cifrelor hexazecimale ale octetilor
function B2_TOASCII (B2 : in STD_LOGIC_VECTOR (15 downto 0)) return STD_LOGIC_VECTOR is
	variable Ascii_1 : STD_LOGIC_VECTOR (7 downto 0);
	variable Ascii_2 : STD_LOGIC_VECTOR (7 downto 0);
	variable Ascii_3 : STD_LOGIC_VECTOR (7 downto 0);
	variable Ascii_4 : STD_LOGIC_VECTOR (7 downto 0);
begin
	Ascii_1 := HEX_TOASCII (B2(15 downto 12));
	Ascii_2 := HEX_TOASCII (B2(11 downto 8));
	Ascii_3 := HEX_TOASCII (B2(7  downto 4));
	Ascii_4 := HEX_TOASCII (B2(3  downto 0));
	return Ascii_1 & Ascii_2 & Ascii_3 & Ascii_4;
end function B2_TOASCII;

-- Functie de conversie a patru octeti intr-un vector de 64 de biti
-- continand codurile ASCII ale cifrelor hexazecimale ale octetilor
function B4_TOASCII (B4 : in STD_LOGIC_VECTOR (31 downto 0)) return STD_LOGIC_VECTOR is
	variable Ascii_1_4 : STD_LOGIC_VECTOR (31 downto 0);
	variable Ascii_5_8 : STD_LOGIC_VECTOR (31 downto 0);
begin
	Ascii_1_4 := B2_TOASCII (B4(31 downto 16));
    Ascii_5_8 := B2_TOASCII (B4(15 downto 0));
	return Ascii_1_4 & Ascii_5_8;
end function B4_TOASCII;

-- Functie de conversie a unui sir de 4 caractere intr-un vector
-- de 32 de biti continand codurile ASCII ale caracterelor
function S4_TOASCII (S4 : in STRING (1 to 4)) return STD_LOGIC_VECTOR is
	variable Ascii_1 : STD_LOGIC_VECTOR (7 downto 0);
	variable Ascii_2 : STD_LOGIC_VECTOR (7 downto 0);
	variable Ascii_3 : STD_LOGIC_VECTOR (7 downto 0);
	variable Ascii_4 : STD_LOGIC_VECTOR (7 downto 0);
begin
	Ascii_1 := C_TOASCII (S4(1));
	Ascii_2 := C_TOASCII (S4(2));
	Ascii_3 := C_TOASCII (S4(3));
	Ascii_4 := C_TOASCII (S4(4));
	return Ascii_1 & Ascii_2 & Ascii_3 & Ascii_4;
end function S4_TOASCII;

-- Functie de conversie a unui sir de 8 caractere intr-un vector
-- de 64 de biti continand codurile ASCII ale caracterelor
function S8_TOASCII (S8 : in STRING (1 to 8)) return STD_LOGIC_VECTOR is
	variable Ascii_1_4 : STD_LOGIC_VECTOR (31 downto 0);
    variable Ascii_5_8 : STD_LOGIC_VECTOR (31 downto 0);
begin
	Ascii_1_4 := S4_TOASCII (S8(1 to 4));
    Ascii_5_8 := S4_TOASCII (S8(5 to 8));
    return Ascii_1_4 & Ascii_5_8;
end function S8_TOASCII;

end RISC_pkg;
