entity Scazator_1bit is
	port( A:in bit;
	B: in bit;
	Q:out bit;
	Borrow:out bit:='0');
end entity;

architecture ARH_Scazator of Scazator_1bit is
begin
	process(A,B)
	begin
		if(A='1' and B='0') then Q<='1'; Borrow<='0';
		elsif(A='1' and B='1') then Q<='0'; Borrow<='0';
		elsif(A='0' and B='0') then Q<='0'; Borrow<='0';
		elsif(A='0' and B='1') then Q<='0'; Borrow<='1';
		end if;
		end process;
		end architecture;
		
entity MS is
	begin
	end;

architecture MS_Arh of MS is

component Scazator_1bit is
	port( A:in bit;
	B: in bit;
	Q :out bit;
	Borrow:out bit:='0');
end component;

signal A,B,C,D:bit;

begin
Scazator: Scazator_1bit port map(A,B,C,D);
A<='0' ,'1' after 20 ns,'0' after 40 ns;
B<='1' ,'0'	after 40 ns,'1' after 80 ns;
end architecture;