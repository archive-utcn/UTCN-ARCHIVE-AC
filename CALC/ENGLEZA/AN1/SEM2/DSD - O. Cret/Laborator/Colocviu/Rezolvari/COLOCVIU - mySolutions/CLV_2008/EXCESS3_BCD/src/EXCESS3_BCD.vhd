 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;
 use ieee.std_logic_arith.all;
 
 entity EXCESS3_BCD is
	 port(e: in std_logic_vector(3 downto 0);
	 b: out std_logic_vector(3 downto 0));
 end EXCESS3_BCD;
 
 --architecture arh of EXCESS3_BCD is
-- begin	 
--	 process(e)
--	 begin
--	 case e is
--		 when "0011" => b <= "0000"; --0
--		 when "0100" => b <= "0001"; --1
--		 when "0101" => b <= "0010"; --2
--		 when "0110" => b <= "0011"; --3
--		 when "0111" => b <= "0100"; --4 
--		 when "1000" => b <= "0101"; --5
--		 when "1001" => b <= "0110"; --6
--		 when "1010" => b <= "0111"; --7
--		 when "1011" => b <= "1000"; --8
--		 when "1100" => b <= "1001"; --9
--		 when "1101" => b <= "1010"; --10
--		 when "1110" => b <= "1011"; --11
--		 when "1111" => b <= "1100"; --12  
--		 when others => null;
--	 end case;
--	 end process;
-- end architecture arh;	   

architecture arh of EXCESS3_BCD is
begin
	b<=e-3;
end architecture arh;
 