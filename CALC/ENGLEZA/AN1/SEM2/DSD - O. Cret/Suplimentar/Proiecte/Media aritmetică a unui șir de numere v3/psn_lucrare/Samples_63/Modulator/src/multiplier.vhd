------------------------------------------------------------------------------
-- Subject     : Waveform and Tcl/Tk Demo
-- File name   : Multiplier.VHD
-- Revision    : 1.1
-- Date        : 02/24/99
-- Developer   : Michal Pacula
-- Copyright   : (C) 1999 ALDEC Inc.
-- Description : Triple multiplier with real type output.
------------------------------------------------------------------------------
library IEEE;
use IEEE.MATH_REAL.all;

entity Multiplier is
    port (
		clk: in bit;
		IN1: in real;
		IN2: in real;
		IN3: in real;
		OUT1: out real :=0.0
    );
end Multiplier;

architecture Multiplier of Multiplier is 
signal VALUE_X : real range 0.0 to 7.0;
begin
 process (clk)
 begin
	 if clk='1' and clk'event then 
		 OUT1 <= IN1 * IN2 * IN3;
	end if;
end process;
 
end Multiplier;
