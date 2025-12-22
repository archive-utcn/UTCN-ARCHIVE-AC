library ieee;
Library cypress;
use ieee.std_logic_1164.all;
use Cypress.std_arith.all;
--use work.std_arith.all;

package binctr_pkg is
	component binctr
	 port(reset, get_drink, clk: in std_logic;
		give_drink: inout std_logic;
		empty: inout std_logic);
	end component;
end binctr_pkg;

library ieee;
library Cypress;
use ieee.std_logic_1164.all;
use Cypress.std_arith.all;
--use work.std_arith.all;

entity binctr is port(
	reset, get_drink, clk: in std_logic;
	give_drink: inout std_logic;
	empty: inout std_logic);
end binctr;

architecture archbinctr of binctr is
	constant full: std_logic_vector(1 downto 0):= "11"; 
	signal remaining: std_logic_vector(1 downto 0);
begin
	proc_label: process (clk, reset)
	 begin
	 if (reset = '1') then
		remaining <= full;
		empty <= '0';
		give_drink <= '0';
	elsif (clk'event and clk = '1') then
		if (remaining = "00") then
		empty <= '1';
		give_drink <= '0';
		elsif (get_drink = '1') then
		remaining <= remaining - 1;
		give_drink <= '1';
		elsif (get_drink = '0') then
		give_drink <= '0';
		else
		give_drink <= give_drink;
			remaining <= remaining;
			empty <= empty;
		end if;
		end if;
	end process;
end archbinctr;
 
