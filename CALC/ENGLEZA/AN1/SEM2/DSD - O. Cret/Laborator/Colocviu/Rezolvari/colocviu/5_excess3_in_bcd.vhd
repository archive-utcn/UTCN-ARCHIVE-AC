library ieee;
use ieee.std_logic_1164.all; 
use IEEE.std_logic_arith.all;

entity excess3_to_bcd_conv is
	port(exc: in unsigned(3 downto 0);
	bcd: out unsigned(3 downto 0));
end entity;

architecture arh_exc_convertor of excess3_to_bcd_conv is
begin
	bcd<=exc - 3;
end architecture;