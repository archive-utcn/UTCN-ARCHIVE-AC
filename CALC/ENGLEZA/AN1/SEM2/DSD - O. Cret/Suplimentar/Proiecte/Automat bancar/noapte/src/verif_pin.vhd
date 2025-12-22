library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity verificare_pin is
	port(enable: in std_logic;
		pin_in: in std_logic_vector(15 downto 0);
		id_client: in std_logic_vector(3 downto 0);
		verifpin: out bit);
end verificare_pin;

architecture verif_pin of verificare_pin is
	-- Memorie id_CARDURI 
	type pin_mem is array (0 to 4) of STD_LOGIC_VECTOR(15 downto 0);
	constant cards_pin: pin_mem := (
	0 => "0010110000010111",
	1 => "1110010100111101",
	2 => "1011100000000000",
	3 => "0111110000111011",
	4 => "1100101000111100");
	
	signal pin_m: std_logic_vector(15 downto 0);--Pinul din memorie
	signal corect: bit := '0';
	signal idclient: integer := 0;
begin
	idclient <= conv_integer(id_client);
	pin_m <= cards_pin(idclient);
	
	process(enable)
	begin
		if enable = '1' then
			if pin_in = pin_m then
				corect <= '1';
			end if;
		end if;	   
	end process;   
	verifpin <= corect;
end verif_pin;