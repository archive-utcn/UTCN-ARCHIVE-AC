library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

	entity demux is
	port(q:in std_logic_vector(3 downto 0);
	sel:in std_logic_vector(1 downto 0);
	clk:in std_logic;
	e,w,r:out std_logic_vector(3 downto 0));
end demux;

architecture arh of demux is
begin
	process(sel,q,clk)
	begin 
		if (clk='1' and clk'event) then
		   
			if sel="01" then e<=q;w<="UUUU";r<="UUUU";
			elsif sel="10" then w<=q;e<="UUUU";r<="UUUU";
				elsif sel="11" then r<=q;w<="UUUU";e<="UUUU";
		 end if;
		 end if;
	end process;
	end arh;