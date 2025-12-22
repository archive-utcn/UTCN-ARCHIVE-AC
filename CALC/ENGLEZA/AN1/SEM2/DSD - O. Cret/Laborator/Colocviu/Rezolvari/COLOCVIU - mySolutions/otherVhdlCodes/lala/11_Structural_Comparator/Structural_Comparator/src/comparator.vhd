library ieee;
use ieee.std_logic_1164.all;

entity comparator is
	port(x1, x0, y1, y0: in bit;
	z2, z1, z0: out bit);
end comparator;

architecture arch of comparator is

component inverter is
	port(x: in bit;
	y: out bit);
end component;

component and_2 is
	port(x, y: in bit;
	z: out bit);
end component;

component and_3 is
	port(w, x, y: in bit;
	z: out bit);
end component;

component or_3 is
	port(w, x, y: in bit;
	z: out bit);
end component;

component nxor_2 is
	port(x, y: in bit;
	z: out bit);
end component;

signal nx1, nx0, ny1, ny0, aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8: bit;
begin
	
	T1: inverter port map(x1, nx1);
	T2: inverter port map(x0, nx0);
	T3: inverter port map(y1, ny1);
	T4: inverter port map(y0, ny0);
	
	T5: and_2 port map(x1, ny1, aux1);
	T6: and_3 port map(x1, x0, ny0, aux2);
	T7: and_3 port map(x0, ny1, ny0, aux3);
	T8: or_3 port map(aux1, aux2, aux3, z2);
	
	T9: nxor_2 port map(x1, y1, aux4);
	T10: nxor_2 port map(x0, y0, aux5);
	T11: and_2 port map(aux4, aux5, z1);
	
	T12: and_2 port map(nx1, y1, aux6);
	T13: and_3 port map(x0, y1, y0, aux7);
	T14: and_3 port map(nx1, nx0, y0, aux8);
	T15: or_3 port map(aux6, aux7, aux8, z0);
	
end arch;