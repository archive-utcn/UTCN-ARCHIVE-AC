------------------------------------------------------------------------------
-- Subject     : Waveform and Tcl/Tk Demo
-- File name   : CosineGenerator.VHD
-- Revision    : 2.0
-- Date        : 06/07/99
-- Developer   : Michal Pacula
-- Copyright   : (C) 1999 ALDEC Inc.
-- Description : Cosine Generator with real type output.
------------------------------------------------------------------------------
library IEEE;
use IEEE.MATH_REAL.all;

entity CosineGenerator is
	port (	
		CLK: in bit;
		CosEnable: in bit;
		CosFreq: in integer;
		COS1: out real :=0.0
		);
end CosineGenerator;

architecture CosineGenerator of CosineGenerator is 
	signal VALUE_X : real :=0.0;	 
	signal delta : real;
	
	begin  
	delta <= MATH_PI*real(CosFreq)/1000.0;
	process (clk)
		begin
		if CosEnable='1' then
			if clk='1' and clk'event then 
				VALUE_X <= "MOD"(VALUE_X+delta,2.0*MATH_PI); 
				COS1 <= COS(VALUE_X);
			end if;					 
		else 
			COS1 <= 1.0;
		end if;
	end process;
	
end CosineGenerator;
