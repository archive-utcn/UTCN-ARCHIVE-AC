--
--  Testbench for post-synthesis and post-implemenetd simulation 
--  of project Qlogic_voice

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.all;
use STD.TEXTIO.all;
use WORK.VOICE_PKG.all;


entity  testbench is
end testbench;

architecture TESTBENCH_FUNCTIONAL of testbench is

file RESULTS: TEXT open WRITE_MODE is "functional.txt";

component  VOICE
	port(
		CLK				:	in STD_LOGIC;
		RST				:	in STD_LOGIC;
		KEY_ENTERED	:	in STD_LOGIC_VECTOR(3 downto 0);
		PLAY			:	out STD_LOGIC;
		SAVE			:	out STD_LOGIC;
		ERASE			:	out STD_LOGIC;
		ADDR			:	out STD_LOGIC;
       REC				:	out STD_LOGIC
		);
end component;

shared variable  END_SIM : BOOLEAN := FALSE;    

signal CLK				:	STD_LOGIC;
signal RST				:	STD_LOGIC;
signal KEY_ENTERED	:	STD_LOGIC_VECTOR(3 downto 0);
signal PLAY			:	STD_LOGIC;
signal REC				:	STD_LOGIC;
signal ERASE			:	STD_LOGIC;
signal SAVE			:	STD_LOGIC;
signal ADDR			:	STD_LOGIC;

constant PERIOD_CLK	:	TIME	:= 20 ns;


procedure WRITE_RESULTS (
					CLK				:	STD_LOGIC;
					RST				:	STD_LOGIC;
					KEY_ENTERED	:	STD_LOGIC_VECTOR(3 downto 0);
					PLAY			:	STD_LOGIC;
					REC				:	STD_LOGIC;
					ERASE			:	STD_LOGIC;
					SAVE			:	STD_LOGIC;
					ADDR			:	STD_LOGIC
					      ) is
variable V_OUT : LINE;
begin
		-- write time 
		write(V_OUT, now, right, 16, ps);
		-- write inputs
		write(V_OUT, CLK, right, 2);
		write(V_OUT, RST, right, 2);
		write(V_OUT, KEY_ENTERED, right, 5);
		-- write outputs 
		write(V_OUT, PLAY, right, 2);
		write(V_OUT, REC, right, 2);
		write(V_OUT, ERASE, right, 2);
		write(V_OUT, SAVE, right, 2);
		write(V_OUT, ADDR, right, 2);
		writeline(RESULTS, V_OUT);
--  
end WRITE_RESULTS;

 
		  		  
begin 
--
	UUT: VOICE 
		port map (
			CLK				=>	CLK,
			RST				=>	RST,
			KEY_ENTERED	=>	KEY_ENTERED,
			PLAY			=>	PLAY,
			SAVE			=>	SAVE,
			ERASE			=>	ERASE,
			ADDR			=>	ADDR,
			REC				=>	REC			
				);
					

-- GENERATE CLK SIGNAL			
GEN_CLK	:	process
			begin
				if END_SIM	=	FALSE then
					CLK	<=	'0';
					wait for	PERIOD_CLK;
					
					CLK	<= '1';
					wait for	PERIOD_CLK;
				else 
					wait;  
				end if;  
			end process; -- GEN_RST

-- STIMULATORS   
STIMULUS	:	process 
				begin
					RST<='0';
					KEY_ENTERED<= zero;
					wait for 20 ns;  
					
					RST<='1';
					wait for 20 ns;
					
					RST<='0';
					wait for 50 ns; 
					
					KEY_ENTERED<=one; 
					wait for 40 ns;
					
					KEY_ENTERED<=zero; 
					wait for 40 ns;
					
					KEY_ENTERED<=one; 
					wait for 40 ns;
					
					KEY_ENTERED<=zero; 
					wait for 40 ns;
					
					KEY_ENTERED<=two; 
					wait for 40 ns; 
					
					KEY_ENTERED<=zero;
					wait for 40 ns;
					
					KEY_ENTERED<=three;
					wait for 40 ns;
					
					KEY_ENTERED<=zero;  
					wait for 40 ns;
					
					KEY_ENTERED<=pound; 
					wait for 40 ns;  
					
					KEY_ENTERED<=two; 
					wait for 40 ns; 
					
					KEY_ENTERED<=zero;
					wait for 40 ns; 
					
					KEY_ENTERED<=pound; 
					wait for 40 ns;
					
					KEY_ENTERED<=five; 
					wait for 40 ns;  
					
					KEY_ENTERED<=pound;
					wait for 40 ns;
					
					KEY_ENTERED<=zero;
					wait for 40 ns;
					
					KEY_ENTERED<=zero; 
					wait for 40 ns;
					
					KEY_ENTERED<=zero;
					wait for 40 ns;
					
					KEY_ENTERED<=zero;   
					end_sim := true ;   
					wait;    
				end process;  --STIMULUS  

WRITE_TO_FILE:		WRITE_RESULTS(	CLK,RST,KEY_ENTERED,PLAY,REC,ERASE,SAVE,ADDR);						

end TESTBENCH_FUNCTIONAL;



