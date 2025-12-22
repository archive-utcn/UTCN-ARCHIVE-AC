library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity unit is
	port( IEUD : in STD_LOGIC_VECTOR(3 downto 0);
	    -- OUT_NUM: in STD_LOGIC_VECTOR(3 downto 0);  
	  UP: in STD_LOGIC;
	CLK_NUM: out STD_LOGIC);
end unit;

architecture comp of unit is 
signal  OUT_NUM5: STD_LOGIC_VECTOR(3 downto 0);
begin
	--OUT_NUM5<=OUT_NUM after 1 ns;
	process(ieud,up)
	variable varclk_num:std_logic;
	begin 
		if IEUD(3)='0' and IEUD(2)='0'  then varCLK_NUM:='1';
		elsif IEUD(3)='1' then varCLK_NUM:='0';
		elsif UP='0' then if IEUD(0)='1' then varCLK_NUM:='0';
		                   else varCLK_NUM:='1';
						   end if;
		else if IEUD(1)='1' then varCLK_NUM:='0';
		else varCLK_NUM:='1' ;
		
		end if;
		end if;	
		clk_num<=varclk_num,'0' after 5 ns;
		end process; 
		 
	end comp;
			 