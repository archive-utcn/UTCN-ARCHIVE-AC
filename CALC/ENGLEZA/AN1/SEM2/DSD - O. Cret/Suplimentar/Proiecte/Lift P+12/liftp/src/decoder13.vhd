	
	library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity decoder1 is
 port(a:in std_logic_vector(3 downto 0);
      b:out std_logic_vector(12 downto 0));
	  end decoder1;
	  
architecture arh of decoder1 is
begin
process(a)
  variable f:std_logic_vector(12 downto 0);
begin
case a is 
   when "0000"=>f:="0000000000001";
   when "0001"=>f:="0000000000010";
   when "0010"=>f:="0000000000100";
   when "0011"=>f:="0000000001000";
   when "0100"=>f:="0000000010000";
   when "0101"=>f:="0000000100000";
   when "0110"=>f:="0000001000000";
   when "0111"=>f:="0000010000000";
   when "1000"=>f:="0000100000000";
   when "1001"=>f:="0001000000000";
   when "1010"=>f:="0010000000000";
   when "1011"=>f:="0100000000000";
   when "1100"=>f:="1000000000000";
   when others=>f:="0000000000000";
   end case;
   b<=f;
end process;
end arh;