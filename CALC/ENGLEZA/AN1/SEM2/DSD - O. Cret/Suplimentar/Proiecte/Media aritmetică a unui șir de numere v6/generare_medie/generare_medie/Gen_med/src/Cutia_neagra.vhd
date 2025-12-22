library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use work.media_package.all;
 --*****************************************************************	
entity cutie_neagra is		 
	port(clk, reset_1, reset_2: in std_logic;
	control: in std_logic_vector(2 downto 0);
	length : in std_logic_vector(2 downto 0);
	catod: out std_logic_vector(7 downto 0);
	anod: out std_logic_vector(3 downto 0));
end cutie_neagra;	 
	
architecture arhitectura_cutie of cutie_neagra is
	
	component generator 
	 	port(CLK: in std_logic;
	 	Reset: in std_logic;
	 	Control: in std_logic_vector(2 downto 0);
	 	Nr: out std_logic_vector(7 downto 0));
	end component ;

	
 --*****************************************************************	
	component display 
	port (nr:in std_logic_vector(7 downto 0);
		avg:in std_logic_vector(7 downto 0);
		clk:in std_logic;
		anod:out std_logic_vector(3 downto 0);
		catod:out std_logic_vector(7 downto 0));
   end component;	

 --*****************************************************************
	component medie 
		port(nr:in std_logic_vector(7 downto 0);
		data_clk:in std_logic;
		length:in std_logic_vector(2 downto 0);
		reset_m:in std_logic;
		ultim:out std_logic_vector(7 downto 0);
		medie:out std_logic_vector(7 downto 0));
	end component;
--*******************************************************************

	type numar4 is array (3 downto 0) of std_logic_vector(3 downto 0);
	
	
	signal data_clock : std_logic:='0';
	signal data_out: std_logic_vector(7 downto 0):=(others=>'0');
	signal data_in:  std_logic_vector(7 downto 0):=(others=>'0');
	signal mediaS: std_logic_vector(7 downto 0):=(others=>'0');
	signal num4:numar4:=(others=>(others=>'0'));
	begin 
 		clk_proc: process(clk,data_out,mediaS)
 		begin
	 		
	 		num4(0)<=data_out(3 downto 0);
	 		num4(1)<=data_out(7 downto 4);
	 		num4(2)<=mediaS(3 downto 0);
	 		num4(3)<=mediaS(7 downto 4); 
			
 		end process;
 	   
   --*****************************************************************
 	gen: generator
 	port map (clk,reset_1,control, data_in);
 	
    media_num: medie
 	port map(data_in,clk,length,reset_2,mediaS,data_out);
 
	afisare: display
 	port map(data_in,data_out,clk,anod,catod);	
 

 
end arhitectura_cutie ;