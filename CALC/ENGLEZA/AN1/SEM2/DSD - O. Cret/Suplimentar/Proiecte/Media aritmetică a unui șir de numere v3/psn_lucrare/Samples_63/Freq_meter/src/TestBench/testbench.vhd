library work;
use work.TestBenchPack.all;

library IEEE;
use IEEE.std_logic_1164.all;  
use STD.TEXTIO.all;		 
use IEEE.STD_LOGIC_TEXTIO.all;

entity TestBench is
end TestBench;

architecture StimulusFromFile of TestBench is
file RESULTS: TEXT open WRITE_MODE is "freq_results.txt";
	component freq_top
	port(
		F_INPUT : in std_logic;
		F_PATTERN : in std_logic;
		RESET : in std_logic;
		START : in std_logic;
		LED_A : out std_logic_vector(6 downto 0);
		LED_B : out std_logic_vector(6 downto 0);
		LED_C : out std_logic_vector(6 downto 0);
		LED_D : out std_logic_vector(6 downto 0) );
	end component;

	signal STIM_F_INPUT	: STD_LOGIC;
	signal STIM_F_PATTERN : STD_LOGIC;
	signal STIM_RESET : STD_LOGIC;	
	signal STIM_START : STD_LOGIC;
	signal EXPECTED_LED_A, ACTUAL_LED_A : STD_LOGIC_VECTOR (6 downto 0);
	signal EXPECTED_LED_B, ACTUAL_LED_B : STD_LOGIC_VECTOR (6 downto 0);
	signal EXPECTED_LED_C, ACTUAL_LED_C : STD_LOGIC_VECTOR (6 downto 0);
	signal EXPECTED_LED_D, ACTUAL_LED_D : STD_LOGIC_VECTOR (6 downto 0);
	
	signal STIMULUS : STIMULUS_TYPE;
	signal PATTERN  : PATTERN_TYPE;
	
	signal END_SIM: BOOLEAN:=FALSE;

procedure WRITE_RESULTS(
	F_INPUT : std_logic;
	F_PATTERN : std_logic;
	RESET : std_logic;
	START : std_logic;
	LED_A : std_logic_vector(6 downto 0);
	LED_B : std_logic_vector(6 downto 0);
	LED_C : std_logic_vector(6 downto 0);
	LED_D : std_logic_vector(6 downto 0)) is 

	variable L_OUT : LINE;
begin
	write(l_out, now, right, 15, ps);
	write(l_out,F_INPUT, right, 2);
	write(l_out,F_PATTERN, right, 2);
	write(l_out,RESET, right, 2);
	write(l_out,START, right, 2);
	write(l_out,LED_A, right, 2);
	write(l_out,LED_B, right, 2);
	write(l_out,LED_C, right, 2);
	write(l_out,LED_D, right, 2);
	writeline(RESULTS, L_OUT);
end;

begin

	UUT : freq_top
		port map
			(F_INPUT => STIM_F_INPUT,
			F_PATTERN => STIM_F_PATTERN,
			RESET => STIM_RESET,
			START => STIM_START,
			LED_A => ACTUAL_LED_A,
			LED_B => ACTUAL_LED_B,
			LED_C => ACTUAL_LED_C,
			LED_D => ACTUAL_LED_D );	  

	STIM_F_INPUT <= STIMULUS.F_INPUT;
	STIM_F_PATTERN <= STIMULUS.F_PATTERN;
	STIM_RESET <= STIMULUS.RESET;
	STIM_START <= STIMULUS.START; 
	EXPECTED_LED_A <= PATTERN.LED_A;
	EXPECTED_LED_B <= PATTERN.LED_B;
	EXPECTED_LED_C <= PATTERN.LED_C;
	EXPECTED_LED_D <= PATTERN.LED_D;
	
	END_SIM <= STIMULUS.END_VECTORS and PATTERN.END_VECTORS; 
	
	GEN_STIMULUS: stimulus_generator(STIMULUS_FILE,STIMULUS);	
	GEN_PATTERN: pattern_generator(PATTERN_FILE,PATTERN);	
	
	CHECK_LED_A: check_results(REPORT_FILE,ACTUAL_LED_A,EXPECTED_LED_A,"LED_A");
	CHECK_LED_B: check_results(REPORT_FILE,ACTUAL_LED_B,EXPECTED_LED_B,"LED_B");
	CHECK_LED_C: check_results(REPORT_FILE,ACTUAL_LED_C,EXPECTED_LED_C,"LED_C");
	CHECK_LED_D: check_results(REPORT_FILE,ACTUAL_LED_D,EXPECTED_LED_D,"LED_D");	
	
	process (END_SIM)
	begin
		if END_SIM then
			if ERROR_COUNTER = 0 then
				report "All vectors passed";
			else
				report "Simulation results differ from patterns." & HT 
				& "There are " & natural'image(ERROR_COUNTER) & " differences, for details see simulation_report.log file.";
			end if;	 
			file_close (REPORT_FILE);	
			file_close (STIMULUS_FILE);
			file_close (PATTERN_FILE);
		end if;
	end process;
WRITE_TO_FILE: WRITE_RESULTS(STIM_F_INPUT,STIM_F_PATTERN,STIM_RESET,STIM_START,EXPECTED_LED_A,EXPECTED_LED_B,EXPECTED_LED_C,EXPECTED_LED_D);

end StimulusFromFile;
