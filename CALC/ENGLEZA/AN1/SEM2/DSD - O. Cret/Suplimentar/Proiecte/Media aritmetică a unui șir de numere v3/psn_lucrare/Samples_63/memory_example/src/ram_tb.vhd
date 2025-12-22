---------------------------------------------------------------------------------------------------
--
-- Title       : TestBench for ram
-- Design      : example
-- Author      : Aldec
-- Company     : Aldec
--
---------------------------------------------------------------------------------------------------
--
-- File        : $DSN\src\ram_tb.vhd
-- Generated   : 9/20/2004, 10:54 AM
-- From        : $DSN\src\ram.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
---------------------------------------------------------------------------------------------------
--
-- Description : TestBench for ram
--
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ram_tb is
end ram_tb;

architecture TB_ARCHITECTURE of ram_tb is
	-- Component declaration of the tested unit
	component ram
	port(
		WE : in std_logic;
		CLK : in std_logic;
		ADDRrd : in std_logic_vector(6 downto 0);
		ADDRwr : in std_logic_vector(6 downto 0);
		DATA : in std_logic_vector(7 downto 0);
		Q : out std_logic_vector(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal WE : std_logic;
	signal CLK : std_logic;
	signal ADDRrd : std_logic_vector(6 downto 0);
	signal ADDRwr : std_logic_vector(6 downto 0);
	signal DATA : std_logic_vector(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Q : std_logic_vector(7 downto 0);

	--Signal is used to stop clock signal generators
	signal END_SIM: BOOLEAN:=FALSE;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	Memory : ram
		port map (
			WE => WE,
			CLK => CLK,
			ADDRrd => ADDRrd,
			ADDRwr => ADDRwr,
			DATA => DATA,
			Q => Q
		);

	--Below VHDL code is an inserted .\compile\ram.vhs
	--User can modify it ....

STIMULUS: process
begin  -- of stimulus process
--wait for <time to next event>; -- <current time>

	-----------------------
	-- INITIALIZE MEMORY --
	WE <= '1';
	ADDRrd <= "0000000";
	ADDRwr <= "0000000";
	DATA <= "00000000";
    wait for 10 ns; --0 fs
	ADDRwr <= "0000001";
	DATA <= "00000001";
    wait for 10 ns; --10 ns
	ADDRwr <= "0000010";
	DATA <= "00000010";
    wait for 10 ns; --20 ns
	ADDRwr <= "0000011";
	DATA <= "00000011";
    wait for 10 ns; --30 ns
	ADDRwr <= "0000100";
	DATA <= "00000100";
    wait for 10 ns; --40 ns
	ADDRwr <= "0000101";
	DATA <= "00000101";
    wait for 10 ns; --50 ns
	ADDRwr <= "0000110";
	DATA <= "00000110";
    wait for 10 ns; --60 ns
	ADDRwr <= "0000111";
	DATA <= "00000111";
    wait for 10 ns; --70 ns
	ADDRwr <= "0001000";
	DATA <= "00001000";
    wait for 10 ns; --80 ns
	ADDRwr <= "0001001";
	DATA <= "00001001";
    wait for 10 ns; --90 ns
	ADDRwr <= "0001010";
	DATA <= "00001010";
    wait for 10 ns; --100 ns
	ADDRwr <= "0001011";
	DATA <= "00001011";
    wait for 10 ns; --110 ns
	ADDRwr <= "0001100";
	DATA <= "00001100";
    wait for 10 ns; --120 ns
	ADDRwr <= "0001101";
	DATA <= "00001101";
    wait for 10 ns; --130 ns
	ADDRwr <= "0001110";
	DATA <= "00001110";
    wait for 10 ns; --140 ns
	ADDRwr <= "0001111";
	DATA <= "00001111";
    wait for 10 ns; --150 ns
	ADDRwr <= "0010000";
	DATA <= "00010000";
    wait for 10 ns; --160 ns
	ADDRwr <= "0010001";
	DATA <= "00010001";
    wait for 10 ns; --170 ns
	ADDRwr <= "0010010";
	DATA <= "00010010";
    wait for 10 ns; --180 ns
	ADDRwr <= "0010011";
	DATA <= "00010011";
    wait for 10 ns; --190 ns
	ADDRwr <= "0010100";
	DATA <= "00010100";
    wait for 10 ns; --200 ns
	ADDRwr <= "0010101";
	DATA <= "00010101";
    wait for 10 ns; --210 ns
	ADDRwr <= "0010110";
	DATA <= "00010110";
    wait for 10 ns; --220 ns
	ADDRwr <= "0010111";
	DATA <= "00010111";
    wait for 10 ns; --230 ns
	ADDRwr <= "0011000";
	DATA <= "00011000";
    wait for 10 ns; --240 ns
	ADDRwr <= "0011001";
	DATA <= "00011001";
    wait for 10 ns; --250 ns
	ADDRwr <= "0011010";
	DATA <= "00011010";
    wait for 10 ns; --260 ns
	ADDRwr <= "0011011";
	DATA <= "00011011";
    wait for 10 ns; --270 ns
	ADDRwr <= "0011100";
	DATA <= "00011100";
    wait for 10 ns; --280 ns
	ADDRwr <= "0011101";
	DATA <= "00011101";
    wait for 10 ns; --290 ns
	ADDRwr <= "0011110";
	DATA <= "00011110";
    wait for 10 ns; --300 ns
	ADDRwr <= "0011111";
	DATA <= "00011111";
    wait for 10 ns; --310 ns
	ADDRwr <= "0100000";
	DATA <= "00100000";
    wait for 10 ns; --320 ns
	ADDRwr <= "0100001";
	DATA <= "00100001";
    wait for 10 ns; --330 ns
	ADDRwr <= "0100010";
	DATA <= "00100010";
    wait for 10 ns; --340 ns
	ADDRwr <= "0100011";
	DATA <= "00100011";
    wait for 10 ns; --350 ns
	ADDRwr <= "0100100";
	DATA <= "00100100";
    wait for 10 ns; --360 ns
	ADDRwr <= "0100101";
	DATA <= "00100101";
    wait for 10 ns; --370 ns
	ADDRwr <= "0100110";
	DATA <= "00100110";
    wait for 10 ns; --380 ns
	ADDRwr <= "0100111";
	DATA <= "00100111";
    wait for 10 ns; --390 ns
	ADDRwr <= "0101000";
	DATA <= "00101000";
    wait for 10 ns; --400 ns
	ADDRwr <= "0101001";
	DATA <= "00101001";
    wait for 10 ns; --410 ns
	ADDRwr <= "0101010";
	DATA <= "00101010";
    wait for 10 ns; --420 ns
	ADDRwr <= "0101011";
	DATA <= "00101011";
    wait for 10 ns; --430 ns
	ADDRwr <= "0101100";
	DATA <= "00101100";
    wait for 10 ns; --440 ns
	ADDRwr <= "0101101";
	DATA <= "00101101";
    wait for 10 ns; --450 ns
	ADDRwr <= "0101110";
	DATA <= "00101110";
    wait for 10 ns; --460 ns
	ADDRwr <= "0101111";
	DATA <= "00101111";
    wait for 10 ns; --470 ns
	ADDRwr <= "0110000";
	DATA <= "00110000";
    wait for 10 ns; --480 ns
	ADDRwr <= "0110001";
	DATA <= "00110001";
    wait for 10 ns; --490 ns
	ADDRwr <= "0110010";
	DATA <= "00110010";
    wait for 10 ns; --500 ns
	ADDRwr <= "0110011";
	DATA <= "00110011";
    wait for 10 ns; --510 ns
	ADDRwr <= "0110100";
	DATA <= "00110100";
    wait for 10 ns; --520 ns
	ADDRwr <= "0110101";
	DATA <= "00110101";
    wait for 10 ns; --530 ns
	ADDRwr <= "0110110";
	DATA <= "00110110";
    wait for 10 ns; --540 ns
	ADDRwr <= "0110111";
	DATA <= "00110111";
    wait for 10 ns; --550 ns
	ADDRwr <= "0111000";
	DATA <= "00111000";
    wait for 10 ns; --560 ns
	ADDRwr <= "0111001";
	DATA <= "00111001";
    wait for 10 ns; --570 ns
	ADDRwr <= "0111010";
	DATA <= "00111010";
    wait for 10 ns; --580 ns
	ADDRwr <= "0111011";
	DATA <= "00111011";
    wait for 10 ns; --590 ns
	ADDRwr <= "0111100";
	DATA <= "00111100";
    wait for 10 ns; --600 ns
	ADDRwr <= "0111101";
	DATA <= "00111101";
    wait for 10 ns; --610 ns
	ADDRwr <= "0111110";
	DATA <= "00111110";
    wait for 10 ns; --620 ns
	ADDRwr <= "0111111";
	DATA <= "00111111";
    wait for 10 ns; --630 ns
	ADDRwr <= "1000000";
	DATA <= "01000000";
    wait for 10 ns; --640 ns
	ADDRwr <= "1000001";
	DATA <= "01000001";
    wait for 10 ns; --650 ns
	ADDRwr <= "1000010";
	DATA <= "01000010";
    wait for 10 ns; --660 ns
	ADDRwr <= "1000011";
	DATA <= "01000011";
    wait for 10 ns; --670 ns
	ADDRwr <= "1000100";
	DATA <= "01000100";
    wait for 10 ns; --680 ns
	ADDRwr <= "1000101";
	DATA <= "01000101";
    wait for 10 ns; --690 ns
	ADDRwr <= "1000110";
	DATA <= "01000110";
    wait for 10 ns; --700 ns
	ADDRwr <= "1000111";
	DATA <= "01000111";
    wait for 10 ns; --710 ns
	ADDRwr <= "1001000";
	DATA <= "01001000";
    wait for 10 ns; --720 ns
	ADDRwr <= "1001001";
	DATA <= "01001001";
    wait for 10 ns; --730 ns
	ADDRwr <= "1001010";
	DATA <= "01001010";
    wait for 10 ns; --740 ns
	ADDRwr <= "1001011";
	DATA <= "01001011";
    wait for 10 ns; --750 ns
	ADDRwr <= "1001100";
	DATA <= "01001100";
    wait for 10 ns; --760 ns
	ADDRwr <= "1001101";
	DATA <= "01001101";
    wait for 10 ns; --770 ns
	ADDRwr <= "1001110";
	DATA <= "01001110";
    wait for 10 ns; --780 ns
	ADDRwr <= "1001111";
	DATA <= "01001111";
    wait for 10 ns; --790 ns
	ADDRwr <= "1010000";
	DATA <= "01010000";
    wait for 10 ns; --800 ns
	ADDRwr <= "1010001";
	DATA <= "01010001";
    wait for 10 ns; --810 ns
	ADDRwr <= "1010010";
	DATA <= "01010010";
    wait for 10 ns; --820 ns
	ADDRwr <= "1010011";
	DATA <= "01010011";
    wait for 10 ns; --830 ns
	ADDRwr <= "1010100";
	DATA <= "01010100";
    wait for 10 ns; --840 ns
	ADDRwr <= "1010101";
	DATA <= "01010101";
    wait for 10 ns; --850 ns
	ADDRwr <= "1010110";
	DATA <= "01010110";
    wait for 10 ns; --860 ns
	ADDRwr <= "1010111";
	DATA <= "01010111";
    wait for 10 ns; --870 ns
	ADDRwr <= "1011000";
	DATA <= "01011000";
    wait for 10 ns; --880 ns
	ADDRwr <= "1011001";
	DATA <= "01011001";
    wait for 10 ns; --890 ns
	ADDRwr <= "1011010";
	DATA <= "01011010";
    wait for 10 ns; --900 ns
	ADDRwr <= "1011011";
	DATA <= "01011011";
    wait for 10 ns; --910 ns
	ADDRwr <= "1011100";
	DATA <= "01011100";
    wait for 10 ns; --920 ns
	ADDRwr <= "1011101";
	DATA <= "01011101";
    wait for 10 ns; --930 ns
	ADDRwr <= "1011110";
	DATA <= "01011110";
    wait for 10 ns; --940 ns
	ADDRwr <= "1011111";
	DATA <= "01011111";
    wait for 10 ns; --950 ns
	ADDRwr <= "1100000";
	DATA <= "01100000";
    wait for 10 ns; --960 ns
	ADDRwr <= "1100001";
	DATA <= "01100001";
    wait for 10 ns; --970 ns
	ADDRwr <= "1100010";
	DATA <= "01100010";
    wait for 10 ns; --980 ns
	ADDRwr <= "1100011";
	DATA <= "01100011";
    wait for 10 ns; --990 ns
	ADDRwr <= "1100100";
	DATA <= "01100100";
    wait for 10 ns; --1 us
	ADDRwr <= "1100101";
	DATA <= "01100101";
    wait for 10 ns; --1010 ns
	ADDRwr <= "1100110";
	DATA <= "01100110";
    wait for 10 ns; --1020 ns
	ADDRwr <= "1100111";
	DATA <= "01100111";
    wait for 10 ns; --1030 ns
	ADDRwr <= "1101000";
	DATA <= "01101000";
    wait for 10 ns; --1040 ns
	ADDRwr <= "1101001";
	DATA <= "01101001";
    wait for 10 ns; --1050 ns
	ADDRwr <= "1101010";
	DATA <= "01101010";
    wait for 10 ns; --1060 ns
	ADDRwr <= "1101011";
	DATA <= "01101011";
    wait for 10 ns; --1070 ns
	ADDRwr <= "1101100";
	DATA <= "01101100";
    wait for 10 ns; --1080 ns
	ADDRwr <= "1101101";
	DATA <= "01101101";
    wait for 10 ns; --1090 ns
	ADDRwr <= "1101110";
	DATA <= "01101110";
    wait for 10 ns; --1100 ns
	ADDRwr <= "1101111";
	DATA <= "01101111";
    wait for 10 ns; --1110 ns
	ADDRwr <= "1110000";
	DATA <= "01110000";
    wait for 10 ns; --1120 ns
	ADDRwr <= "1110001";
	DATA <= "01110001";
    wait for 10 ns; --1130 ns
	ADDRwr <= "1110010";
	DATA <= "01110010";
    wait for 10 ns; --1140 ns
	ADDRwr <= "1110011";
	DATA <= "01110011";
    wait for 10 ns; --1150 ns
	ADDRwr <= "1110100";
	DATA <= "01110100";
    wait for 10 ns; --1160 ns
	ADDRwr <= "1110101";
	DATA <= "01110101";
    wait for 10 ns; --1170 ns
	ADDRwr <= "1110110";
	DATA <= "01110110";
    wait for 10 ns; --1180 ns
	ADDRwr <= "1110111";
	DATA <= "01110111";
    wait for 10 ns; --1190 ns
	ADDRwr <= "1111000";
	DATA <= "01111000";
    wait for 10 ns; --1200 ns
	ADDRwr <= "1111001";
	DATA <= "01111001";
    wait for 10 ns; --1210 ns
	ADDRwr <= "1111010";
	DATA <= "01111010";
    wait for 10 ns; --1220 ns
	ADDRwr <= "1111011";
	DATA <= "01111011";
    wait for 10 ns; --1230 ns
	ADDRwr <= "1111100";
	DATA <= "01111100";
    wait for 10 ns; --1240 ns
	ADDRwr <= "1111101";
	DATA <= "01111101";
    wait for 10 ns; --1250 ns
	ADDRwr <= "1111110";
	DATA <= "01111110";
    wait for 10 ns; --1260 ns
	ADDRwr <= "1111111";
	DATA <= "01111111";
    wait for 10 ns; --1270 ns
	-------------------------
	-- END OF INITIALIZING --
	--       MEMORY        --
	-------------------
	-- START READING --
	DATA <= "ZZZZZZZZ";
	WE <= '0';	
	ADDRwr <= "0000000";
	ADDRrd <= "0000011";
	wait for 10 ns;	--1280 ns
	ADDRrd <= "0000111";
	wait for 10 ns;	--1290 ns
	--------------------
	-- WRITE AND READ --
	WE <= '1';
	ADDRwr <= "0001111";
	DATA <= "11111111";
	wait for 10 ns; --1300 ns
	wait for 10 ns; --1310 ns
	WE <= '0';
	DATA <= "ZZZZZZZZ";
	ADDRrd <= "0001111";
	------------------1320 ns
	wait for 10 ns; --1330 ns
	END_SIM <= TRUE;
--	end of stimulus events
	wait;
end process; -- end of stimulus process
	
CLOCK_CLK : process
begin
	if END_SIM = FALSE then
		CLK <= '0';
		wait for 5 ns; --0 fs
	else
		wait;
	end if;
	if END_SIM = FALSE then
		CLK <= '1';
		wait for 5 ns; --5 ns
	else
		wait;
	end if;
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ram of ram_tb is
	for TB_ARCHITECTURE
		for Memory : ram
			use entity work.ram(ram_arch);
		end for;
	end for;
end TESTBENCH_FOR_ram;

