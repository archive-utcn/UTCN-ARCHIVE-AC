 library IEEE;
use IEEE.std_logic_1164.all;

entity identificare_card is
	port(ADRESA_CARD: in std_logic_vector(4 downto 0);
	but: in std_logic; --Clock sau Buton
	ADRESA: inout INTEGER range 0 to 31;
	card_exista: out std_logic);
end identificare_card;

architecture ARCH_IDEN_CARD of identificare_card is
begin
	process(but)
	begin
		if(but='1') then
			case ADRESA_CARD is	
				when "00001" => ADRESA <=1;
				when "00010" => ADRESA <=2;
				when "00011" => ADRESA <=3;
				when "00100" => ADRESA <=4;
				when "00101" => ADRESA <=5;
				when "00110" => ADRESA <=6;
				when "00111" => ADRESA <=7;
				when "01000" => ADRESA <=8;
				when "01001" => ADRESA <=9;
				when "01010" => ADRESA <=10;
				when "01011" => ADRESA <=11;
				when "01100" => ADRESA <=12;
				when "01101" => ADRESA <=13;
				when "01110" => ADRESA <=14;
				when "01111" => ADRESA <=15;	 
				when others => ADRESA <=16;  
			end case;	 
			if ADRESA>0 and ADRESA<16 then card_exista<='1';
			else card_exista<='0';
				end if;
		end if;	

    end process;	 

end ARCH_IDEN_CARD;