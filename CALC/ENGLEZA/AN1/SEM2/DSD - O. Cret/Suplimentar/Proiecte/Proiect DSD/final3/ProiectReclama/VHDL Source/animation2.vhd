library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_two_counter is		   --clipeste intreg cuvantul
	port(CLK:in std_logic;
	RST:std_logic;
	q:out std_logic_vector(2 downto 0));
end anim_two_counter;

architecture anim_two_counter_a of anim_two_counter is	
begin
	process(CLK,RST)
	variable c:std_logic_vector(2 downto 0);
	begin	
		if(RST='1') then 
			c:="000";					   
		else if(CLK'EVENT and CLK='1') then
			if (c="001") then c:="000";	  --2 stari:oprit sau pornit
			else 
				c:=c+1;
			end if;
			end if;
		end if;
		q<=c;
		end process;
end anim_two_counter_a;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_two is
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end anim_two;

architecture anim_two_a of anim_two is	 
component anim_two_ROM is
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(11 downto 0));
end component;	
component anim_two_counter
	port(CLK:in std_logic;
	RST:std_logic;
	q:out std_logic_vector(2 downto 0));
end component;
signal letter_data:std_logic_vector(11 downto 0);
signal state:std_logic_vector(2 downto 0);
begin
	MEM: anim_two_ROM port map (state, letter_data);  
	COUNT: anim_two_counter port map(CLK,RST,state);
	process(RST,enable,letter_data,disp)
	begin
	if RST='1' then 
		anim_out_addr<="000";
	else
		if enable='1' then
			case disp is
				when "1110" => anim_out_addr<=letter_data(2 downto 0);
				when "1101" => anim_out_addr<=letter_data(5 downto 3);
				when "1011" => anim_out_addr<=letter_data(8 downto 6);
				when "0111" => anim_out_addr<=letter_data(11 downto 9);
				when others => anim_out_addr<="000";
			end case;
		end if;
	end if;
	end process;
end anim_two_a;