library ieee;
use ieee.std_logic_1164.all;

entity BUFFER_TRI_STATE_8_BITI is
	port(x: in std_logic_vector(7 downto 0);
	e: in std_logic;
	o: out std_logic_vector(7 downto 0));
end BUFFER_TRI_STATE_8_BITI;

architecture arh of BUFFER_TRI_STATE_8_BITI is
begin
	process(x,e)
	begin
		if(e='1') then
			o<=x;
		else
			o<="ZZZZZZZZ";
		end if;
	end process;
end architecture arh;

--MS

library ieee;
use ieee.std_logic_1164.all;

entity MS_BUFFER_TRI_STATE_8_BITI is
end MS_BUFFER_TRI_STATE_8_BITI;

architecture arh of MS_BUFFER_TRI_STATE_8_BITI is 

 component BUFFER_TRI_STATE_8_BITI is
	port(x: in std_logic_vector(7 downto 0);
	e: in std_logic;
	o: out std_logic_vector(7 downto 0));
end component BUFFER_TRI_STATE_8_BITI;

signal x: std_logic_vector(7 downto 0);
signal e: std_logic;
signal o: std_logic_vector(7 downto 0);

begin
	UST: BUFFER_TRI_STATE_8_BITI port map(x=>x,e=>e,o=>o);
	STIMULI: process 									   
	begin
		x<="10101110";
		e<='1','0' after 40 ns;
		wait;
	end process;
end architecture arh;
