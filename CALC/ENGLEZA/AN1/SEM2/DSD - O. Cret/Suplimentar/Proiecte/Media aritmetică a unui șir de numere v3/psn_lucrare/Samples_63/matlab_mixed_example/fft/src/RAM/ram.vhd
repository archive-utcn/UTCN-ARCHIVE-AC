---------------------------------------------------------------------------------------------------
--
-- Title       : ram
-- Design      : fft
-- Author      : Arek Golec
-- Company     : Aldec
--
---------------------------------------------------------------------------------------------------
--
-- File        : ram.vhd
-- Generated   : Sun Sep 21 21:34:31 2003
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ram} architecture {ram}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;



entity ram is 
	generic (
		WIDTH : Natural:=16;
		POINT : Natural:=64;
		STAGE : Natural:=3   -- STAGE=log4(POINT)
	);
	 port(
		 addr : in STD_LOGIC_VECTOR(2*STAGE-1 downto 0);
		 ce : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 data_in : in STD_LOGIC_VECTOR(WIDTH+1 downto 0);
		 we : in STD_LOGIC;				
		 oe : in STD_LOGIC;
		 data_out : out STD_LOGIC_VECTOR(WIDTH+1 downto 0)
	     );
end ram;

--}} End of automatically maintained section

architecture ram of ram is	  

type RAM_type is array(0 to POINT-1) of std_logic_vector(WIDTH+1 downto 0);
signal RAM_array : RAM_type;

begin

	-- enter your statements here --
	process(clk)			
	begin
		if rising_edge(clk) then
			if ce = '1' then
				if we = '1' then
					RAM_array(conv_integer(addr)) <= data_in;
				end if;
			end if;
		end if;
	end process;
	
	with oe	select
	data_out <=  RAM_array(conv_integer(addr)) when '1',
					(others => '0') when others;
	
end ram;
