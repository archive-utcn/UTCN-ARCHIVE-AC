library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Filter is
	port (	Clk: in STD_LOGIC;
			ResetF, ResetD	: in STD_LOGIC;
			Length			: in STD_LOGIC_VECTOR  (2 downto 0);
			Control			: in STD_LOGIC_VECTOR  (2 downto 0);
			Anodes			: out STD_LOGIC_VECTOR (0 to 3);
			NumberOut		: out STD_LOGIC_VECTOR (0 to 7));
end Filter;

architecture Attempting1 of Filter is
	component DataGenerator is
		port ( 	Clk, Reset : in STD_LOGIC;
				Control : in STD_LOGIC_VECTOR (2 downto 0);
				Q : inout STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component ShiftRegister is
		port (	Clk : in STD_LOGIC;
				Output : out STD_LOGIC_VECTOR (3 downto 0) := "1110");
	end component;
	
	component FrequencyDivider is
		port(	Clk : in STD_LOGIC;
				Reset : in STD_LOGIC;
				Q : out STD_LOGIC);
	end component;	 
	
	component AnodDevider is
		port(	Clk, Reset : in STD_LOGIC;
				Q : out STD_LOGIC);
	end component;				 
	
	signal Data 		: STD_LOGIC_VECTOR (7 downto 0);
	signal Sum 			: STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
	signal AverageTemp	: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	signal ClkSlow		: STD_LOGIC := '0';
	signal ClkAnod		: STD_LOGIC := '0';
	signal Anod			: STD_LOGIC_VECTOR (3 downto 0) := "1110";
	begin
		FreqDiv : FrequencyDivider port map(	Clk => Clk,
												Reset => '1',
												Q => ClkSlow);
		NrGen : DataGenerator port map(	Clk => Clk,
										Reset => ResetD,
										Control => Control,
										Q => Data);
		Anods : AnodDevider port map(	Clk => Clk,
										Reset => '1',
										Q => ClkAnod);
		Shifter : ShiftRegister port map(	Clk => ClkAnod,
											Output => Anod);
		Anodes <= Anod;
		NumberOut(7) <= '1';
       
		process(ClkSlow, Length, ResetF)
		type ArrayNr is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0);
		variable Queue: ArrayNr := (others => "00000000");
		begin
			if ResetF = '1' then 
				Queue := (others => "00000000");
				Sum <= "000000000000";
				AverageTemp <= "00000000";
			else
				if (ClkSlow'Event) and (ClkSlow = '1') then
					if Length = "000" then
					elsif Length = "100" then
							Queue(15) := Queue(14);
							Queue(14) := Queue(13);
							Queue(13) := Queue(12);
							Queue(12) := Queue(11);
							Queue(11) := Queue(10);
							Queue(10) := Queue(9);
							Queue(9) := Queue(8);
							Queue(8) := Queue(7);
							Queue(7) := Queue(6);
							Queue(6) := Queue(5);
							Queue(5) := Queue(4);
							Queue(4) := Queue(3);
							Queue(3) := Queue(2);
							Queue(2) := Queue(1);
							Queue(1) := Queue(0);
							Queue(0) := Data; 
							Sum <= Queue(0) + Queue(1);
							AverageTemp <= Sum (8 downto 1);
					elsif Length = "101" then 
							Queue(15) := Queue(14);
							Queue(14) := Queue(13);
							Queue(13) := Queue(12);
							Queue(12) := Queue(11);
							Queue(11) := Queue(10);
							Queue(10) := Queue(9);
							Queue(9) := Queue(8);
							Queue(8) := Queue(7);
							Queue(7) := Queue(6);
							Queue(6) := Queue(5);
							Queue(5) := Queue(4);
							Queue(4) := Queue(3);
							Queue(3) := Queue(2);
							Queue(2) := Queue(1);
							Queue(1) := Queue(0);
							Queue(0) := Data;
							Sum <= Queue(0) + Queue(1) + Queue(2) +
							Queue(3);
							AverageTemp <= Sum (9 downto 2);
					elsif Length = "110" then
							Queue(0) := Data;
							Queue(15) := Queue(14);
							Queue(14) := Queue(13);
							Queue(13) := Queue(12);
							Queue(12) := Queue(11);
							Queue(11) := Queue(10);
							Queue(10) := Queue(9);
							Queue(9) := Queue(8);
							Queue(8) := Queue(7);
							Queue(7) := Queue(6);
							Queue(6) := Queue(5);
							Queue(5) := Queue(4);
							Queue(4) := Queue(3);
							Queue(3) := Queue(2);
							Queue(2) := Queue(1);
							Queue(1) := Queue(0);
							Queue(0) := Data;
							Sum <= Queue(0) + Queue(1) + Queue(2) + Queue(3) + Queue(4) + Queue(5) + Queue(6) + Queue(7);
							AverageTemp <= Sum (10 downto 3);
					elsif Length = "111" then
							Queue(0) := Data;
							Queue(15) := Queue(14);
							Queue(14) := Queue(13);
							Queue(13) := Queue(12);
							Queue(12) := Queue(11);
							Queue(11) := Queue(10);
							Queue(10) := Queue(9);
							Queue(9) := Queue(8);
							Queue(8) := Queue(7);
							Queue(7) := Queue(6);
							Queue(6) := Queue(5);
							Queue(5) := Queue(4);
							Queue(4) := Queue(3);
							Queue(3) := Queue(2);
							Queue(2) := Queue(1);
							Queue(1) := Queue(0);
							Queue(0) := Data;
							Sum <= 	Queue(0) + Queue(1) + Queue(2) +	Queue(3) + Queue(4) + Queue(5) + Queue(6) + Queue(7) +
									Queue(8) + Queue(9) + Queue(10) +	Queue(11) + Queue(12) + Queue(13) +	Queue(14);
							AverageTemp <= Sum (11 downto 4);
					end if;
				end if;
			end if;
		end process;
		
		process(ClkAnod)
		variable State : integer := 0;
		begin
			if Anod = "1110" then
				case AverageTemp(3 downto 0) is
					when "0000" => NumberOut (0 to 6) <= "0000001";
					when "0001" => NumberOut (0 to 6) <= "1001111";
					when "0010" => NumberOut (0 to 6) <= "0010010";
					when "0011" => NumberOut (0 to 6) <= "0000110";
					when "0100" => NumberOut (0 to 6) <= "1001100";
					when "0101" => NumberOut (0 to 6) <= "0100100";
					when "0110" => NumberOut (0 to 6) <= "0100000";
					when "0111" => NumberOut (0 to 6) <= "0001111";
					when "1000" => NumberOut (0 to 6) <= "0000000";
					when "1001" => NumberOut (0 to 6) <= "0000100";
					when "1010" => NumberOut (0 to 6) <= "0001000"; 
					when "1011" => NumberOut (0 to 6) <= "1100000"; 
					when "1100" => NumberOut (0 to 6) <= "0110001"; 
					when "1101" => NumberOut (0 to 6) <= "1000010"; 
					when "1110" => NumberOut (0 to 6) <= "0110000"; 
					when "1111" => NumberOut (0 to 6) <= "0111000"; 
					when others => NumberOut (0 to 6) <= "1000001";
				end case;
			elsif Anod = "1101" then
				case AverageTemp(7 downto 4) is
					when "0000" => NumberOut (0 to 6) <= "0000001";
					when "0001" => NumberOut (0 to 6) <= "1001111";
					when "0010" => NumberOut (0 to 6) <= "0010010";
					when "0011" => NumberOut (0 to 6) <= "0000110";
					when "0100" => NumberOut (0 to 6) <= "1001100";
					when "0101" => NumberOut (0 to 6) <= "0100100";
					when "0110" => NumberOut (0 to 6) <= "0100000";
					when "0111" => NumberOut (0 to 6) <= "0001111";
					when "1000" => NumberOut (0 to 6) <= "0000000";
					when "1001" => NumberOut (0 to 6) <= "0000100";
					when "1010" => NumberOut (0 to 6) <= "0001000"; 
					when "1011" => NumberOut (0 to 6) <= "1100000";
					when "1100" => NumberOut (0 to 6) <= "0110001";
					when "1101" => NumberOut (0 to 6) <= "1000010"; 
					when "1110" => NumberOut (0 to 6) <= "0110000";
					when "1111" => NumberOut (0 to 6) <= "0111000"; 
					when others => NumberOut (0 to 6) <= "1000001"; 
				end case;
			elsif anod = "1011" then
				case Data(3 downto 0) is
					when "0000" => NumberOut (0 to 6) <= "0000001";
					when "0001" => NumberOut (0 to 6) <= "1001111";
					when "0010" => NumberOut (0 to 6) <= "0010010";
					when "0011" => NumberOut (0 to 6) <= "0000110";
					when "0100" => NumberOut (0 to 6) <= "1001100";
					when "0101" => NumberOut (0 to 6) <= "0100100";
					when "0110" => NumberOut (0 to 6) <= "0100000";
					when "0111" => NumberOut (0 to 6) <= "0001111";
					when "1000" => NumberOut (0 to 6) <= "0000000";
					when "1001" => NumberOut (0 to 6) <= "0000100";
					when "1010" => NumberOut (0 to 6) <= "0001000";
					when "1011" => NumberOut (0 to 6) <= "1100000"; 
					when "1100" => NumberOut (0 to 6) <= "0110001";
					when "1101" => NumberOut (0 to 6) <= "1000010"; 
					when "1110" => NumberOut (0 to 6) <= "0110000";
					when "1111" => NumberOut (0 to 6) <= "0111000"; 
					when others => NumberOut (0 to 6) <= "1000001";
				end case;
			elsif anod = "0111" then
				case Data(7 downto 4) is
					when "0000" => NumberOut (0 to 6) <= "0000001";
					when "0001" => NumberOut (0 to 6) <= "1001111";
					when "0010" => NumberOut (0 to 6) <= "0010010";
					when "0011" => NumberOut (0 to 6) <= "0000110";
					when "0100" => NumberOut (0 to 6) <= "1001100";
					when "0101" => NumberOut (0 to 6) <= "0100100";
					when "0110" => NumberOut (0 to 6) <= "0100000";
					when "0111" => NumberOut (0 to 6) <= "0001111";
					when "1000" => NumberOut (0 to 6) <= "0000000";
					when "1001" => NumberOut (0 to 6) <= "0000100";
					when "1010" => NumberOut (0 to 6) <= "0001000";
					when "1011" => NumberOut (0 to 6) <= "1100000"; 
					when "1100" => NumberOut (0 to 6) <= "0110001"; 
					when "1101" => NumberOut (0 to 6) <= "1000010"; 
					when "1110" => NumberOut (0 to 6) <= "0110000";
					when "1111" => NumberOut (0 to 6) <= "0111000"; 
					when others => NumberOut (0 to 6) <= "1000001"; 
				end case;
			else
				NumberOut (0 to 6) <= "1000001";
			end if;
	end process;
end Attempting1;