library IEEE;
use IEEE.std_logic_1164.all;

entity read_pin is
	port(sw: in std_logic_vector(3 downto 0);--valoare introdusa de la switch
		sel: in std_logic_vector(1 downto 0); --selectii
		but_pin: in std_logic; 
		id_client: in std_logic_vector(3 downto 0);
		verif_pin: out bit); --iesire (1 daca pinul introdus este egal cu pinul din memorie altfel 0)
end read_pin;

architecture pin of read_pin is
	component verificare_pin is
		port(enable: in std_logic;
			pin_in: in std_logic_vector(15 downto 0);
			id_client: in std_logic_vector(3 downto 0);
			verifpin: out bit);
	end component;
	
	signal pin_in: std_logic_vector(15 downto 0);--Pinul introdus
	signal ok: std_logic := '0';
begin						 
	process(but_pin)
	begin
			if but_pin = '1' then	
				case sel is
					when "00"=>pin_in(3 downto 0) <= sw(3 downto 0);
					when "01"=>pin_in(7 downto 4) <= sw(3 downto 0);
					when "10"=>pin_in(11 downto 8) <= sw(3 downto 0);
					when others =>pin_in(15 downto 12) <= sw(3 downto 0);	  
				end case;	
			end if;
			
			if sel = "11" then
				ok <= '1';
			end if;
	end process;
	
	verif: verificare_pin port map(ok,pin_in,id_client,verif_pin);
	
end pin;