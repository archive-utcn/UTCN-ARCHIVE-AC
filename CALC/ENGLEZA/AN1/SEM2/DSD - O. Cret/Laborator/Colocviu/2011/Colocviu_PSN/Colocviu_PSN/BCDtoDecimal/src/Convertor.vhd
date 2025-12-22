library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Convertor is
	port( A:in std_logic_vector(15 downto 0);
	B:out integer);
end Convertor;

architecture Arh_Flux of Convertor is
signal 	 A1,A2,A3,A4:integer;
begin	
	A1<=(conv_integer(A(3))*8)+(conv_integer(A(2))*4)+(conv_integer(A(1))*2)+conv_integer(A(0)) after 1 ns;
	A2<=(conv_integer(A(7))*8)+(conv_integer(A(6))*4)+(conv_integer(A(5))*2)+conv_integer(A(4)) after 1 ns;
	A3<=(conv_integer(A(11))*8)+(conv_integer(A(10))*4)+(conv_integer(A(9))*2)+conv_integer(A(8)) after 1 ns;
	A4<=(conv_integer(A(15))*8)+(conv_integer(A(14))*4)+(conv_integer(A(13))*2)+conv_integer(A(12)) after 1 ns;
	B<=A1+(A2*16)+(A3*256)+(A4*4096) after 2 ns;
end architecture Arh_Flux;
