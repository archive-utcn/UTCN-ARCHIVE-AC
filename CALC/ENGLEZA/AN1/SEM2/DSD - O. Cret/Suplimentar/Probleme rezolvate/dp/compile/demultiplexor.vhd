-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : dp
-- Author      : Andrada
-- Company     : F
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\dp\compile\demultiplexor.vhd
-- Generated   : Tue Nov 10 01:05:41 2015
-- From        : C:\Users\Andrada\Desktop\Andra\4. UTCN\1st SEM\LD\Projects\TEME\dp\src\demultiplexor.bde
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


entity demultiplexor is
  port(
       s : in STD_LOGIC;
       x : in STD_LOGIC;
       y0 : out STD_LOGIC;
       y1 : out STD_LOGIC
  );
end demultiplexor;

architecture demultiplexor of demultiplexor is

---- Signal declarations used on the diagram ----

signal NET40 : STD_LOGIC;

begin

----  Component instantiations  ----

y0 <= s and x;

y1 <= NET40 and x;

NET40 <= not(s);


end demultiplexor;
