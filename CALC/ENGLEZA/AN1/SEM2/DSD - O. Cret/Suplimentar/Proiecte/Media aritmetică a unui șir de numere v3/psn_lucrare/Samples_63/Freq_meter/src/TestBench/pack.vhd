library IEEE;
use IEEE.std_logic_1164.all;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;
use work.TESTBENCH_UTILITIES.all;
Package TestBench_Pack is

--
--*** This declarations consists of all port names of tested entity.
--*** Sequence of the names are the same as in test vectors file.
--

type STIMULUS_TYPE is record
	F_INPUT		: STD_LOGIC;
	F_PATTERN	: STD_LOGIC;
	RESET		: STD_LOGIC;
	START		: STD_LOGIC;	
end record;

type PATTERN_TYPE is record
	LED_A : std_logic_vector(6 downto 0);
	LED_B : std_logic_vector(6 downto 0);
	LED_C : std_logic_vector(6 downto 0);
	LED_D : std_logic_vector(6 downto 0);
end record;

procedure STIMULUS_GENERATOR (
	file VECTOR_FILE: TEXT;
	signal WAVE: out STIMULUS_TYPE);
	
procedure PATTERN_GENERATOR (
	file VECTOR_FILE: TEXT;
	signal WAVE: out PATTERN_TYPE);
	
end TestBench_Pack;

Package body TestBench_Pack is

	procedure STIMULUS_GENERATOR (
		file VECTOR_FILE: TEXT;
		signal WAVE: out STIMULUS_TYPE) is
		
		variable GOOD: 		BOOLEAN;
		variable ILINE: 	LINE;
		variable WAIT_TIME: TIME;
		variable SEMICOLON:	CHARACTER;
		variable VECTOR:    STIMULUS_TYPE; 
	
		function is_semicolon (C: CHARACTER)return BOOLEAN is
		begin
			return (C = ' ') or (C = ':') ;
		end is_semicolon; 		
		function is_eol (C: CHARACTER)return BOOLEAN is
		begin
			return (C = HT);
		end is_eol; 
				
		impure function skip_white return BOOLEAN is  
		begin
			loop	 
				if (is_semicolon(ILINE(ILINE.all'LEFT))) then
					read (ILINE,SEMICOLON);	 				
				elsif (is_eol(ILINE(ILINE.all'LEFT))) then	 
					return TRUE;	
				else
					return FALSE;
				end if;
			end loop;
		end skip_white;
		
	begin
		while not ENDFILE(VECTOR_FILE) loop
			READLINE (VECTOR_FILE, ILINE);
			if (ILINE'length /= 0 and ILINE(1)/='%') then --skip empty and commented line
				read (ILINE, VECTOR.F_INPUT, GOOD);
				read (ILINE, VECTOR.F_PATTERN, GOOD);
				read (ILINE, VECTOR.RESET, GOOD);		  	
				read (ILINE, VECTOR.START, GOOD);		  	 
				--read ":"		 
				next when skip_white;
				--read (ILINE,SEMICOLON);	--this line has to be commented	 
				READ (ILINE, WAIT_TIME, GOOD);
				WAVE <= VECTOR;
				wait for WAIT_TIME;
			end if;
		end loop;
		wait;		
	end STIMULUS_GENERATOR;

	procedure PATTERN_GENERATOR (
		file VECTOR_FILE: TEXT;
		signal WAVE: out PATTERN_TYPE) is
	
		variable GOOD: 		BOOLEAN;
		variable ILINE: 	LINE;
		variable WAIT_TIME: TIME;
		variable SEMICOLON:	STRING (1 to 3);
		
		variable VECTOR:    PATTERN_TYPE;
		
		begin
		
		while not ENDFILE(VECTOR_FILE) loop
			READLINE (VECTOR_FILE, ILINE);
			if (ILINE'length /= 0 and ILINE(1)/='%') then --skip empty and commented line
				read (ILINE, VECTOR.LED_A, GOOD);		 
				read (ILINE, VECTOR.LED_B, GOOD);
				read (ILINE, VECTOR.LED_C, GOOD);
				read (ILINE, VECTOR.LED_D, GOOD);
				--read ":"
				--read (ILINE,SEMICOLON);	  
				--read vector time	 
				READ (ILINE, WAIT_TIME, GOOD);
				WAVE <= VECTOR;
				wait for WAIT_TIME;
			end if;
		end loop;
		wait;
	end PATTERN_GENERATOR;
end TestBench_Pack;




