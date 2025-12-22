library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Counter is
	port (Q:inout std_logic_vector(7 downto 0));
end entity;

architecture Count_STR of Counter is

component Count_2bit is
	port(CLK: in bit;
	Q:inout std_logic_vector(1 downto 0):="00";
	over: out bit:='0');
end component;

component Clock is
	port (CLK: inout bit);	 
end component;

signal CLK1,CLK2,CLK3,CLK4,x: bit;

begin
Ceas: Clock port map(CLK1);
P1: Count_2bit port map(CLK1,Q(1 downto 0),CLK2);
P2: Count_2bit port map(CLK2,Q(3 downto 2),CLK3);
P3: Count_2bit port map(CLK3,Q(5 downto 4),CLK4);
P4: Count_2bit port map(CLK4,Q(7 downto 6),x);
end architecture;

	

