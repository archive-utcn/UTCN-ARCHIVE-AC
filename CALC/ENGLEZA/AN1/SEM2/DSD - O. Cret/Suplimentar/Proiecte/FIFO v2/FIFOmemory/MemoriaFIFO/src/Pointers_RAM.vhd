library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity pointers_RAM is
	port(ce_wr, ce_rd, clk,push: in std_logic;
	datain: in std_logic_vector(7 downto 0);
	dataout: out std_logic_vector(7 downto 0));
	
end entity;

architecture arh_pointers_RAM of pointers_RAM is 

component C4U is
	port(ce, clk: in std_logic;
	q: out std_logic_vector(3 downto 0));
end component;

component mux2to1 is
   Port ( A : in integer;
          B : in integer;
          S : in std_logic;
          Y : out integer);
end component;	

component RAM is
	port(AD: in std_logic_vector(3 downto 0);
	CLK: in std_logic;
	CE_WR: in std_logic;
	DATAIN: in std_logic_vector(7 downto 0);
	DATAOUT: out std_logic_vector (7 downto 0));
end component;

signal aw,ar,ad: std_logic_vector(3 downto 0);
signal A1,B1,Y1: integer;
begin  

	U1: C4U port map(ce=>ce_wr, clk=>clk, q=>aw);
	U2: C4U port map(ce=>ce_rd, clk=>clk, q=>ar);
	A1<=conv_integer(AW);
	B1<=conv_integer(AR);
            MUX: mux2to1 port map(A=>A1, B=>B1, S=>push, Y=>Y1);  
            ad<=conv_std_logic_vector(Y1,4);
	U3: RAM port map (CE_WR=>ce_wr,DATAIN=>datain,CLK=>CLK,AD=>ad,DATAOUT=>dataout);
end architecture;