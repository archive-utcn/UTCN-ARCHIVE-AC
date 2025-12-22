library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pulse_gen is
	port(
		clk : in std_logic;
		enable : in std_logic;
		reset : in std_logic;
		pulse : out std_logic
		);
end pulse_gen;

architecture struct of pulse_gen is
	
	---- component declarations -----
	
	component cnt_4
		port (
			clk : in std_logic;
			enable : in std_logic;
			reset : in std_logic;
			full : out std_logic;
			q : out std_logic_vector(1 downto 0)
			);
	end component;
	
	---- signal declarations  ----
	
	signal enable2 : std_logic;
	signal enable3 : std_logic;
	signal full1 : std_logic;
	signal full2 : std_logic;
	signal full3 : std_logic;
	signal q3 : std_logic_vector (1 downto 0);
	signal gate : std_logic; 
	
begin
	
	----  component instantiations  ----
	
	u1 : cnt_4
	port map (
		clk => clk,
		enable => enable,
		full => full1,
		reset => reset
		);
	
	u2 : cnt_4
	port map (
		clk => clk,
		enable => enable2,
		full => full2,
		reset => reset
		);
	
	u3 : cnt_4
	port map (
		clk => clk,
		enable => enable3,
		full => full3,
		reset => reset,
		q => q3
		);
	
	
	enable2 <= enable and full1;
	
	enable3 <= enable2 and full2;
	
	
	---- terminal assignment ----
	process (reset, gate)	  
	begin		   
		if reset = '1' then 
			gate <= '0';
		else
			if gate = '1' then 
				pulse <= q3(1);
			else
				pulse <= '0';
			end if;
		end if;
	end process;
	
	
end struct;
