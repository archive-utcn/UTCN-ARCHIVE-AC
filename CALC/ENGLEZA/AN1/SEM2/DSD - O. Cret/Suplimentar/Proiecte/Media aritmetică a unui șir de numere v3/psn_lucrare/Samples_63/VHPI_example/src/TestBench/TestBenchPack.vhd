library IEEE;
use IEEE.std_logic_1164.all;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;
Package TestBenchPack is	 
	--files declaration
	file REPORT_FILE: 	TEXT open write_mode is "$dsn\src\testbench\simulation_report.log";
	file STIMULUS_FILE:	TEXT open read_mode is "$dsn\src\testbench\stimulus.vec";
	file PATTERN_FILE: 	TEXT open read_mode is "$dsn\src\testbench\golden.vec";
	
	--delay time to start comparison patterns with actual results
	constant WAIT_TIME: time:=10 ns;		
	--error_counter counts diferences beetwen patterns and actuals in whole testbench
	shared variable ERROR_COUNTER: NATURAL:=0;										 
	
	--auxilary declarations
	constant HT: CHARACTER:=lf;	 
	shared variable LAST_TIME: TIME:=0 ps;	

	--
	--*** Below type declarations consists of all port names of tested entity.
	--*** Sequence of the names are the same as in test vectors file.
	--

	type STIMULUS_TYPE is record
		F_INPUT		: STD_LOGIC;
		F_PATTERN	: STD_LOGIC;
		RESET		: STD_LOGIC;
		START		: STD_LOGIC;	   
		END_VECTORS : BOOLEAN;
	end record;
	
	type PATTERN_TYPE is record
		LED_A : std_logic_vector(6 downto 0);
		LED_B : std_logic_vector(6 downto 0);
		LED_C : std_logic_vector(6 downto 0);
		LED_D : std_logic_vector(6 downto 0);  
		END_VECTORS : BOOLEAN;
	end record;
	
	procedure stimulus_generator (
		file VECTOR_FILE: TEXT;
		signal WAVE: out STIMULUS_TYPE);
		
	procedure pattern_generator (
		file VECTOR_FILE: TEXT;
		signal WAVE: out PATTERN_TYPE);
		
	procedure check_results (
		file REPORT_FILE: TEXT;
		signal CURRENT,EXPECTED: in STD_LOGIC_VECTOR; 
		PORT_NAME: in STRING);
	
	
end TestBenchPack;

Package body TestBenchPack is	

	procedure stimulus_generator (file VECTOR_FILE: TEXT;signal WAVE: out STIMULUS_TYPE) is
		
		variable ILINE: 	LINE;
		variable WAIT_TIME: TIME;
		variable SEMICOLON:	CHARACTER;
		variable VECTOR:    STIMULUS_TYPE; 
		
		impure function skip_white return BOOLEAN is   	   
		
			function is_semicolon (C: CHARACTER) return BOOLEAN is
			begin
				return (C = ' ') or (C = ':') ;
			end is_semicolon; 	
				
			function is_eol (C: CHARACTER) return BOOLEAN is
			begin
				return (C = HT);
			end is_eol; 
				
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
		
	begin --of stimulus_generator
		VECTOR.END_VECTORS := FALSE;
		while not endfile(VECTOR_FILE) loop
			readline (VECTOR_FILE, ILINE);
			if (ILINE'length /= 0 and ILINE(1)/='%') then --skip empty and commented line
				read (ILINE, VECTOR.F_INPUT);
				read (ILINE, VECTOR.F_PATTERN);
				read (ILINE, VECTOR.RESET);		  	
				read (ILINE, VECTOR.START);		  	 
				--read ":"		 
				next when skip_white;
				--read (ILINE,SEMICOLON);	--this line has to be commented	 
				read (ILINE, WAIT_TIME);
				WAVE <= VECTOR;
				wait for WAIT_TIME;
			end if;
		end loop;	   
		VECTOR.END_VECTORS := TRUE;	
		WAVE <= VECTOR;		
		wait;		
	end stimulus_generator;

	procedure pattern_generator (file VECTOR_FILE: TEXT; signal WAVE: out PATTERN_TYPE) is
	
		variable ILINE: 	LINE;
		variable WAIT_TIME: TIME;
		variable SEMICOLON:	STRING (1 to 3);
		variable VECTOR:    PATTERN_TYPE;
	begin
		while not endfile(VECTOR_FILE) loop
			readline (VECTOR_FILE, ILINE);
			if (ILINE'length /= 0 and ILINE(1)/='%') then --skip empty and commented line
				read (ILINE, VECTOR.LED_A);		 
				read (ILINE, VECTOR.LED_B);
				read (ILINE, VECTOR.LED_C);
				read (ILINE, VECTOR.LED_D);
				--read ":"
				read (ILINE,SEMICOLON);	  	
				--read vector time	 
				read (ILINE, WAIT_TIME);
				WAVE <= VECTOR;
				wait for WAIT_TIME;
			end if;
		end loop;		   
		VECTOR.END_VECTORS := TRUE;	
		WAVE <= VECTOR;				
		wait;
	end pattern_generator;	  	 
	
	
	procedure check_results (file REPORT_FILE: TEXT;signal CURRENT,EXPECTED: in STD_LOGIC_VECTOR; PORT_NAME: in STRING) is 
		procedure write_message (
			file REPORT_FILE: TEXT; 
			ERROR_TIME: 	in TIME;
			PORT_NAME:		in STRING;
			RESULT: 		in STD_LOGIC_VECTOR;
			EXPECTED:		in STD_LOGIC_VECTOR) is
			
			variable L: LINE;
		
		begin
			if LAST_TIME /= ERROR_TIME then
				write (L, STRING'("Time: "));
				write (L, ERROR_TIME, right, 5, ns);
				writeline (REPORT_FILE,L);
			end if;	   
			LAST_TIME := ERROR_TIME;
			write (L, STRING'("    Port "));
			write (L, STRING'(PORT_NAME));
			write (L, STRING'(": Expected value is "));
			write (L, EXPECTED);
			write (L, STRING'(", current value is "));
			write (L, RESULT);
			writeline (REPORT_FILE,L);
		end write_message;		 

	begin	--of check_results procedure
		wait for WAIT_TIME;
		if CURRENT /= EXPECTED then
			write_message (REPORT_FILE, now, PORT_NAME, CURRENT, EXPECTED);	  				   		
			ERROR_COUNTER := ERROR_COUNTER + 1;
		end if;
		wait on CURRENT,EXPECTED;
	end;	
end TestBenchPack;




