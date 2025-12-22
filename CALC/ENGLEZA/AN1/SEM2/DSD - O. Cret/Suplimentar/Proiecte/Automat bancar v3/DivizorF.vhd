library	ieee;
use ieee.std_logic_1164.all;	   
use ieee.std_logic_unsigned.all;

entity divizor is
	port ( clk,enable : in std_logic;
	div_out : out std_logic);
end entity;

architecture Arh of divizor is
begin
	process(clk)
	variable var : std_logic_vector (24 downto 0) := "0000000000000000000000000";
	begin
	if enable='1' then
		if ( (clk='1') and (clk'EVENT) ) then
			var := var+1;
			if (var(24)='1') then
				div_out<='1';
			else
				div_out<='0';
			end if;
		end if;			  
	else
		div_out<='Z';
	end if;
	end process;
end architecture;
	
		
		