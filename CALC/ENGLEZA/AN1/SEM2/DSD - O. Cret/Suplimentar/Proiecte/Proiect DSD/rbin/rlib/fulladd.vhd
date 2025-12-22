library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fulladd is
    Port ( e0,e1 : in  std_logic;
			  cin : in  std_logic;
			  s,cout : out std_logic);
end fulladd;

architecture behav of fulladd is
begin
    s <= (e0 xor e1) xor cin;
    cout <= (e0 and e1) or (e0 and cin) or (e1 and cin);
end behav;

