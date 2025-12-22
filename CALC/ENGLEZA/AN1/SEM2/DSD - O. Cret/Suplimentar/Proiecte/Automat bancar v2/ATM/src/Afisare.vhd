library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.standard.all;

entity Afisare is
	port
	(anod: out std_logic_vector (3 downto 0);
	catod: out std_logic_vector (6 downto 0);
	catodin_zeci: in std_logic_vector(6 downto 0);
	catodin_sute: in std_logic_vector(6 downto 0);
	catodin_mii: in std_logic_vector (6 downto 0);
	clk: in std_logic;
	enable: in std_logic);
end Afisare;

architecture Arh of afisare is
signal cclk: std_logic;
signal clkdiv: std_logic_vector(10 downto 0);
signal catodin: std_logic_vector (6 downto 0);
begin
	process(clk)
	begin
		if clk='1' and clk'event then
			clkdiv <= clkdiv+1;
		end if;
	end process;
	cclk<=clkdiv(10);
	process(cclk)
	variable i: integer:=3;
	begin
	if (enable='1') then
	if(rising_edge(cclk)) then
			if(i=3) then
				anod<="0111";
				catodin<=catodin_mii;
				i:=2;
			elsif(i=2) then
				anod<="1011";
				catodin<=catodin_sute;
				i:=1;
			elsif(i=1) then
 				anod<="1101";
				catodin<=catodin_zeci;
				i:=0;
			else
				anod<="1110";
				catodin<="0000001";
				i:=3;
			end if;
		end if;
else
		anod<="ZZZZ";
		catod<="ZZZZZZZ";
end if;
		end process;
catod<=catodin;
end Arh;


