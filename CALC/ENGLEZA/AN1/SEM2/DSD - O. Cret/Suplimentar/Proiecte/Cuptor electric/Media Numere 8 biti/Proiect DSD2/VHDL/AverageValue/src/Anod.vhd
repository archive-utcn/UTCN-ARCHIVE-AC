library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AnodDevider is
	port(	Clk, Reset : in STD_LOGIC;
			Q : out STD_LOGIC);
end entity;

architecture Flash of AnodDevider is
begin
	process(Clk, Reset)
	variable QInt : STD_LOGIC_VECTOR (14 downto 0) := (others => '0');
	variable N : STD_LOGIC := '0';
	begin
		if Reset = '1' then
			if (Clk'event) and (Clk ='1') then
				QInt := QInt + 1;
				if QInt >= "110000110101000" then 
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