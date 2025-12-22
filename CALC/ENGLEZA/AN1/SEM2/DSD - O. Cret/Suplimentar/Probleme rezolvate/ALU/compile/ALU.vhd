-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ALU
-- Author      : Andrada
-- Company     : F
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\ALU\compile\ALU.vhd
-- Generated   : Mon Nov  9 00:13:49 2015
-- From        : c:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\ALU\src\ALU.bde
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


-- other libraries declarations
library UA;
library UL;

entity ALU is
  port(
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       OP : in STD_LOGIC;
       Sel : in STD_LOGIC;
       CO : out STD_LOGIC;
       Y : out STD_LOGIC
  );
end ALU;

architecture ALU of ALU is

---- Component declarations -----

component UA
  port (
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       OP : in STD_LOGIC;
       CO : out STD_LOGIC;
       Y : out STD_LOGIC
  );
end component;
component UL
  port (
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       OP : in STD_LOGIC;
       Y : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET126 : STD_LOGIC;
signal NET81 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : UL
  port map(
       A => A,
       B => B,
       OP => OP,
       Y => NET81
  );

U2 : UA
  port map(
       A => A,
       B => B,
       CO => CO,
       OP => OP,
       Y => NET126
  );

Y <= (NET81 and not Sel) or (NET126 and Sel);


end ALU;
