library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity afisajSuma is
port
	(anod: out std_logic_vector (3 downto 0);
	catod: out std_logic_vector (6 downto 0);
	dec_H_z: in std_logic_vector (6 downto 0);
	dec_H_s: in std_logic_vector (6 downto 0);
	dec_H_m: in std_logic_vector (6 downto 0);
	clk: in std_logic;
	enable: in std_logic);
end afisajSuma;

architecture Arh of afisajSuma is
signal cclk: std_logic;
signal clkdiv: std_logic_vector(10 downto 0);
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
				catod<="1001000";
				i:=2;
			elsif(i=2) then
				anod<="1011";
				catod<=dec_H_m;
				i:=1;
			elsif(i=1) then
 				anod<="1101";
				catod<=dec_H_s;
				i:=0;
			else
				anod<="1110";
				catod<=dec_H_z;
				i:=3;
			end if;
		end if;
	else
		anod<="ZZZZ";
		catod<="ZZZZZZZ";
	end if;
		end process;
	end Arh;

