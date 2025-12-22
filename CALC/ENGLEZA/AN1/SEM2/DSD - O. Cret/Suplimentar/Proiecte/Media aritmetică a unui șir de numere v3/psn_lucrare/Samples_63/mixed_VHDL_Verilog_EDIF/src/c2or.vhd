library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity C2OR is
	port (CP :in  STD_LOGIC;
		CM :in  STD_LOGIC;
		RESET : in STD_LOGIC;
		Q  :out STD_LOGIC;
		NQ :out STD_LOGIC);
end entity C2OR;

architecture C2OR of C2OR is
	signal CLK :STD_LOGIC;
	signal S :STD_LOGIC ;
begin
	CLK <= CP or CM;
	
	process (CLK,RESET)
	begin			  
		if To_X01(RESET)='1' then
			S <='0';
		else
			if FALLING_EDGE(CLK) then
				S <=not S;
			end if;
		end if;
	end process;
	
	Q <= S;
	NQ <= not S;
end architecture C2OR;
