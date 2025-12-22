library IEEE;
use IEEE.std_logic_1164.all;

entity automat_tb is
end automat_tb;

architecture simul_tb of automat_tb is
signal Clk	: std_logic := '0';
signal Rst	: std_logic := '0';
signal Frame: std_logic := '0';
signal Hit	: std_logic := '0';

signal OE	: std_logic;
signal GO	: std_logic;
signal ACT	: std_logic;

constant CLK_PERIOD : TIME := 10ns;
begin
	gen_clk: process
	begin
		Clk <= '0';
		wait for (CLK_PERIOD/2);
		Clk <= '1';
		wait for (CLK_PERIOD/2);
	end process gen_clk; 
	DUT: entity WORK.automat port map(
		Clk => Clk,
		Rst => Rst,
		Frame => Frame,
		Hit => Hit,
		OE => OE,
		GO => GO,
		ACT => ACT);

end simul_tb;
