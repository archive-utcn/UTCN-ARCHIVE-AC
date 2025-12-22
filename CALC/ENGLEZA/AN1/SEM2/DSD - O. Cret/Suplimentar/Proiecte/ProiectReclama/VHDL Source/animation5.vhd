library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_five_counter is	  					--Apar caractere în succesiune rapida,
	port(CLK:in std_logic;						   --textul "blocându-se" caracter cu caracter
	RST:in std_logic;
	O:out std_logic_vector(2 downto 0));
end entity;

architecture anim_five_counter_a of anim_five_counter is
begin
	process(CLK,RST)
	variable c:std_logic_vector(2 downto 0);
	begin
		if (RST='1') then
			c:="000";
		elsif (CLK'EVENT and CLK='1') then
			if (c="111") then
				c:="000";
			else
				c:=c+1;
			end if;
			end if;
		O<=c;
	end process;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_five_counter_b is	  
	port(CLK:in std_logic;
	RST:in std_logic;
	O:out std_logic_vector(2 downto 0));
end entity;

architecture anim_five_counter_b_a of anim_five_counter_b is
begin
	process(CLK,RST)
	variable c:std_logic_vector(2 downto 0);
	variable delay:std_logic;
	begin
		if (RST='1') then
			c:="000";
			delay:='0';
		else
			if (CLK'EVENT and CLK='1') then
				if (delay='0') then 
					delay:='1';
				else
					if (c="100") then
						c:="000";
						delay:='0';
					else
						c:=c+1;
						delay:='0';
					end if;
				end if;
			end if;
		end if;
		O<=c;
	end process;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_five_clock is	  	 --text flows right to left
	port(Main_CLK:in std_logic;
	RST:in std_logic;
	New_CLK:out std_logic);
end entity;

architecture anim_five_clock_a of anim_five_clock is
begin
	process(Main_CLK,RST)					   
	variable count:std_logic_vector(21 downto 0);
	variable k:std_logic;
	begin
			if (RST='1') then
				count:=(others=>'0');
				New_CLK<='0';
				k:='0';
			else			 
				if (Main_CLK'EVENT and Main_CLK='1') then 
					if count=3000000 then
						k:=not(k);
						New_CLK<=k;
						count:=(others=>'0');
					else
						count:=count+1;
				end if;
			end if;
		end if;
	end process;
end architecture;  

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_five is
	port(CLK:in std_logic;
	boardCLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end entity;	 


architecture anim_five_a of anim_five is 	 

component anim_five_ROM
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(11 downto 0));
end component;

component anim_five_counter
	port(CLK:in std_logic;
	RST:std_logic;
	O:out std_logic_vector(2 downto 0));
end component;

component anim_five_counter_b
	port(CLK:in std_logic;
	RST:std_logic;
	O:out std_logic_vector(2 downto 0));
end component;

component anim_five_clock
	port(Main_CLK:in std_logic;
	RST:in std_logic;
	New_CLK:out std_logic);
end component;
	
signal letter_data:std_logic_vector(11 downto 0);
signal state:std_logic_vector(2 downto 0);
signal random_state:std_logic_vector(2 downto 0);
signal fastCLK:std_logic;
begin

	MEM: anim_five_ROM port map (random_state, letter_data);
	CLOCK_FAST: anim_five_clock port map(boardCLK,RST,fastCLK);
	COUNT_FAST: anim_five_counter port map(fastCLK,RST,random_state);
	COUNT: anim_five_counter_b port map(CLK,RST,state);
	
	process(RST,enable,letter_data,disp,state)
	begin
	if RST='1' then 
		anim_out_addr<="000";
	else
		if enable='1' then
				case state is
					when "000" =>
						case disp is
							when "1110" => anim_out_addr<=letter_data(2 downto 0);
							when "1101" => anim_out_addr<=letter_data(5 downto 3);
							when "1011" => anim_out_addr<=letter_data(8 downto 6);
							when "0111" => anim_out_addr<=letter_data(11 downto 9);
							when others => anim_out_addr<="000";
						end case;
					when "001" =>
						case disp is
							when "1110" => anim_out_addr<=letter_data(2 downto 0);
							when "1101" => anim_out_addr<=letter_data(5 downto 3);
							when "1011" => anim_out_addr<=letter_data(8 downto 6);
							when "0111" => anim_out_addr<="001";
							when others => anim_out_addr<="000";
						end case;
					when "010" =>
						case disp is
							when "1110" => anim_out_addr<=letter_data(2 downto 0);
							when "1101" => anim_out_addr<=letter_data(5 downto 3);
							when "1011" => anim_out_addr<="010";
							when "0111" => anim_out_addr<="001";
							when others => anim_out_addr<="000";
						end case;
					when "011" =>
						case disp is
							when "1110" => anim_out_addr<=letter_data(2 downto 0);
							when "1101" => anim_out_addr<="001";
							when "1011" => anim_out_addr<="010";
							when "0111" => anim_out_addr<="001";
							when others => anim_out_addr<="000";
						end case;
					when "100" =>
						case disp is
							when "1110" => anim_out_addr<="011";
							when "1101" => anim_out_addr<="001";
							when "1011" => anim_out_addr<="010";
							when "0111" => anim_out_addr<="001";
							when others => anim_out_addr<="000";
						end case;
					when others => anim_out_addr<="000";
				end case;
		end if;
	end if;
	end process;
end architecture;
	
