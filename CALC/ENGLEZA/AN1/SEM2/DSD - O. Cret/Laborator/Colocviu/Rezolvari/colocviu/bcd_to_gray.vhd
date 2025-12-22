library ieee;
use ieee.std_logic_1164;

entity bcd_to_gray_conv is
	port(bcd: in BIT_VECTOR(3 downto 0);
	gray: out BIT_VECTOR(3 downto 0));
end entity;

architecture arh_converter of bcd_to_gray_conv is
begin	 
	gray(3)<=bcd(3);
	gray(2)<=bcd(3) xor bcd(2);
	gray(1)<=bcd(1) xor bcd(2);
	gray(0)<=bcd(1) xor bcd(0);
end architecture;

	