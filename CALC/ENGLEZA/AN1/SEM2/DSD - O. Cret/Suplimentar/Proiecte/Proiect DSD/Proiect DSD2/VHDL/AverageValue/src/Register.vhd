library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRegister is
	port (	Clk : in STD_LOGIC;
			Output : out STD_LOGIC_VECTOR (3 downto 0) );
end ShiftRegister;

architecture SRegister of ShiftRegister is
signal N: STD_LOGIC_VECTOR (3 downto 0) := "1110";
begin
	process(Clk)
	begin
		if rising_edge(Clk) then
			case N is
				when "1110" => 	Output <= "1101";
								N <= "1101";
				when "1101" =>	Output <= "1011";
								N <= "1011";
				when "1011" =>
								Output <= "0111";
								N <= "0111";
				when others =>
								Output <= "1110";
								N <= "1110";
			end case;
		end if;
	end process;
end architecture SRegister;