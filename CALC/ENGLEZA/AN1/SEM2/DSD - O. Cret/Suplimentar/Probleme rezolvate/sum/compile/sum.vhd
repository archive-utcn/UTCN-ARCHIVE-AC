-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : sum
-- Author      : Andrada
-- Company     : F
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\sum\compile\sum.vhd
-- Generated   : Sun Nov  8 22:58:57 2015
-- From        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\sum\src\sum.bde
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


entity sum is
  port(
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       CIN : in STD_LOGIC;
       CO : out STD_LOGIC;
       S : out STD_LOGIC
  );
end sum;

architecture sum of sum is

---- Signal declarations used on the diagram ----

signal NET100 : STD_LOGIC;
signal NET107 : STD_LOGIC;
signal NET46 : STD_LOGIC;
signal NET96 : STD_LOGIC;

begin

----  Component instantiations  ----

NET46 <= B xor A;

S <= CIN xor NET46;

NET96 <= B and A;

NET100 <= CIN and A;

NET107 <= CIN and B;

CO <= NET107 or NET100 or NET96;


end sum;
