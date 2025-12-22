----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:19:26 04/29/2015 
-- Design Name: 
-- Module Name:    counter_sum - Behavioral 
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

entity counter_sum is
 port( 
       options: in std_logic;
       clock0: in std_logic;      -- Exapmle: if you push 3 times clock0 it means 3*10=30 EURO;
       clock1: in std_logic;		 -- Example: if you push 5 times clock1 it menas 5*100=500 EURO; 
       clock2: in std_logic;      -- End of giving the sum (clock_end);
		 money: inout NATURAL       -- The result of pushing clock0 and clock1;
		 );
end counter_sum;

architecture forming_the_sum of counter_sum is

 signal count_clock0, count_clock1: natural:=0;
 signal nr_money: natural :=0;

begin

P1: process(options,clock0,count_clock0,clock1,count_clock1,clock2)
    begin
	 
  if options='1' then
	  if clock0'EVENT and clock0='1'  then count_clock0 <= count_clock0 +1;  -- numbering how much the decimal part is;
	                                       if count_clock0 > 10 then count_clock0 <= 0; --The  can't be higher than 10;
	                                       end if;
													   end if;
	
	  if clock1'EVENT and clock1='1'  then count_clock1 <= count_clock1 +1;  -- numbering how much the hundred part is;
	                                       if count_clock0 > 100 then count_clock0 <= 0; --the  can't be higher than 1000 which means 1000 euro; 
	                                       end if;
													   end if;
  end if;
   
  nr_money<=count_clock0*10 + count_clock1*100;    -- calculating the sum;
  
  if options='0'  then count_clock0<=0; count_clock1<=0; end if;  -- RESETTING;
	
end process P1;
	
	
	
 P2: process(options,clock2,nr_money)
     begin
  
    if clock2'EVENT and clock2='1' and options='1' 
       then money<=nr_money;
    end if;
 
 end process P2;


end forming_the_sum;

