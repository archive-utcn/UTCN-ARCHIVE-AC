library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity detect is
	port ( DIN , CLK, RESET : in std_logic;
	Q : out std_logic_vector (3 downto 0));
end detect;

architecture arh of detect is
signal iQ : std_logic_vector ( 3 downto 0) := "0000";
signal iCLK: std_logic;
begin  
	
	shift_reg: process(CLK, RESET)
	variable intQ : std_logic_vector (3 downto 0) := "0000";
	begin
		if RESET='1' then
			intQ := "0000";
		else
			if (CLK'event and CLK='1') then
				for i in 0 to 2 loop	
					intQ(i) := intQ(i+1); 
				end loop;	
			intQ(3) := DIN;	
			end if;
		end if;
	iQ<= intQ;			   
	end process shift_reg; 
	
	counter : process (iCLK,RESET)
	variable intQ: std_logic_vector (3 downto 0) := "0000"; 
	begin
		if (RESET = '1') then
			intQ := "0000";
		else
			if iCLK'event and iCLK='1'
			then
			intQ := intQ + 1;
			end if;		   
		end if;
		Q <= intQ;
	end process counter;
	
	gate: process (iQ)
	begin
		iCLK <= not iQ(3) and iQ(2) and iQ(1) and not iQ(0);
	end process gate;
	
end arh;
	