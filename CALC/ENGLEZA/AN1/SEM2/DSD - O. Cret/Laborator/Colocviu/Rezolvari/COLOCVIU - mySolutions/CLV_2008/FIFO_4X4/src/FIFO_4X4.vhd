library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity FIFO_4X4 is
	port(clock, reset, WE,RE: in std_logic;
	Empty, Full: out std_logic;
	DataIn: in std_logic_vector(3 downto 0);
	DataOut: out std_logic_vector(3 downto 0));
end FIFO_4X4;

architecture arh of FIFO_4X4 is
 
shared variable tEmpty, tFull: std_logic;
shared variable Pos: integer range 0 to 4;
type mem is array ( 3 downto 0 ) of std_logic_vector(3 downto 0);
shared variable M: mem:=("0000", "0000", "0000", "0000");

begin
	process(clock,reset,WE,RE,DataIn)
	begin
		if clock'event and clock='1' then
			
			if reset='1' then 
				tEmpty:='1';
				tFull:='0';
				Pos:=0;
			
			elsif WE='1' and tFull='0' then 
				M(Pos):=DataIn;
				Pos:=Pos+1;
				tEmpty:='0';
				if( Pos = 4 ) then tFull:='1';
				end if;
				
			elsif RE='1' and tEmpty='0' then
				DataOut<=M(0);
				M(2 downto 0):=M(3 downto 1);
				M(Pos-1):="0000";
				Pos:=Pos-1;
				tFull:='0';
				if(Pos =0) then tEmpty:='1';
				end if;
			
			end if;
			                
			Empty <= tEmpty;
			Full <= tFull;   
		
		end if;
		end process;
end architecture arh;