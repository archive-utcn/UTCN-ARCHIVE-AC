
-- 7. Decodificator binar – zecimal

-- Entitate:
entity binar_to_zecimal is
	
	-- Semanale de intrare si de iesire:	
	port (
			 binar:  in BIT_VECTOR (3 downto 0);
			     Y: out BIT_VECTOR (15 downto 0)
		 );

end entity;	

-- Arhitectura: 
architecture comportamental of binar_to_zecimal is
begin
	process (binar)
	begin
		case binar is
			when "0000" =>  Y <= "0000000000000001";	 --	0
			when "0001" =>  Y <= "0000000000000010";	 --	1
			when "0010" =>  Y <= "0000000000000100";	 --	2
			when "0011" =>  Y <= "0000000000001000";	 --	3
			when "0100" =>  Y <= "0000000000010000";	 --	4
			when "0101" =>  Y <= "0000000000100000";	 --	5
			when "0110" =>  Y <= "0000000001000000";     -- 6
			when "0111" =>  Y <= "0000000010000000";	 --	7
			when "1000" =>  Y <= "0000000100000000";	 --	8
			when "1001" =>  Y <= "0000001000000000";	 -- 9
			when "1010" =>  Y <= "0000010000000000";     -- 10
			when "1011" =>  Y <= "0000100000000000";  	 --	11
			when "1100" =>  Y <= "0001000000000000";  	 --	12
			when "1101" =>  Y <= "0010000000000000";  	 --	13
			when "1110" =>  Y <= "0100000000000000";  	 --	14
			when "1111" =>  Y <= "1000000000000000";  	 --	15
		end case;
	end process;
end architecture;
