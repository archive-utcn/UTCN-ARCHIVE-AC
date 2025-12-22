library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lifo is
	port( clock,reset, we,re: in std_logic;
	empty,full: out std_logic;
	datain: in std_logic_vector(3 downto 0);
	dataout: out std_logic_vector( 3 downto 0));
end entity lifo;

architecture arh of lifo is

shared variable tempty,tfull: std_logic;
shared variable pos: integer range 0 to 4;
type mem is array ( 3 downto 0) of std_logic_vector(3 downto 0);
shared variable m: mem:=("0000","0000","0000","0000");

begin
	
	process(clock,reset,re,we,datain)
	begin
		if clock'event and clock='1' then
			
			if reset='1'  then
				tempty:='1';
				tfull:='0';
				pos:=0;
				
			elsif we='1'and tfull='0' then
				m(pos):=datain;
				pos:=pos+1;
				tempty:='0';
				if (pos=4) then tfull:='1';
				end if;
				
			elsif re='1' and tempty='0' then
				dataout<=m(pos-1);
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