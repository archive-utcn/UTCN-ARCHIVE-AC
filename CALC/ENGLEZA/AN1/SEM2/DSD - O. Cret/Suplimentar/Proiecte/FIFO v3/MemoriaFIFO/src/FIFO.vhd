library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;   

entity fifo is
	port(clk: in std_logic;
	push: in std_logic;
	pop: in std_logic;
	datain: in std_logic_vector(7 downto 0);
	dataout: out std_logic_vector(7 downto 0);
	empty: inout std_logic;
	last: inout std_logic;
	full: inout std_logic);
end fifo;

architecture arh_fifo of fifo is 

component divizor_frecventa is 
	port ( CLK_IN : in STD_LOGIC;
	      CLK_OUT : out STD_LOGIC);
end component;

component control is
	port ( PUSH,POP,FULL,EMPTY : in std_logic;
	CE_WR, CE_RD: out std_logic);
end component;

component status is
port (ce_wr,clk, ce_rd: in std_logic;
	empty,last,full: out std_logic);
end component;

component pointers_RAM is
	port(ce_wr, ce_rd, clk, push: in std_logic;
	datain: in std_logic_vector(7 downto 0);
	dataout: out std_logic_vector(7 downto 0));
end component;


 
signal ce_wrS, ce_rdS, pushS, emptyS, fullS, clkS, lastS: std_logic;




begin

divizor: divizor_frecventa port map(CLK_IN=>CLK, CLK_OUT=>clkS);	
controlFIFO: Control port map (POP=>POP, PUSH=>PUSH, EMPTY=>EMPTY, FULL=>FULL, CE_WR=>ce_wrS, CE_RD=>ce_rdS);
pushS<=PUSH;
statusFIFO: Status port map(CE_WR=>ce_wrS, CE_RD=>ce_rdS, CLK=>clkS,EMPTY=>EMPTY, LAST=>LAST, FULL=>FULL);
mem: Pointers_RAM port map(CE_WR=>ce_wrS, CE_RD=>ce_rdS,PUSH=>pushS, CLK=>clkS, DATAIN=>DATAIN, DATAOUT=>DATAOUT);

	
end architecture;
