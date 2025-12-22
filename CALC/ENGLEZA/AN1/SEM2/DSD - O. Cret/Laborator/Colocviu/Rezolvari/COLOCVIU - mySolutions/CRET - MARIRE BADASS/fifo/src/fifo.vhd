library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity fifo is
	port( clock,reset,we,re: in std_logic;
	empty,full: out std_logic;
	dataIn: in std_logic_vector(3 downto 0);
	dataOut: out std_logic_vector(3 downto 0));
end entity fifo;

architecture arh of fifo is

shared variable tempty,tfull: std_logic;
shared variable pos: integer range 0 to 4;
type mem is array (3 downto 0) of std_logic_vector( 3 downto 0);
shared variable m: mem:=("0000","0000","0000","0000");

begin
	process(clock,reset,we,re,dataIn)
	begin
		if clock'event and clock='1' then
			
			if reset='1' then 
				tempty:='1';
				tfull:='0';
				pos:=0;
				
			elsif we='1' and tfull='0'  then
				m(pos):=dataIn;
				pos:=pos+1;
				tempty:='0'			;
				if(pos=4) then tfull:='1';
				end if;
				
			elsif re='1' and tempty='0' then
				dataOut<=m(0);
				m(2 downto 0):= m(3 downto 1);
				m(pos-1):="0000";
				pos:=pos-1;		
				tfull:='0';
				if pos=0 then tempty:='1';
				end if;
				
			end if;
			end if;
			empty<=tempty;
			full<=tfull;
			end process;
			end architecture arh;
			
				