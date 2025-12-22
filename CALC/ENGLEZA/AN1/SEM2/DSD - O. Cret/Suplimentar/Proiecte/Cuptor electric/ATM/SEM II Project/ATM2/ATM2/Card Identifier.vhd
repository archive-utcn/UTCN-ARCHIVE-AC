library IEEE;
use IEEE.std_logic_1164.all;

entity IDEN_CARD is
	port(ADRESA_CARD: in std_logic_vector(3 downto 0);
	BUT:in std_logic;--Buton
	ENABLE: in std_logic;
	RESET: in std_logic;
	ADDR: inout INTEGER range 0 to 11;
	OK_CARD: out std_logic);
end IDEN_CARD; 

architecture A of IDEN_CARD is
begin
	process(BUT,RESET)
	begin
		if(BUT='1' and ENABLE='1') then
			case ADRESA_CARD is
				when "0001" => ADDR <=1;
				when "0010" => ADDR <=2; 
				when "0011" => ADDR <=3; 
				when "0100" => ADDR <=4; 
				when "0101" => ADDR <=5; 
				when "0110" => ADDR <=6; 
				when "0111" => ADDR <=7; 
				when "1000" => ADDR <=8; 
				when "1001" => ADDR <=9; 
				when "1010" => ADDR <=10;
				when others => ADDR <=11;
			end case;
		end if;
		if(ADDR>0 and ADDR<11) then OK_CARD<='1';
		else OK_CARD<='0'; 
		end if;
		if (RESET='1') then ADDR<=0; OK_CARD<='0';
		end if;
		end process;
	end A;
	