-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : sum_1bit
-- Author      : Andrada
-- Company     : F
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\sum_1bit\compile\sum_1bit.vhd
-- Generated   : Sun Nov  8 22:52:33 2015
-- From        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\sum_1bit\src\sum_1bit.bde
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


entity sum_1bit is
  port(
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       CIN : in STD_LOGIC;
       CO : out STD_LOGIC;
       S : out STD_LOGIC
  );
end sum_1bit;

architecture sum_1bit of sum_1bit is

---- Signal declarations used on the diagram ----

signal NET159 : STD_LOGIC;
signal NET168 : STD_LOGIC;
signal NET177 : STD_LOGIC;
signal NET59 : STD_LOGIC;

begin

----  Component instantiations  ----

NET59 <= B xor A;

S <= CIN xor NET59;

NET159 <= B and A;

NET168 <= CIN and A;

NET177 <= CIN and B;

CO <= NET177 or NET168 or NET159;


end sum_1bit;
