
-- 6. Decodificator BCD – zecimal

-- Entitate:
entity BCD_to_zecimal is
	
	-- Semanale de intrare si de iesire:	
	port (
			 BCD:  in BIT_VECTOR (3 downto 0);
			   Y: out BIT_VECTOR (9 downto 0)
		 );

end entity;	

-- Arhitectura: 
architecture comportamental of BCD_to_zecimal is
begin
	process (BCD)
	begin
		case BCD is
			when "0000" =>  Y <= "0000000001";		 --	0
			when "0001" =>  Y <= "0000000010";		 --	1
			when "0010" =>  Y <= "0000000100";		 --	2
			when "0011" =>  Y <= "0000001000";		 --	3
			when "0100" =>  Y <= "0000010000";		 --	4
			when "0101" =>  Y <= "0000100000";		 --	5
			when "0110" =>  Y <= "0001000000";	     -- 6
			when "0111" =>  Y <= "0010000000";		 --	7
			when "1000" =>  Y <= "0100000000";		 --	8
			when "1001" =>  Y <= "1000000000";		 -- 9
			when others =>  Y <= "0000000000";  	 -- >= 10  
		end case;
	end process;
end architecture;
