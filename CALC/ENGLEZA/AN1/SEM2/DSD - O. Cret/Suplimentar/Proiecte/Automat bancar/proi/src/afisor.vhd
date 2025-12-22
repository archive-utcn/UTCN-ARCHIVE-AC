   library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity x7seg is
	port(
		x:inout std_logic_vector(15 downto 0);
		clk: in STD_LOGIC;
		clr: in STD_LOGIC;
		a_to_g: out STD_LOGIC_VECTOR(6 downto 0);
		an: out STD_LOGIC_VECTOR(3 downto 0)
	);
end x7seg;

architecture arh_x7seg of x7seg is
signal s: STD_LOGIC_VECTOR(1 downto 0);
signal digit: STD_LOGIC_VECTOR(3 downto 0);
signal clkdiv: STD_LOGIC_VECTOR(18 downto 0);
--signal x: STD_LOGIC_VECTOR(15 downto 0);

begin 
	s<=clkdiv(18 downto 17);
	
	process(s, x)
	begin
		CASE s IS
			WHEN "00" => digit <= x(3 downto 0);
			WHEN "01" => digit <= x(7 downto 4);
			WHEN "10" => digit <= x(11 downto 8);
			WHEN OTHERS => digit <= x(15 downto 12);
		END CASE;
	end process;

	-- Decodificare
	process(digit)
	begin
		CASE digit is
			when "0000"=> a_to_g <="1000000";  -- '0'
			when "0001"=> a_to_g <="1111001";  -- '1'
			when "0010"=> a_to_g  <="0100100";  -- '2'
			when "0011"=> a_to_g  <="0110000";  -- '3'
			when "0100"=> a_to_g  <="0011011";  -- '4' 
			when "0101"=> a_to_g  <="0010010";  -- '5'
			when "0110"=> a_to_g  <="0000010";  -- '6'
			when "0111"=> a_to_g  <="1111000";  -- '7'
			when "1000"=> a_to_g  <="0000000";  -- '8'
			when "1001"=> a_to_g  <="0010000";  -- '9'
			when "1010"=> a_to_g  <="0001000";  -- 'A'
			when "1011"=> a_to_g  <="0000011";  -- 'b'
			when "1100"=> a_to_g  <="1000110";  -- 'C'
			when "1101"=> a_to_g  <="0100001";  -- 'd'
			when "1110"=> a_to_g  <="0000110";  -- 'E'
			when "1111"=> a_to_g  <="0001110";  -- 'F'
			when others=> a_to_g  <="1111111"; 
		END CASE;
	end process;
	
	-- Selectare Anod
	process(s)
	begin
		an <= "1111";
		if clr = '0' then
			an(conv_integer(s)) <= '0';
		end if;
	end process;

--end process;
	-- Divizor ceas
	process(clk)
	begin
		if clr = '1' then
			clkdiv <= (others => '0');
		elsif clk'event and clk = '1' then
			clkdiv <= clkdiv + 1;
		end if;
			end process;
			
end arh_x7seg;