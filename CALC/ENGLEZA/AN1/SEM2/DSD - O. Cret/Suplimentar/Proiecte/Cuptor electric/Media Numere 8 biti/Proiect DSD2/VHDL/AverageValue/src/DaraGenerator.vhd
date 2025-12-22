library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataGenerator is
	port (	Clk, Reset : in STD_LOGIC;
			Control : in STD_LOGIC_VECTOR (2 downto 0);
			Q : inout STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture Attempting2 of DataGenerator is
signal Slow: STD_LOGIC;

component FrequencyDivider is
	port(	CLK, Reset : in STD_LOGIC;
			Q : out STD_LOGIC);
end component; 

begin
	div: FrequencyDivider port map (CLK => Clk, 
									Reset => '1', 
									Q =>	Slow);
	process(Slow, Control) 
	type StudentArray is array (0 to 5) of STD_LOGIC_VECTOR (7 downto 0);
	variable D7, D6, D5, D4, D3, D2, D1, D0: STD_LOGIC := '1';
	variable DD3, DD2, DD1, DD0: STD_LOGIC := '1';
	variable Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0: STD_LOGIC := '0';
	variable QQ3, QQ2, QQ1, QQ0: STD_LOGIC := '0';
	variable i : integer range 0 to 5 := 0;
	variable k : integer range 0 to 5 := 0;	 
	variable n : integer range 0 to 3 := 0;	  
	variable x : STD_LOGIC := '0';
	variable Student1 : StudentArray := ( 	0 => "00000001", 1 => "00000010", 2 => "00000011", 
											3 => "00000100", 4 => "00000101", 5 => "00000110" );
	variable Student2 : StudentArray := ( 	0 => "00001001", 1 => "00001000", 2 => "00000111", 
											3 => "00000110", 4 => "00000101", 5 => "00000100" );
	begin
		if reset = '1' then
			q <= "00000000";
		else
			if (Control(2) = '1') and (Control(1) = '1') and (Control(0) = '0')	then
				if Rising_Edge(Slow) then
					QQ0 := DD0; 
					QQ1 := DD1; 
					QQ2 := DD2; 
					QQ3 := DD3;
					DD0 := QQ2 xor QQ3;
					DD1 := QQ0; 
					DD2 := QQ1; 
					DD3 := QQ2;
				end if;
				Q(0) <= QQ0; 
				Q(1) <= QQ1; 
				Q(2) <= QQ2; 
				Q(3) <= QQ3;
				Q(4) <= '0'; 
				Q(5) <= '0'; 
				Q(6) <= '0'; 
				Q(7) <= '0';
			elsif (Control(2) = '1') and (Control(1) = '1') and (Control(0) = '1') then
				if rising_edge(Slow) then
					Q0 := D0; 
					Q1 := D1; 
					Q2 := D2; 
					Q3 := D3;
					Q4 := D4; 
					Q5 := D5; 
					Q6 := D6; 
					Q7 := D7;
					D0 := Q6 xor Q7;
					D1 := Q0; 
					D2 := Q1; 
					D3 := Q2; 
					D4 := Q3;
					D5 := Q4; 
					D6 := Q5; 
					D7 := Q6;
				end if;
				Q(0) <= Q0; 
				Q(1) <= Q1; 
				Q(2) <= Q2; 
				Q(3) <= Q3;
				Q(4) <= Q4; 
				Q(5) <= Q5; 
				Q(6) <= Q6; 
				Q(7) <= Q7;
			elsif (Control(2) = '0') and (Control(1) = '0') and (Control(0) = '0') then
				if (Slow'Event) and (Slow = '1') then
					Q(0) <= '0'; 
					Q(1) <= '0'; 
					Q(2) <= '0'; 
					Q(3) <= '0';
					Q(4) <= '0'; 
					Q(5) <= '0'; 
					Q(6) <= '0'; 
					Q(7) <= '0';
				end if;	
			elsif (Control(2) = '0') and (Control(1) = '1') and (Control(0) = '0') then
				if rising_edge(Slow) then
					i := i + 1;
					if (i > 5) then
						i := 0;
					end if;
				end if;
				Q <= Student1(i);
			elsif (Control(2) = '0') and (Control(1) = '1') and (Control(0) = '1') then
				if rising_edge(Slow) then
					k := k + 1;
					if (k > 5) then
						k := 0;
					end if;
				end if;
				Q <= Student2(k);													   
			elsif (Control(2) = '0') and (Control(1) = '0') and (Control(0) = '1') then
				if rising_edge(Slow) then
					n := n + 1;
					if (n >= 3) then
						n := 0;	 
						x := not x;
					end if;
				end if;	
				Q <=  (others => x);
			end if;
		end if;
	end process;
end Attempting2;