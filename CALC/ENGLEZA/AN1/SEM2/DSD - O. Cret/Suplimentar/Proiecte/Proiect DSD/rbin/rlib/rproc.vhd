
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;

entity rproc is
    Port ( input0, input1 : in std_logic_vector ( 7 downto 0);
              clk : in std_logic;
              output : out std_logic_vector ( 7 downto 0)); 
end rproc;

architecture redundant of rproc is
component radder is
    generic (h : natural) ; -- size of input in bit
    Port ( input0,input1 : in  std_logic_vector (2*h-1 downto 0);
           output : out std_logic_vector (2*h+1 downto 0));
end component radder;
component raddsub
    generic (h : natural) ;
    Port ( input0,input1 : in  std_logic_vector (2*h-1 downto 0);
           sub : in std_logic;
           output : out std_logic_vector (2*h+1 downto 0));
end component;
component rconv is
    generic (h : natural) ; -- size of input in bit
    Port ( input : in  std_logic_vector (2*h-1 downto 0);
           output : out std_logic_vector (h downto 0));
end component;
component rmul is
    generic (h : natural) ; --2**h bit width
    Port ( input0,input1 : in  std_logic_vector (2*2**h-1 downto 0);
           output : out std_logic_vector (2*(2*2**h+h-1)-1 downto 0);
           over : out std_logic); -- overflow
end component rmul;
component moving_avg is
    generic (h,order : natural) ; -- size of input in bit, 2**order = size of memory
    Port ( input : in  std_logic_vector (h-1 downto 0);
           clk, rst : in std_logic;
           output : out std_logic_vector (h-1 downto 0));
end component moving_avg;

signal temp : std_logic_vector (15 downto 0);
signal temp2 : std_logic_vector (15 downto 0);

begin
    --twoconv : entity work.tworconv(std) generic map(h=>8) port map (input=>input0,output=>temp2);
    avg : entity work.moving_avg(redun) generic map (h=> 8, order=>8) port map (input=>input0, clk=>clk, rst=>'0',output=> output);
    --mult : entity work.rmul generic map (h=>2) port map (input0=> input0, input1=>input1, output=>output);
    --add: entity work.radder generic map (h=>8) port map (input0=> input0, input1=>input1, output=>temp);
    --conv: entity work.rconv(combin3) generic map( h=>9) port map (input=> temp, output => output);
end architecture;


