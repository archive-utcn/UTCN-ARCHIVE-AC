---------------------------------------------------------------------------------------------------
--
-- Title       : divider
-- Design      : proc_cosim
-- Author      : ALDEC
-- Company     : ALDEC
--
---------------------------------------------------------------------------------------------------
--
-- File        : divider.vhd
-- Generated   : 
-- From        : 
-- By          : 
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity div_rem is
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		start : in STD_LOGIC;
		a : in STD_LOGIC_VECTOR(7 downto 0);
		b : in STD_LOGIC_VECTOR(7 downto 0);
		done : out STD_LOGIC;
		quot : out STD_LOGIC_VECTOR(3 downto 0);
		remain : out STD_LOGIC_VECTOR(3 downto 0)
		);
end div_rem;

architecture div_rem_arch of div_rem is
	signal a_reg : std_logic_vector(a'range) := (others => '0');
	signal b_reg : std_logic_vector(b'range) := (others => '0');
	signal quot_int : std_logic_vector(quot'range);
	signal remain_int : std_logic_vector(remain'range);
	signal done_int  : std_logic;
	
	
begin
	
	process(clk,rst) 
	begin
		if rst = '1' then
			a_reg <= (others => '0');
			b_reg <= (others => '0'); 
		elsif clk = '1' and clk'event then
			if start = '1' then
				a_reg <= a;
				b_reg <= b;
			end if;
		end if;
	end process;
	
	
	process(clk) 
	begin			
		if rst = '1' then
			done_int <= '0';
		elsif clk = '1' and clk'event then
			done_int <= start;
		end if;
	end process;
	
	
	quot_int <= (others => '0') when b_reg = (b_reg'range => '0') else conv_std_logic_vector(conv_integer(a_reg)/conv_integer(b_reg),4);
	remain_int <= (others => '0') when b_reg = (b_reg'range => '0') else conv_std_logic_vector(conv_integer(a_reg)rem conv_integer(b_reg),4);
	
	process (clk,rst)
	begin
		if rst = '1' then
			quot <= (others => '0');
			remain <= (others => '0');
		elsif clk = '1' and clk'event then
			if done_int = '1' then
				quot <= quot_int;
				remain <= remain_int;
			end if;
		end if;
	end process;
	
	done <= done_int;
end div_rem_arch;
