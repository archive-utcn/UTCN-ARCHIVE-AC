entity Clock is
	port (CLK: inout bit);	 
end entity;

architecture CLK_CLK of Clock is
begin
	process(CLK)
	begin
		CLK<=not CLK after 20 ns;
	end process;
	
end architecture;
