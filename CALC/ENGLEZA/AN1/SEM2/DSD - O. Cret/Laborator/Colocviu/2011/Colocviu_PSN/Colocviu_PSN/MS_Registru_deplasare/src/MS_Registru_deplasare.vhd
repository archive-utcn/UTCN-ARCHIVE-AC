entity Shifter is
	port(A:in bit_vector(7 downto 0);
	Load,Reset,L,R,CLK:in bit;
	Q: inout bit_vector(7 downto 0):="00000000");
end entity;

architecture ARH_Shifter of Shifter is
begin
	process(L,R,CLK)
	begin
		if(CLK'event and CLK='1') then
			if(Reset='1') then Q<="00000000";
			elsif(Load='1') then Q<=A;
			elsif(L='1' and R='0') then Q<=Q sll 1;
			elsif(L='0' and R='1') then Q<=Q srl 1;
			end if;
			end if;
			end process;
end architecture;	

entity MS_Shifter is
end entity;

architecture ARH_MS_Shifter of MS_Shifter is

component Shifter is
		port(A:in bit_vector(7 downto 0);
	Load,Reset,L,R,CLK:in bit;
	Q: inout bit_vector(7 downto 0):="00000000");
end component;

signal Sa:bit_vector(7 downto 0):="01010101";
signal Sq:bit_vector(7 downto 0):="00000000";
signal Sload,Sreset,Sl,Sr,CLK:bit;

begin
	P1:Shifter port map(Sa,Sload,Sreset,Sl,Sr,CLK,Sq);
	Ceas: process(CLK)
	begin
		CLK<=not CLK after 10ns;
	end process;
	Sload<='1','0' after 20 ns,'1' after 30 ns,'0' after 60 ns;
	Sreset<='0','1' after 20 ns,'0' after 40 ns;
	Sl<='0','1' after 60 ns,'0' after 100ns;
	Sr<='0','1' after 100 ns;
	end architecture;

			