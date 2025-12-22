library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ram_suma is
port (Clk : in std_logic;
        address : in std_logic_vector(2 downto 0);
        we : in std_logic;
		  cs : in std_logic;
        data_i : in std_logic_vector(9 downto 0);
        data_o : out std_logic_vector(9 downto 0)
     );
end ram_suma;

architecture comportamental of ram_suma is

type ram_t is array (7 downto 0) of std_logic_vector(9 downto 0);
signal ram : ram_t := ("0001110000",   
"0101010101",					
"0000011111",					   
"1100011111",
"0111010101",					
"0010111111",					   
"1100001111",
"0101010011");					   

begin

process(Clk)
begin
    if(CLK = '1' and CLK'EVENT and CS = '1') then
        if(we='1') then
            ram(conv_integer(address)) <= data_i;
        else
        data_o <= ram(conv_integer(address));
    	end if;
	end if;
end process;
end comportamental;