library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.all;
use STD.TEXTIO.all;

entity testbench is
end testbench;

architecture FUNCTIONAL_ARCH of testbench is

file RESULTS: TEXT open WRITE_MODE is "functional.txt";

component REFILL
    port (
		GIVE_COLA		: inout STD_LOGIC;
		GIVE_DIET		: inout STD_LOGIC;
		REFILL_BINS	: out STD_LOGIC;
		RESET			: in STD_LOGIC;
		CLK				: in STD_LOGIC;
		GET_DIET		: in STD_LOGIC;
		GET_COLA		: in STD_LOGIC
		);
end component;

	shared variable end_sim: BOOLEAN := false;
	      
	signal GIVE_COLA   :  STD_LOGIC;
	signal GIVE_DIET   :  STD_LOGIC;
	signal REFILL_BINS :  STD_LOGIC;
	signal RESET       :  STD_LOGIC;
	signal CLK         :  STD_LOGIC;
	signal GET_DIET    :  STD_LOGIC;
	signal GET_COLA    :  STD_LOGIC;
	
procedure WRITE_RESULTS (
				GIVE_COLA		:  STD_LOGIC;
				GIVE_DIET		:  STD_LOGIC; 
				REFILL_BINS	:  STD_LOGIC;
				RESET			:  STD_LOGIC;
				CLK				:  STD_LOGIC; 
				GET_DIET		:  STD_LOGIC;
				GET_COLA		:  STD_LOGIC
								
							) is
variable V_OUT : LINE;

begin
-- write current time 
    write(V_OUT, now, right, 15, ps);
-- write Refill inputs
    write(V_OUT, RESET , right, 2);
    write(V_OUT, CLK , right, 2);
    write(V_OUT, GET_DIET , right, 2);
    write(V_OUT, GET_COLA, right, 2);
-- write Refill outputs
    write(V_OUT, GIVE_COLA, right, 2);
    write(V_OUT, GIVE_DIET, right, 7);
    write(V_OUT, REFILL_BINS, right, 7);
    writeline(RESULTS, V_OUT);
    
end WRITE_RESULTS;
   

begin

CLK_IN: process
	begin
		if end_sim = false then
			CLK <= '0';
			wait for 100 ns;
			
			CLK <=	'1';
			wait for 100 ns;
		else
			wait;
		end if;
	end process;

STIMULUS:	process
	begin
	 				
		RESET	<=	'1';
		GET_DIET	<=	'0';
		GET_COLA	<=	'0';
		wait for 200 ns;
		
		RESET	<=	'0';
		wait for 200 ns;
		
		GET_DIET	<=	'1';
		wait for 1000 ns;
		
		GET_DIET	<=	'0';
		GET_COLA	<=	'1';
		wait for 800 ns;
		
		GET_COLA	<=	'0';
		RESET	<=	'1';	
		wait for 200 ns;
		
		RESET	<='0';
		wait for 200 ns;
		
		end_sim		:= true;
		wait;
	end process;				 
	 						 			
                   
      
		UUT : REFILL
			port map (
			GIVE_COLA		=> GIVE_COLA,
			GIVE_DIET		=> GIVE_DIET,
			REFILL_BINS	=> REFILL_BINS,
			RESET			=> RESET,
			CLK				=> CLK,
			GET_DIET		=> GET_DIET,
			GET_COLA		=> GET_COLA
			);
		          
WRITE_TO_FILE:	WRITE_RESULTS(GIVE_COLA,GIVE_DIET,REFILL_BINS,RESET,CLK,GET_DIET,GET_COLA);


end FUNCTIONAL_ARCH;
