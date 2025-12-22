library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity d_ff is
	port ( clk, reset , d : in std_logic;
	q , nq : out std_logic);
end d_ff;

architecture arh of d_ff is
begin 
	process ( clk, reset)
	begin
		if ( reset = '1')
			then q<='0'; nq<='1';
		else
			if clk='1' and clk'event
				then q<=d; nq<= not d;
			end if;
		end if;
	end process;
end arh;	  

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;	 

entity ms_d_ff is
end entity ms_d_ff;

architecture arh of ms_d_ff is

component d_ff is
	port ( clk, reset , d : in std_logic;
	q , nq : out std_logic);
end component d_ff;

signal clk,reset,d : std_logic;
signal q,nq : std_logic;

begin
	
	UST : d_ff port map(clk=>clk, reset=>reset, d=>d, q=>q, nq=>nq);	    	
		STIMULI: process
		begin
			clk<='1';
			d<='1';
			wait for 10 ns;	
			reset<='0';
			clk<='1';
			wait for 10 ns;
			d<='0';
			clk<='1';
			wait for 10 ns;
			d<='1';
			clk<='1';
			wait for 10 ns;
			d<='1';
			clk<='1'; 
			wait for 10 ns;
			d<='1';
			clk<='1';
			wait for 10 ns;
			wait;
		end process STIMULI;
end arh;		