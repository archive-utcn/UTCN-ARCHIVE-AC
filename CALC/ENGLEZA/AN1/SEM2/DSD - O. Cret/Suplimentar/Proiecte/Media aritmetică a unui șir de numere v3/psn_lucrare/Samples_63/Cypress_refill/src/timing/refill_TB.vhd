library ieee,primitive;
use ieee.std_logic_1164.all;
use primitive.primitive.all;
use std.textio.all;
use ieee.std_logic_textio.all;

	-- Add your library and packages declaration here ...

entity refill_tb is
end refill_tb;

architecture TB_ARCHITECTURE of refill_tb is

file results: text open write_mode is "timing.txt";

	-- Component declaration of the tested unit
	-- Component declaration of the "refill(dsmb)" unit
	-- File name contains "refill" entity: .\src\timing\refill.vhd
	component refill
	port(
		give_cola : inout std_logic;
		give_diet : inout std_logic;
		refill_bins : inout std_logic;
		reset : in std_logic;
		clk : in std_logic;
		get_diet : in std_logic;
		get_cola : in std_logic);
	end component;


	shared variable end_sim: boolean := false;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal gndpin1 : std_logic;
	signal give_cola : std_logic;
	signal give_diet : std_logic;
	signal refill_bins : std_logic;
	signal reset : std_logic;
	signal get_diet : std_logic;
	signal clk : std_logic;
	signal get_cola : std_logic;
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...
procedure write_results (
				give_cola		:  std_logic;
				give_diet		:  std_logic; 
				refill_bins	 	:  std_logic;
				reset			:  std_logic;
				clk				:  std_logic; 
				get_diet		:  std_logic;
				get_cola		:  std_logic
								
							) is
variable v_out : line;

begin
-- write current time 
    write(v_out, now, right, 15, ps);
-- write Refill inputs
    write(v_out, reset , right, 2);
    write(v_out, clk , right, 2);
    write(v_out, get_diet , right, 2);
    write(v_out, get_cola, right, 2);
-- write Refill outputs
    write(v_out, give_cola, right, 2);
    write(v_out, give_cola, right, 7);
    write(v_out, refill_bins, right, 7);
    writeline(results, v_out);
    
end write_results;

begin

	-- Unit Under Test port map
	UUT : refill
		port map
			(
			give_cola => give_cola,
			give_diet => give_diet,
			refill_bins => refill_bins,
			reset => reset,
			get_diet => get_diet,
			clk => clk,
			get_cola => get_cola
			 );

	-- Add your stimulus here ...
CLK_IN: process
	begin
		if end_sim = false then
			clk <= '0';
			wait for 100 ns;
			
			clk <=	'1';
			wait for 100 ns;
		else
			wait;
		end if;
	end process;

STIMULUS:	process
	begin
	 				
		reset	<=	'1';
		get_diet	<=	'0';
		get_cola	<=	'0';
		wait for 200 ns;
		
		reset	<=	'0';
		wait for 200 ns;
		
		get_diet	<=	'1';
		wait for 1000 ns;
		
		get_diet	<=	'0';
		get_cola	<=	'1';
		wait for 800 ns;
		
		get_cola	<=	'0';
		reset	<=	'1';	
		wait for 200 ns;
		
		reset	<='0';
		wait for 200 ns;
		
		end_sim		:= true;
		wait;
	end process;
	
	write_to_file :	write_results(give_cola,give_diet,refill_bins,reset,clk,get_diet,get_cola);
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_refill of refill_tb is
	for TB_ARCHITECTURE
		for UUT : refill
			use entity work.refill(DSMB);
		end for;
	end for;
end TESTBENCH_FOR_refill;

