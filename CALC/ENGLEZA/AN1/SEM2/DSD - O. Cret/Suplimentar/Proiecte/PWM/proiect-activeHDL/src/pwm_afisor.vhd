library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity afis is
	port(value: in STD_LOGIC_VECTOR(15 downto 0);
		clk: in STD_LOGIC;
		clr: in STD_LOGIC;
		display: out STD_LOGIC_VECTOR(6 downto 0);
		anod: out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture pwm_afisor of afis is
	signal sel: STD_LOGIC_VECTOR(1 downto 0);		-- selectie
	signal digit: STD_LOGIC_VECTOR(3 downto 0);		-- valoarea afisorului
	signal clk_div: STD_LOGIC_VECTOR(18 downto 0);	-- divizor de clock
begin
	sel <= clk_div(18 downto 17);	-- Selectia
	
	process(sel, value)
	begin
		case sel is
			when "00" => digit <= value(3 downto 0);
			when "01" => digit <= value(7 downto 4);
			when "10" => digit <= value(11 downto 8);
			when others => digit <= value(15 downto 12);
		end case;
	end process;
	
	process(digit)
	begin
		case digit is
			when "0000" => display  <= "1000000";  -- 0
			when "0001" => display  <= "1111001";  -- 1
			when "0010" => display  <= "0100100";  -- 2
			when "0011" => display  <= "0110000";  -- 3
			when "0100" => display  <= "0011001";  -- 4 
			when "0101" => display  <= "0010010";  -- 5
			when "0110" => display  <= "0000010";  -- 6
			when "0111" => display  <= "1111000";  -- 7
			when "1000" => display  <= "0000000";  -- 8
			when "1001" => display  <= "0010000";  -- 9
			when others => display  <= "1111111"; 
		end case;
	end process;
	
	process(sel, clr)
	begin
		anod <= "1111";
		if clr = '0' then
			anod(conv_integer(sel)) <= '0';
		end if;
	end process;
	
	process(clk, clr)
	begin
		if clr = '1' then
			clk_div <= (others => '0');
		elsif clk'event and clk = '1' then
			clk_div <= clk_div + 1;
		end if;
	end process;
	
end pwm_afisor;
