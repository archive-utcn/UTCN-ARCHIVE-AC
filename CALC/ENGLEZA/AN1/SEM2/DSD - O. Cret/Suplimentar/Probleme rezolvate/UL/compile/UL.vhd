-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : UL
-- Author      : Andrada
-- Company     : F
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\UL\compile\UL.vhd
-- Generated   : Sun Nov  8 23:46:51 2015
-- From        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\UL\src\UL.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity UL is
  port(
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       OP : in STD_LOGIC;
       Y : out STD_LOGIC
  );
end UL;

architecture UL of UL is

---- Signal declarations used on the diagram ----

signal NET78 : STD_LOGIC;
signal NET88 : STD_LOGIC;

begin

----  Component instantiations  ----

NET78 <= B and A;

NET88 <= B or A;

Y <= (NET78 and not OP) or (NET88 and OP);


end UL;
