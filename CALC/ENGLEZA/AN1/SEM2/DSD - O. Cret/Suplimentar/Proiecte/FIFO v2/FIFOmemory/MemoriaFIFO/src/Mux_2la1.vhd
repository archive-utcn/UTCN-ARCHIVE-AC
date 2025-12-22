library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;	   

entity mux2to1 is
   Port ( A : in integer;
          B : in integer;
          S : in std_logic;
          Y : out integer);
end mux2to1;

architecture arh_mux of mux2to1 is
begin
   process(A, B, S)
   begin
   if(S = '1') then
       Y <= A;
   else
       Y <= B;
   end if;
   end process;
end arh_mux;