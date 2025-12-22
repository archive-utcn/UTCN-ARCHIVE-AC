library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FrequencyDivider is
	port( 	Clk, Reset : in STD_LOGIC;
			Q : out STD_LOGIC);
end entity;	

architecture Flash of FrequencyDivider is
begin
	process(CLK,Reset)
	variable QINt : STD_LOGIC_VECTOR (24 downto 0) := (others => '0');
	variable N : STD_LOGIC := '0';
	begin
		if Reset = '1' then
			if (Clk'event) and (Clk ='1') then
				QInt := QInt + 1;
				if QInt = "1011111010111100001000000" then
					Q <= N;
					QInt := (others => '0');
					N := not N;
				end if;
			end if;
		else
			Q <= '0';
		end if;
	end process;
end Flash;