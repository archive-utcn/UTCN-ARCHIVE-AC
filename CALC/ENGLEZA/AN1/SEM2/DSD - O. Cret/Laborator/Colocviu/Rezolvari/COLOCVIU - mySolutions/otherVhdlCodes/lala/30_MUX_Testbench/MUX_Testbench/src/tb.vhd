library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture ar of tb is
component mux is
	port(i: in bit_vector(3 downto 0);
	sel: in bit_vector(1 downto 0);
	o: out bit);
end component;

signal i: bit_vector(3 downto 0);
signal sel: bit_vector(1 downto 0);
signal o: bit;

begin
	UUT: mux port map (i, sel, o);
	i<="0000", "0001" after 80 ns, "0010" after 160 ns, "0011" after 240 ns, "0100" after 320 ns, "0101" after 400 ns, "0110" after 480 ns, "0111" after 560 ns, "1000" after 640 ns, "1001" after 720 ns, "1010" after 800 ns, "1011" after 880 ns, "1100" after 960 ns, "1101" after 1040 ns, "1101" after 1120 ns, "1110" after 1200 ns, "1111" after 1280 ns;
	sel<="00", "01" after 20 ns, "10" after 40 ns, "11" after 60 ns, "00"after 80 ns, "01" after 100 ns, "10" after 120 ns, "11" after 140 ns, "00"after 160 ns, "01" after 180 ns, "10" after 200 ns, "11" after 220 ns, "00"after 240 ns, "01" after 260 ns, "10" after 280 ns, "11" after 300 ns,
		"00"after 320 ns, "01" after 340 ns, "10" after 360 ns, "11" after 380 ns, "00"after 400 ns, "01" after 420 ns, "10" after 440 ns, "11" after 460 ns, "00"after 480 ns, "01" after 500 ns, "10" after 520 ns, "11" after 540 ns, "00"after 560 ns, "01" after 580 ns, "10" after 600 ns, "11" after 620 ns,
		"00"after 640 ns, "01" after 660 ns, "10" after 680 ns, "11" after 700 ns, "00"after 720 ns, "01" after 740 ns, "10" after 760 ns, "11" after 780 ns, "00"after 800 ns, "01" after 820 ns, "10" after 840 ns, "11" after 860 ns, "00"after 880 ns, "01" after 900 ns, "10" after 920 ns, "11" after 940 ns,
		"00"after 960 ns, "01" after 980 ns, "10" after 1000 ns, "11" after 1020 ns, "00"after 1040 ns, "01" after 1060 ns, "10" after 1080 ns, "11" after 1100 ns, "00"after 1120 ns, "01" after 1140 ns, "10" after 1160 ns, "11" after 1180 ns, "00"after 1200 ns, "01" after 1220 ns, "10" after 1240 ns, "11" after 1260 ns;
end ar;