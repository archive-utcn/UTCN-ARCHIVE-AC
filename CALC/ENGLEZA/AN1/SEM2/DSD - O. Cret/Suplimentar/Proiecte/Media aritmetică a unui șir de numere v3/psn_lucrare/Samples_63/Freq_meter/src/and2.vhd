 

library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is
    port (
        A0: in STD_LOGIC;
        A1: in STD_LOGIC;
        Y: out STD_LOGIC
    );
end and2;

architecture and2 of and2 is
begin	 
  Y <= A0 and A1;
end and2;
