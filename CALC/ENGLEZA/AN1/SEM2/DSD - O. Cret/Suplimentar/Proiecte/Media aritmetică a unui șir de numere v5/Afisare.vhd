											 library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity display is
port (
nr: in std_logic_vector(7 downto 0);
avg: in std_logic_vector(7 downto 0):="11101110";
clk: in std_logic;
anod: out std_logic_vector(3 downto 0);
catod: out std_logic_vector(7 downto 0)
);
end display;

architecture architecture_display of display is
begin
	process(clk)
	variable clk_div:integer:=0;
	variable digit_idx:bit:='0';
	variable group_idx:bit:='0';
	variable segs:std_logic_vector(7 downto 0):=("11111111");
	begin
		if(rising_edge(clk)) then
			if (clk_div=4999) then
				clk_div:=0;
			
				if(group_idx='0') then
					
					if(digit_idx='0') then
						anod <= "0111";
					else
						anod <= "1011";
					end if;
				else
					if(digit_idx='0') then
						anod <= "1101";
					else
						anod <= "1110";
					end if;
				end if;
				if(group_idx='0') then
					if(digit_idx='0') then
						case nr(7 downto 4) is
							when "0000" => segs := "00000011"; -- 0
							when "0001" => segs := "10011111"; -- 1
							when "0010" => segs := "00100101"; -- 2
							when "0011" => segs := "00001101"; -- 3
							when "0100" => segs := "10011001"; -- 4
							when "0101" => segs := "01001001"; -- 5
							when "0110" => segs := "01000001"; -- 6   
							when "0111" => segs := "00011111"; -- 7
							when "1000" => segs := "00000001"; -- 8
							when "1001" => segs := "00001001"; -- 9
							when "1010" => segs := "00010001"; -- A
							when "1011" => segs := "11000001"; -- b
							when "1100" => segs := "11100101"; -- c
							when "1101" => segs := "10000101"; -- d
							when "1110" => segs := "01100001"; -- E
							when others => segs := "01110001"; -- F
						end case;		
						catod<=segs;
					else
						case nr(3 downto 0) is
							when "0000" => segs := "00000011"; -- 0
							when "0001" => segs := "10011111"; -- 1
							when "0010" => segs := "00100101"; -- 2
							when "0011" => segs := "00001101"; -- 3
							when "0100" => segs := "10011001"; -- 4
							when "0101" => segs := "01001001"; -- 5
							when "0110" => segs := "01000001"; -- 6   
							when "0111" => segs := "00011111"; -- 7
							when "1000" => segs := "00000001"; -- 8
							when "1001" => segs := "00001001"; -- 9
							when "1010" => segs := "00010001"; -- A
							when "1011" => segs := "11000001"; -- b
							when "1100" => segs := "11100101"; -- c
							when "1101" => segs := "10000101"; -- d
							when "1110" => segs := "01100001"; -- E
							when others => segs := "01110001"; -- F
							end case;		
							catod<=segs;
					end if;
					digit_idx:=not(digit_idx);
				
				else 
					if(digit_idx='0') then
						case avg(7 downto 4) is
							when "0000" => segs := "00000011"; -- 0
							when "0001" => segs := "10011111"; -- 1
							when "0010" => segs := "00100101"; -- 2
							when "0011" => segs := "00001101"; -- 3
							when "0100" => segs := "10011001"; -- 4
							when "0101" => segs := "01001001"; -- 5
							when "0110" => segs := "01000001"; -- 6   
							when "0111" => segs := "00011111"; -- 7
							when "1000" => segs := "00000001"; -- 8
							when "1001" => segs := "00001001"; -- 9
							when "1010" => segs := "00010001"; -- A
							when "1011" => segs := "11000001"; -- b
							when "1100" => segs := "11100101"; -- c
							when "1101" => segs := "10000101"; -- d
							when "1110" => segs := "01100001"; -- E
							when others => segs := "01110001"; -- F
						end case;		
						catod<=segs;
					else 
						case avg(3 downto 0) is
							when "0000" => segs := "00000011"; -- 0
							when "0001" => segs := "10011111"; -- 1
							when "0010" => segs := "00100101"; -- 2
							when "0011" => segs := "00001101"; -- 3
							when "0100" => segs := "10011001"; -- 4
							when "0101" => segs := "01001001"; -- 5
							when "0110" => segs := "01000001"; -- 6   
							when "0111" => segs := "00011111"; -- 7
							when "1000" => segs := "00000001"; -- 8
							when "1001" => segs := "00001001"; -- 9
							when "1010" => segs := "00010001"; -- A
							when "1011" => segs := "11000001"; -- b
							when "1100" => segs := "11100101"; -- c
							when "1101" => segs := "10000101"; -- d
							when "1110" => segs := "01100001"; -- E
							when others => segs := "01110001"; -- F
						end case;		
						catod<=segs;
					end if;
					digit_idx:=not(digit_idx);
				end if;
				if digit_idx='1' then 
					group_idx:=not(group_idx);
				end if;
					
			else
				
				clk_div:=clk_div+1;
			end if;
		end if;
	end process;
end architecture;


