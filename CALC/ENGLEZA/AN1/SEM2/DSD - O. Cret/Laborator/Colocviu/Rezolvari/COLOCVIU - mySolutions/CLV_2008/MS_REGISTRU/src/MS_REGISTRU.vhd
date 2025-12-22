library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity REGISTRU_UNIVERSAL is					 
	port(sl,sr,load,reset, sin: in std_logic;
	data: in std_logic_vector(3 downto 0);
	output: out std_logic_vector( 3 downto 0));
end REGISTRU_UNIVERSAL;

architecture arh of REGISTRU_UNIVERSAL is	
signal clock: std_logic :='1';
begin  
	
	tact: process
			begin
			clock<='0';
			wait for 5 ns;
			clock<='1';
			wait for 5 ns;
	end process; 
	
	registru: process(clock,sl,sr,load,reset,sin,data)
	variable temp: std_logic_vector(3 downto 0):= (others=>'0');
	begin
		if clock'event and clock='1' then
			
			if(reset='1') then temp:="0000";
		   
			elsif (load='1') then temp:=data;
		   
			elsif (sr='1') then temp(2 downto 0):=temp(3 downto 1);
			   					temp(3):=sin;
			
			elsif (sl='1') then temp(3 downto 1):=temp(2 downto 0);
				temp(0):=sin;
			end if;
		end if;	
	output<=temp;
	end process;
end architecture arh;


--MS

library ieee;
use ieee.std_logic_1164.all;

entity MS_REGISTRU_UNIVERSAL is
end MS_REGISTRU_UNIVERSAL;

architecture arh of MS_REGISTRU_UNIVERSAL is

component REGISTRU_UNIVERSAL is
	port(sl,sr,load,reset, sin: in std_logic;
	data: in std_logic_vector(3 downto 0);
	output: out std_logic_vector(3 downto 0));
end component REGISTRU_UNIVERSAL;

signal sl,sr,load,reset,sin: std_logic;
signal data: std_logic_vector(3 downto 0);
signal output: std_logic_vector( 3 downto 0);

begin
	UST: REGISTRU_UNIVERSAL port map(sl=>sl,sr=>sr,load=>load,reset=>reset,sin=>sin,data=>data,output=>output);
	STIMULI: process
	begin	
		sl<='0','1' after 30 ns,'0' after 70 ns;
		sr<='0', '1' after 70 ns;
		load<= '1','0' after 20 ns;																 
		reset<='0', '1' after 20 ns,'0' after 30 ns,'1' after 130 ns;
		sin<='0','1' after 10 ns,'0' after 20 ns,'1' after 30 ns,'0' after 40 ns, '1' after 50 ns,'1' after 60 ns,'0' after 70 ns,'0' after 80 ns,'1' after 90 ns,'0' after 100 ns,'1' after 110 ns,'0' after 120 ns;
		data<="0101","0111" after 10 ns;
		wait;
	end process;
			

end architecture arh;
