---------------------------------------------------------------------------------------------------
--
-- Title       : Test Bench for mux_2la1
-- Design      : mux_2la1
-- Author      : Windows User
-- Company     : matrix
--
---------------------------------------------------------------------------------------------------
--
-- File        : $DSN\src\TestBench\mux_2la1_TB.vhd
-- Generated   : 4/30/2017, 11:11 PM
-- From        : $DSN\src\mux_2la1.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
---------------------------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for mux_2la1_tb
--
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mux_2la1_tb is
end mux_2la1_tb;

architecture TB_ARCHITECTURE of mux_2la1_tb is
	-- Component declaration of the tested unit
	component mux_2la1
	port(
		i0 : in BIT;
		i1 : in BIT;
		sel : in BIT;
		y : out BIT );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal i0 : BIT;
	signal i1 : BIT;
	signal sel : BIT;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal y : BIT;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mux_2la1
		port map (
			i0 => i0,
			i1 => i1,
			sel => sel,
			y => y
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mux_2la1 of mux_2la1_tb is
	for TB_ARCHITECTURE
		for UUT : mux_2la1
			use entity work.mux_2la1(arh);
		end for;
	end for;
end TESTBENCH_FOR_mux_2la1;

