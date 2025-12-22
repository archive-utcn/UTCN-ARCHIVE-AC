library IEEE;
use IEEE.std_logic_1164.all;

entity banc_meniu is
	port(m_sel: in std_logic_vector(1 downto 0);
		verif_pin: in bit;
		afisare, extragere, iesire: out std_logic);
end banc_meniu;

architecture meniu of banc_meniu is	
begin
	
	afisare <= '1' when m_sel="01" and verif_pin = '1' else '0';
	extragere <= '1' when m_sel="10" and verif_pin = '1'  else '0';
	iesire <= '1' when m_sel="11" and verif_pin = '1'  else '0';
	
end meniu;

