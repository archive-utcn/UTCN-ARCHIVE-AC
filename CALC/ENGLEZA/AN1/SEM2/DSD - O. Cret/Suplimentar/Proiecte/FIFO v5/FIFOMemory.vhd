library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_UNSIGNED.all;
entity MEMORY is
	port(CE_WR,CE_RD: in std_logic;
	CLK: in std_logic;
	AR,AW: inout std_logic_vector(3 downto 0);
	DATAIN: in std_logic_vector(7 downto 0);
	DATAOUT: out std_logic_vector(7 downto 0));
end MEMORY;
architecture ARHMEMORY of MEMORY is	
type memory is array (0 to 255) of std_logic_vector(7 downto 0);
signal RAM: memory :=(others=>(others=>'0'));
component C4U is
	port( C,CLK: in std_logic;
	U: out std_logic_vector(3 downto 0));
end component;
begin	 
	Numarator1: C4U port map(CE_WR,CLK,AW);
	Numarator2: C4U port map(CE_RD,CLK,AR);
	process(CE_WR,AW,CLK,CE_RD)
	begin
	if (CLK'EVENT and CLK='1' and CE_WR='1') then
		RAM(conv_integer(AW))<=DATAIN;
	elsif (CLK'EVENT and CLK='1' and CE_RD='1') then
		DATAOUT<=RAM(conv_integer(AR));
	end if;	   
	end process;
end ARHMEMORY;
