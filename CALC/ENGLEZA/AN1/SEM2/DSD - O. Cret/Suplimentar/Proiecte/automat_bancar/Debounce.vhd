
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Debounce is
    Port ( CLK_PLACA : in  STD_LOGIC;
           CLK_BUTON : in  STD_LOGIC;
           R : in  STD_LOGIC;
           CLK_Debounced : out  STD_LOGIC);
end Debounce;

architecture ARCH_Debounce of Debounce is
component DFF is port( 
    CLK_PLACA: in STD_LOGIC; 
	         R: in STD_LOGIC; 
				D: in STD_LOGIC;
				Q:out STD_LOGIC
				);
end component;

component freq_divider is
    Port ( CLK 	: in  STD_LOGIC;
           RST 	: in  STD_LOGIC;
           CLK0 	: out STD_LOGIC );
end component;

signal out_D0,out_D1,out_D2:STD_LOGIC;
signal CLK_DIV : STD_LOGIC;



begin
Divide:freq_divider port map( CLK_PLACA, R, CLK_DIV );
D0:DFF port map (CLK_DIV,R,CLK_BUTON,out_D0);
D1:DFF port map (CLK_DIV,R,out_D0,out_D1);
D2:DFF port map (CLK_PLACA,R,out_D1,out_D2);
CLK_Debounced <= out_D2 and out_D1 and out_D0;


end ARCH_Debounce;

