library ieee;
use ieee.std_logic_1164.all;

entity Memorie_ROM is
	port(A_ROM: in BIT_VECTOR(3 downto 0);
	CS_ROM: in BIT;
	D_ROM: out BIT_VECTOR(7 downto 0));
end Memorie_ROM;

architecture ArhROM of Memorie_ROM is 
type MATRIX is array (0 to 15) of BIT_VECTOR(7 downto 0); 
begin
   process (A_ROM, CS_ROM)
variable M : MATRIX :=("00000000","00000001","00000010","00000011","00000100","00000101","00000110","00000111","00001000","00001001","00001010","00001011","00001100","00001101","00001110","00001111");
begin	 
	if CS_ROM='0' then D_ROM<="11111111";
	else
     case A_ROM is
       when "0000" =>D_ROM<= M(0);
       when "0001" =>D_ROM<= M(1);
       when "0010" =>D_ROM<= M(2);
       when "0011" =>D_ROM<= M(3);
       when "0100" =>D_ROM<= M(4);
       when "0101" =>D_ROM<= M(5);
       when "0110" =>D_ROM<= M(6);
       when "0111" =>D_ROM<= M(7);
       when "1000" =>D_ROM<= M(8);
       when "1001" =>D_ROM<= M(9);
       when "1010" =>D_ROM<= M(10);
       when "1011" =>D_ROM<= M(11);
       when "1100" =>D_ROM<= M(12);
       when "1101" =>D_ROM<= M(13);
       when "1110" =>D_ROM<= M(14);
       when "1111" =>D_ROM<= M(15);
	 end case;					   
	end if;
  end process;
end;

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity Memorie_ROM is
--	port(A_ROM: in std_logic_vector(3 downto 0);
--	CS_ROM: in BIT;
--	D_ROM: out BIT_VECTOR(7 downto 0));
--end Memorie_ROM;
--
--architecture ArhROM of Memorie_ROM is 
--type MATRIX is array (0 to 15) of BIT_VECTOR(7 downto 0); 
--begin
--   process (A_ROM, CS_ROM)
--variable M : MATRIX :=("00000000","00000001","00000010","00000011","00000100","00000101","00000110","00000111","00001000","00001001","00001010","00001011","00001100","00001101","00001110","00001111");
--begin	 
--	if CS_ROM='0' then D_ROM<="11111111";
--	else
--		D_ROM<=M(to_integer(unsigned(A_ROM)));
--	end if;
--	end process;
--end;