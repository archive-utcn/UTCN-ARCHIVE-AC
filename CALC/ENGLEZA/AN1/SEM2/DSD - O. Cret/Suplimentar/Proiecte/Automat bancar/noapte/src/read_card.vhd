library IEEE;
use IEEE.std_logic_1164.all;	

entity read_card is
	port(sw: in std_logic_vector(3 downto 0);--valoare introdusa de la switch
		sel: in std_logic_vector(1 downto 0); --selectii
		but_card: in std_logic; 
		clk: in std_logic;
		id_client: out std_logic_vector(3 downto 0);
		verif_card: out bit); --iesire comparator (1 daca pinul introdus este egal cu pinul din memorie altfel 0)
end read_card;

architecture rcard of read_card is
	component verificare is
		port(card_in: std_logic_vector(15 downto 0);
			enable: in std_logic;
			clk: in std_logic;
			id_number: out std_logic_vector(3 downto 0);
			verif: out bit);
	end component;
	
	signal cod_in: std_logic_vector(15 downto 0);--Pinul introdus
	signal ok: std_logic := '0';
begin 
	
	process(but_card,clk)
	begin
		if but_card='1' then
				case sel is
				when "00"=>cod_in(3 downto 0) <= sw(3 downto 0);
				when "01"=>cod_in(7 downto 4) <= sw(3 downto 0);
				when "10"=>cod_in(11 downto 8) <= sw(3 downto 0);
				when others =>cod_in(15 downto 12) <= sw(3 downto 0);	  
			end case;	
		end if;
		
		if sel = "11" then
			ok <= '1';
		end if;
	end process;
	
	verif: verificare port map(cod_in,ok,clk,id_client,verif_card);
	
end rcard;													 