
-- 3. Convertor de cod din 2421 în BCD ----------

-- Entitate:
entity c2421_to_BCD is
	
	-- Semanale de intrare si de iesire:	
	port (
			 c2421:  in BIT_VECTOR (3 downto 0);
			   BCD: out BIT_VECTOR (3 downto 0)
		 );

end entity;	

-- Arhitectura: 
architecture comportamental of c2421_to_BCD is
begin
	process (c2421)
	begin
		case c2421 is
			when "0000" =>  BCD <= "0000";	 --	0
			when "0001" =>  BCD <= "0001";	 --	1
			when "0010" =>  BCD <= "0010";	 --	2
			when "0011" =>  BCD <= "0011";	 --	3
			when "0100" =>  BCD <= "0100";	 --	4
			when "0101" =>  BCD <= "0101";	 --	5
			when "0110" =>  BCD <= "0110";   --	6
			when "0111" =>  BCD <= "0111";	 --	7
			when "1110" =>  BCD <= "1000";	 --	8
			when "1111" =>  BCD <= "1001";	 -- 9
			when others =>  BCD <= "1111";   -- >=10
		end case;
	end process;
end architecture;
