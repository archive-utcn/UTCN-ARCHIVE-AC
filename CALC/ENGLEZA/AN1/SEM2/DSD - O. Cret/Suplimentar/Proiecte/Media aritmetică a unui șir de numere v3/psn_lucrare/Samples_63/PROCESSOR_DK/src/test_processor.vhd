library ieee;
use ieee.std_logic_1164.all;		
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity test_processor is end test_processor;

architecture test_processor of test_processor is

component processor_top
	port(
		clk : in std_logic;
	    data_read : out std_logic;
		inp : in std_logic_vector(7 downto 0);
		outp : out std_logic_vector(7 downto 0);
		rst : in std_logic);
end component;
for all: processor_top use entity WORK.processor_top(behaviour);

constant CLK_PER : time := 100 ns;			   
signal END_SIM : boolean  := false;
signal clk : std_logic := '0';
signal data_read : std_logic;
signal inp : std_logic_vector(7 downto 0);
signal outp : std_logic_vector(7 downto 0);
signal rst : std_logic;

type intFile is file of integer;
file values : text open read_mode is "values.dat";
file results : text  open write_mode is "results.dat";

begin

clk <= not clk after CLK_PER when not END_SIM else '0';
	
UUT : processor_top
	port map(
		clk,	   
		data_read,
		inp,
		outp,
		rst
		);
		
		
process			   
variable l_read,l_write : LINE;
variable value : integer;
begin
	inp <= (others => '0');
	stim : loop
		rst <= '1';
		wait for CLK_PER;
		readline(values,l_read);
		read(l_read,value);
		inp <= conv_std_logic_vector(value,8);
		rst <= '0';
		wait on data_read;
		readline(values,l_read);
		read(l_read,value);
		inp <= conv_std_logic_vector(value,8);
		wait on outp; -- read quotient
		wait for CLK_PER;
		write(l_write, conv_integer(outp));
		writeline(results, l_write);   
		wait on outp;-- read remainder
		wait for CLK_PER;
		write(l_write, conv_integer(outp));
		writeline(results, l_write);   
		exit stim when EndFile(values);
	end loop;
	END_SIM <= true;
	wait;
end process;

end test_processor;