entity Bist_JK is
	port( J,K:in bit;
	Q:inout bit);
end entity;

architecture ARH_JK of Bist_JK is
signal CLK: bit;

begin	
	process(CLK)   
	begin
		CLK<=not CLK after 10 ns;
	end process;
	process(J,K,CLK)
	begin	
		if(CLK'event and CLK='1') then
		if(J='0' and K='0') then Q<=Q;
		elsif(J='0' and K='1') then Q<='0';
		elsif(J='1' and K='0') then Q<='1';
		elsif(J='1' and K='1') then Q<=not Q;	 
		end if;							
		end if;
		end process;
end architecture;

entity MS_JK is
end entity;

architecture ARH_MS_JK of MS_JK is

component Bist_JK is
	port( J,K:in bit;
	Q:inout bit);
end component;

signal Sj,Sk,Sq: bit;
begin	

	P: Bist_JK port map(Sj,Sk,Sq);
	Sj<='0','1' after 40 ns;
	Sk<='0','1' after 20 ns,'0' after 40 ns,'1' after 60 ns;
end architecture;
