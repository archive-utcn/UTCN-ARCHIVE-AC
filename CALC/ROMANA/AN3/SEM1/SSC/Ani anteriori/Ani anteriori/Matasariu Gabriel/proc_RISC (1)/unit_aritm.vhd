----------------------------------------------------------------------------------
-- Company:         UTCN
-- Engineer: 
-- 
-- Create Date:     13:45:17 04/02/2015 
-- Design Name:     unit_aritm
-- Module Name:     unit_aritm - Behavioral 
-- Project Name:    proc_RISC
-- Target Devices: 
-- Tool versions:   Vivado 2016.4
-- Description:     Unitate aritmetica si logica de 32 de biti
--                  Deplasarea se realizeaza cu un singur bit
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.RISC_pkg.ALL;

entity FUNC is
    Port ( X   : in  STD_LOGIC_VECTOR (31 downto 0);
           Y   : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (3 downto 0);
           E   : out STD_LOGIC_VECTOR (31 downto 0);
           V   : out STD_LOGIC;
           C   : out STD_LOGIC);
end FUNC;

architecture Behavioral of FUNC is
    signal Tmp : STD_LOGIC_VECTOR (32 downto 0) := (others => '0');
begin
    process (X, Y, Sel)
    begin
        case Sel is
            when FX =>
                Tmp <= '0' & X;
            when FADD =>
                Tmp <= (X(31) & X) + (Y(31) & Y);
            when FSUB =>
                Tmp <= (X(31) & X) - (Y(31) & Y);
            when FANDC =>
                Tmp <= ('0' & X) and ('0' & Y);
            when FORC =>
                Tmp <= ('0' & X) or ('0' & Y);
            when FXORC =>
                Tmp <= ('0' & X) xor ('0' & Y);
            when FNOTC =>
                Tmp <= not ('0' & X);
            when FY =>
                Tmp <= '0' & Y;
            when others =>
                Tmp <= '0' & X;
        end case;
end process;

    E <= Tmp (31 downto 0);
    with Sel select
        V <= Tmp(32) xor Tmp(31) when FADD | FSUB,
             '0' when others;
    with Sel select
        C <= Tmp(32) when FADD | FSUB,
             '0' when others;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.RISC_pkg.ALL;

entity DEPL is
    Port ( D   : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (3 downto 0);
           Sh  : in  STD_LOGIC_VECTOR (4 downto 0);
           SRI : in  STD_LOGIC;
           SLI : in  STD_LOGIC;
           G   : out STD_LOGIC_VECTOR (31 downto 0));
end DEPL;

architecture Behavioral of DEPL is
    signal SelMx : STD_LOGIC_VECTOR (1 downto 0) := "00";       -- selectie multiplexoare
begin
    selMx <= "01" when (Sel = FSHR) and (Sh /= "00000") else
             "10" when (Sel = FSHL) and (Sh /= "00000") else
             "00";                                              -- inclusiv daca Sh = "00000"

    MUX31_i:    entity WORK.mux_4_1 port map (I0 => D(31),      -- bitul 31
                    I1 => SRI, I2 => D(30), I3 => '0', Sel => SelMx, Z => G(31));

    genMUX:     for i in 30 downto 1 generate
    uMUX30_1:       entity WORK.mux_4_1 port map (I0 => D(i),   -- bitii 30..1
                        I1 => D(i+1), I2 => D(i-1), I3 => '0', Sel => SelMx, Z => G(i));
    end generate genMUX;

    MUX0_i:     entity WORK.mux_4_1 port map (I0 => D(0),       -- bitul 0
                    I1 => D(1), I2 => SLI, I3 => '0', Sel => SelMx, Z => G(0));
		
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.RISC_pkg.ALL;

entity unit_aritm is
    Port ( X   : in  STD_LOGIC_VECTOR (31 downto 0);
           Y   : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (3 downto 0);
           Sh  : in  STD_LOGIC_VECTOR (4 downto 0);
           F   : out STD_LOGIC_VECTOR (31 downto 0);
           V   : out STD_LOGIC;
           C   : out STD_LOGIC;
           N   : out STD_LOGIC;
           Z   : out STD_LOGIC);
end unit_aritm;

architecture Behavioral of unit_aritm is
    signal sFUNC : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');   -- iesire modul FUNC
    signal sDEPL : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');   -- iesire modul DEPL
    signal sUAL  : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');   -- iesire UAL
begin

    FUNC_i: entity WORK.FUNC port map (X => X, Y => Y, Sel => Sel, E => sFUNC, V => V, C => C);
    DEPL_i: entity WORK.DEPL port map (D => X, Sel => Sel, Sh => Sh, SRI => '0', SLI => '0', G => sDEPL);

    with Sel select                                                     -- selectia iesirii UAL
        sUAL <= sDEPL when FSHR | FSHL,
                sFUNC when others;
    F <= sUAL;
    N <= sUAL(31);
    Z <= '1' when sUAL = x"0000_0000" else '0';

end Behavioral;
