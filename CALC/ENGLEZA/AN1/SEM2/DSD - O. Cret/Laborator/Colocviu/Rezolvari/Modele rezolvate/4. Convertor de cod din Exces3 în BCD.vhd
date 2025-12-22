
-- 4. Convertor de cod din Exces3 în BCD ----------

-- Entitate:
entity Exces3_to_BCD is
	
	-- Semanale de intrare si de iesire:	
	port (
			 Exces3:  in BIT_VECTOR (3 downto 0);
			    BCD: out BIT_VECTOR (3 downto 0)
		 );

end entity;	

-- Arhitectura: 
architecture comportamental of Exces3_to_BCD is
begin
	process (Exces3)
	begin
		case Exces3 is
			when "0011" =>  BCD <= "0000";	 --	0
			when "0100" =>  BCD <= "0001";	 --	1
			when "0101" =>  BCD <= "0010";	 --	2
			when "0110" =>  BCD <= "0011";	 --	3
			when "0111" =>  BCD <= "0100";	 --	4
			when "1000" =>  BCD <= "0101";	 --	5
			when "1001" =>  BCD <= "0110";   --	6
			when "1010" =>  BCD <= "0111";	 --	7
			when "1011" =>  BCD <= "1000";	 --	8
			when "1100" =>  BCD <= "1001";	 -- 9
			when others =>  BCD <= "1111";   -- >=10
		end case;
	end process;
end architecture;
