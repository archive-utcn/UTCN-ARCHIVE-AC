library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
uSE ieee.numeric_std.all;
uSE ieee.std_logic_arith.all;	   
use ieee.std_logic_unsigned.all; 



entity CharGenerator is	 
	
	port ( 	
	--- Inputs 	
	
	CLK : in STD_Logic ;-- Clk 100 Hz
	s: in STD_LOGIC_VECTOR(1 downto 0); 
	-- Outputs
	
	CHAR0 : out STD_Logic_Vector(6 downto 0);
    CHAR1 : out STD_Logic_Vector(6 downto 0);	
    CHAR2 : out STD_Logic_Vector(6 downto 0);
    CHAR3 : out STD_Logic_Vector(6 downto 0)
	)  ;	  
	
end CharGenerator ;	  



architecture A of CharGenerator is 	  			 

begin										   
	
	process(CLK) begin	 
		if rising_edge(CLK) then
			case s is		--Switch cases for modes   
				
		    when "00" =>	-- Mode 1  
			
				CHAR0 <= "0100011";	   
				CHAR1 <= "0110011";
				CHAR2 <= "0001011";
				CHAR3 <= "0101011";	   
				
		    when "01" =>	-- Mode 2
			
				CHAR0 <= "1100001";
				CHAR1 <= "1111111";
				CHAR2 <= "1000000";
				CHAR3 <= "1111111";	
			
		    when "10" =>	-- Mode 3 
			
				CHAR0 <= "0111011";	   
				CHAR1 <= "0110001";
				CHAR2 <= "1101011";
				CHAR3 <= "1101011";		
			
		    when "11" =>	-- Mode 4
			
				CHAR0 <= "1111111";	   
				CHAR1 <= "1111111";
				CHAR2 <= "1111111";
				CHAR3 <= "1111111";	
			
		    when others =>	 
			
	  		end case;	   
	  	end if;
	end process;

end A;