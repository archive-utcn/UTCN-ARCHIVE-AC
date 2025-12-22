---------------------------------------------------------------------------------------------------
--
-- Title       : oscil_c_vhpi
-- Design      : VHDL_Verilog_EDIF_C_VHPI
-- Author      : Peter Luszczak
-- Company     : Aldec, Inc.
--
---------------------------------------------------------------------------------------------------
--
-- File        : oscil_c_vhpi.vhd
-- Generated   : Tue Jun 17 11:36:37 2003
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {oscil_c_vhpi} architecture {oscil_c_vhpi}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity oscil_c_vhpi is
	port(
		CLK : in STD_LOGIC;
		CLR : in STD_LOGIC;
		F0 : out STD_LOGIC;
		F1 : out STD_LOGIC
		);
end oscil_c_vhpi;  

architecture oscil_c_vhpi of oscil_c_vhpi is
	attribute foreign of oscil_c_vhpi : architecture is "VHPI VHPI\vhpiuser_aldec.dll; oscil_c_vhpi_model";
begin
end oscil_c_vhpi;



