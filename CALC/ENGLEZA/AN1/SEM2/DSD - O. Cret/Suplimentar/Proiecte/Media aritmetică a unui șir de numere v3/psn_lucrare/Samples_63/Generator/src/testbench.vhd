library ieee;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.std_logic_arith.all;

entity testbench is
end testbench;

architecture TESTBENCH_ARCH of testbench is
file RESULTS: TEXT open WRITE_MODE is "results.txt";

component GENERATOR is 
  port (A		: in STD_LOGIC;
        B		: in STD_LOGIC;
        CLOCK	: in STD_LOGIC;
        RESET	: in STD_LOGIC;
        S		: in STD_LOGIC;
        Y		: out STD_LOGIC);
end component;

shared variable end_sim : BOOLEAN := false;
signal RESET,Y			: STD_LOGIC;
signal A,B,S,CLOCK	: STD_LOGIC;
procedure WRITE_RESULTS(
	a : std_logic;
	b : std_logic;
	clock : std_logic;
	reset : std_logic;
	s : std_logic;
	y : std_logic) is 

	variable L_OUT : LINE;
begin
	write(l_out, now, right, 15, ps);
	write(l_out,a, right, 2);
	write(l_out,b, right, 2);
	write(l_out,clock, right, 2);
	write(l_out,reset, right, 2);
	write(l_out,s, right, 2);
	write(l_out,y, right, 2);
	writeline(RESULTS, L_OUT);
end;

begin
  -- <<enter your statements here>>
   UUT: GENERATOR
    port map (
             A => A,
             B => B,
             CLOCK => CLOCK,
             RESET => RESET,
             S => S,
             Y => Y
             );
  
CLK_IN: process
   		begin
		if end_sim = false then
			CLOCK <= '0';
			wait for 10 ns;
			CLOCK <='1';
			wait for 10 ns; 
		else
		wait; 
		end if;
	end process;


S_IN: process 
		begin
		if end_sim = false then
			S <=  '0';
			wait for 250 ns;
			S <= '1';
			wait for 250 ns;
		else
		wait;
		end if;			
	end process;

A_IN: process
		begin
		if end_sim = false then	
			A <= '0';
			wait for 500 ns;
			A <= '1';
			wait for 500 ns;
		else
		wait; 
		end if;	
	end process;

B_IN:  process 
       variable time0 : TIME := 0 us;  
		begin
		while time0 < 20 us loop
		time0 := time0 + 1000 ns;
			B <= '0';
			wait for 1000 ns;
			B <= '1';
			wait for 1000 ns;
		end loop;
		end_sim := true;
		wait;	
		end process;

RESET_IN:process
		begin
		    RESET <= '1';
		wait for 100 ns;
			RESET <= '0';
		wait;
	end process;	   
	
WRITE_TO_FILE: WRITE_RESULTS(a,b,clock,reset,s,y);

end TESTBENCH_ARCH;

configuration CONF_TESTBENCH_ARCH of testbench is
	for TESTBENCH_ARCH 
		for  UUT : generator use entity generator (GENERATOR_ARCH);
		end for;	
	end for;	
end CONF_TESTBENCH_ARCH;