----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:32:17 05/02/2015 
-- Design Name: 
-- Module Name:    memory_money - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory_money is
port( actualization: in std_logic;
      options: in std_logic;
      pin: in std_logic_vector(2 downto 0);
      okpin: in std_logic;
      eliberate_amountOfmoney: inout natural;
      clock_end: in std_logic;
		remained_money: inout natural;
		okmoney: out std_logic);

end memory_money;

architecture money of memory_money is

  type memory_sum is array(4 downto 0) of natural;

  signal sum: memory_sum:=( 0=>5450, 1=>7100, 2=>2000, 3=>745, 4=>8299); --example: client nr 0 have 5450 Euro;
  signal inter : natural:=0;

 begin


  --this process makes the substraction between the current-sold and the amount we extract; 
  P1:process(options,pin,okpin,eliberate_amountOfmoney,clock_end)
     begin
	  
   okmoney<='0';
	 
   if okpin = '1' and options='1' and clock_end='1'    then 
   
	  case pin is
	  
		 when "101" => if sum(0) > eliberate_amountOfmoney then inter<=  sum(0)- eliberate_amountOfmoney; --eliberate_amountOfmoney;
		                                                        okmoney <='1';
																				 -- remained_money <=  sum(0)- eliberate_amountOfmoney;
																		   else inter <= sum(0); okmoney <='0'; 
							end if;
		               
						
		when "100" => if sum(1) > eliberate_amountOfmoney then inter<= sum(1)- eliberate_amountOfmoney;
		                                                       okmoney <='1';
																			--	 remained_money <=  sum(0)- eliberate_amountOfmoney;
																		  else inter <= sum(1); okmoney <='0';
						  end if;
		               
							
	   when "010" => if sum(2) > eliberate_amountOfmoney then inter<=  sum(2)- eliberate_amountOfmoney;
		                                                       okmoney <='1';
																		  else inter <= sum(2); okmoney <='0'; 
						  end if;
		               
							
	   when "011" => if sum(3) > eliberate_amountOfmoney then inter <=  sum(3) -eliberate_amountOfmoney; 
		                                                       okmoney <='1';
																		  else inter <= sum(3); okmoney <='0'; 
						  end if;
							
							
		when "111" => if sum(4) > eliberate_amountOfmoney then inter <= sum(4) - eliberate_amountOfmoney;
		                                                       okmoney <='1';
																		  else inter <= sum(4); okmoney <='0';
						 end if;
						 
	   when others => null;
		
	end case;
end if;


end  process P1;

----Actualization, Interogation Sold----------------
P2: process(actualization)
    begin
	 
  if actualization='1' and actualization'EVENT   then
  
    case pin is
		when "101" =>  sum(0)<=inter;
		              remained_money <=inter;
							
		               
		when "100" => sum(1) <= inter;
		              remained_money <=inter;
		               
							
	   when "010" => sum(2) <= inter;
		             remained_money <=inter;
		             
							
	   when "011" => sum(3) <=inter;
		              remained_money <=inter;
		 				
							
		when "111" => sum(4) <= inter;
		             remained_money <=inter;
		when others => null;
		
	end case;
 end if;
 
	---The Client wants just interogation of sold;-----
	
 if options = '0'  and okpin='1' then  
	 
	 case pin is
	 
		when "101" => remained_money <= sum(0);
		               
		when "100" => remained_money <= sum(1);
		               
		when "010" => remained_money <= sum(2);
		               
		when "011" => remained_money <= sum(3);
							
		when "111" => remained_money <= sum(4);
	   when others => null;
		
	end case;
end if;	 
end process P2;	


end money;

