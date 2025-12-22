library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity afisor_errPin is
port
	(anod: out std_logic_vector (3 downto 0);
	catod: out std_logic_vector (6 downto 0);
	clk: in std_logic;
	enable: in std_logic);
end afisor_errPin;


architecture errPin of afisor_errPin is
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
				catod<="0110000";
				i:=2;
			elsif(i=2) then
				anod<="1011";
				catod<="1111010";
				i:=1;
			elsif(i=1) then
 				anod<="1101";
				catod<="1111010";
				i:=0;
			else
				anod<="1110";
				catod<="0011000";
				i:=3;
			end if;
		end if;
else
		anod<="ZZZZ";
		catod<="ZZZZZZZ";
end if;
		end process;
end errPin;
