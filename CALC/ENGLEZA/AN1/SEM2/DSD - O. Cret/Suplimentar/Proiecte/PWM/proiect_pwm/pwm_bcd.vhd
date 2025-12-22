library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.NUMERIC_BIT.all;
use IEEE.NUMERIC_STD.all;

entity bcd is 
	port(in_vect: in STD_LOGIC_VECTOR(7 downto 0);
		out_vect: out STD_LOGIC_VECTOR(15 downto 0));
end bcd;

architecture pwm_bcd of bcd is

function conv_bcd(bin: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
	variable i: integer := 0;
	variable bcd: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	variable bint: STD_LOGIC_VECTOR(7 downto 0) := bin;
begin
	for i in 0 to 7 loop
		bcd(15 downto 1) := bcd(14 downto 0);
		bcd(0) := bint(7);
		bint(7 downto 1) := bint(6 downto 0);
		bint(0) := '0';

		if(i < 7 and bcd(3 downto 0) > "0100") then 
			bcd(3 downto 0) := bcd(3 downto 0) + "0011";
		end if;
		
		if(i < 7 and bcd(7 downto 4) > "0100") then
			bcd(7 downto 4) := bcd(7 downto 4) + "0011";
		end if;
		
		if(i < 7 and bcd(11 downto 8) > "0100") then
			bcd(11 downto 8) := bcd(11 downto 8) + "0011";
		end if;	 
		
		if(i < 7 and bcd(15 downto 9) > "0100") then
			bcd(15 downto 9) := bcd(15 downto 9) + "0011";
		end if;
	end loop;
	
	return bcd;
end conv_bcd;

begin
	process(in_vect)
	begin
		out_vect <= conv_bcd(in_vect);
	end process;
END pwm_bcd;