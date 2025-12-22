library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anod_ctrl is
	port(CLK: in std_logic;
	RST:in std_logic;
	D:out std_logic_vector(3 downto 0));
end anod_ctrl;

architecture anod_ctrl_a of anod_ctrl is
begin
	process(CLK,RST)
	variable c:std_logic_vector(3 downto 0);
	begin									
		if (RST='1') then
			c:="1110";
		else
			if(CLK'EVENT and CLK='1') then	
				case c is
					when "1110" =>c:="1101";
					when "1101" =>c:="1011";
					when "1011" =>c:="0111";
					when others =>c:="1110";
				end case;
			end if;
		end if;
		D<=c;
	end process;
end anod_ctrl_a;