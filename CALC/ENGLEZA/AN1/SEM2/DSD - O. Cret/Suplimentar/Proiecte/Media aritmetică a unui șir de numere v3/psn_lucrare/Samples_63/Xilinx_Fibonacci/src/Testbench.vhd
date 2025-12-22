library IEEE;
use IEEE.std_logic_1164.all;

library SYNOPSYS;
use SYNOPSYS.std_logic_textio.all;

use Std.TextIO.ALL;

entity write_to_file is
	generic ( File_Name: STRING);
	port (
	DISPA : in std_logic_vector (6 downto 0);
	DISPB : in std_logic_vector (6 downto 0);
	FIBO  : in std_logic_vector (7 downto 0);
	ENABLE: in  std_logic;
	RESET : in  std_logic
	);
end write_to_file;

architecture write_to_file_arch of write_to_file is

begin  

  
process(DISPA, DISPB, FIBO, ENABLE, RESET)
    FILE results: TEXT OPEN WRITE_MODE IS File_Name;
    VARIABLE l_out : line;
 begin
    write(l_out, now, right, 15, ps);
    write(l_out, DISPA, right, 8);
    write(l_out, DISPB, right, 8);
    write(l_out, FIBO, right, 9);
    write(l_out, ENABLE, right, 2);
    write(l_out, RESET, right, 2);        
    writeline(results,l_out);
end process;

end write_to_file_arch;



library IEEE;
use IEEE.std_logic_1164.all;

entity stimulators is
	port(
	CLK   : out std_logic;
	RESET : out std_logic;
	ENABLE : out std_logic	
	);
end;

architecture stimulators_arch of stimulators is

begin
	process
		begin
			RESET <= '0';
		wait for 100 ns;
			RESET <= '1';
		wait for 1100 ns;
			RESET <= '0';
		wait for 200 ns;
			RESET <= '1';
		wait;
	end process;

	process
		begin
			ENABLE <= '0';
		wait for 200 ns;
			ENABLE <= '1';
		wait for 900 ns;
			ENABLE <= '0';
		wait for 200 ns;
			ENABLE <= '1';
		wait;
	end process;	  
	process 
	begin 
		CLK <= '0';
		wait for 62.5 ns;
		CLK <= '1';
		wait for 62.5 ns;
	end process;	

end stimulators_arch;


library IEEE;
use IEEE.std_logic_1164.all;
library SYNOPSYS;
use SYNOPSYS.std_logic_textio.all;
use Std.TextIO.ALL;

entity test_bench is end;

architecture testbench_arch of test_bench is

component stimulators
	port( 
	CLK   : out std_logic;
	RESET : out std_logic;
	ENABLE : out std_logic	
	);
end component;

component write_to_file 
	generic ( File_Name: STRING);
	port (
	DISPA : in std_logic_vector (6 downto 0);
	DISPB : in std_logic_vector (6 downto 0);
	FIBO  : in std_logic_vector (7 downto 0);
	ENABLE: in  std_logic;
	RESET : in  std_logic
	);
end component;

-- tested component declaration

component TOP
	port (
	DISPA : out std_logic_VECTOR (6 downto 0);
	DISPB : out std_logic_VECTOR (6 downto 0);
	FIBO : out std_logic_VECTOR (7 downto 0);
	ENABLE : in std_logic;
	RESET : in std_logic;
	CLK   : in std_logic
	);
end component;

-- signals declaration

signal	RESET  :  std_logic;
signal	ENABLE :  std_logic;
signal	CLK :  std_logic;
signal	FIBO :  std_logic_VECTOR ( 7 downto 0 );
signal  DISPA  :  std_logic_VECTOR ( 6 downto 0 );
signal  DISPB  :  std_logic_VECTOR ( 6 downto 0 );


begin

-- tested component instantiation

UUT: TOP
port map (	   
    CLK    => CLK,
    RESET  => RESET,
    ENABLE => ENABLE,
    FIBO => FIBO,
    DISPA  => DISPA,
    DISPB  => DISPB
	);

-- stimulators component instantiation

STIM: STIMULATORS
port map (
    CLK =>    CLK,
    RESET  => RESET,
    ENABLE => ENABLE
    	);		

-- write_to_file component instantiation

WRITE: WRITE_TO_FILE
	generic map(File_Name => "functional.txt")
	port map (
    RESET  => RESET,
    ENABLE => ENABLE,
    FIBO => FIBO,
    DISPA  => DISPA,
    DISPB  => DISPB
	);

end testbench_arch;

