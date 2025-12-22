library ieee;
use ieee.std_logic_1164.all;	
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity my_circuit is
	port(din,clk,r:in std_logic;
	q:out std_logic_vector(3 downto 0));
end my_circuit;
architecture arh of my_circuit is 
signal iclk:std_logic;
signal iq:std_logic_vector(3 downto 0);
begin
shift_register: process(clk,r)
variable intq:std_logic_vector(3 downto 0);
begin
	if r='1' then intq:="0000";
	else if(clk'event) and (clk='1') then for i in 0 to 2 loop
		intq(i):=intq(i+1);
	end loop; intq(3):=din;
	end if;
end if;
iq<=intq;
end process shift_register;
counter:process(iclk,r)
variable intq:std_logic_vector(3 downto 0);
begin
	if r='1' then intq:="0000";
	else if(iclk'event)and(clk='1') then intq:=intq+1;
	end if;
	end if;
	q<=intq;
end process counter;
gate:process(iq)
begin
	iclk<=(not iq(3) and not iq(0) and iq(2) and iq(1));
end process gate;
end arh;
	