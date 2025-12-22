library	IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use std.standard.all;

entity Main is
	port(
	CNL: in std_logic;
	chit:in std_logic;
	pin : in std_logic_vector(3 downto 0);
	clock: in std_logic;
	suma_zeci: in std_logic;
	suma_sute: in std_logic;
	suma_mii: in std_logic;
	regim: in std_logic;
	confirmare: in std_logic;
	anod: out std_logic_vector(3 downto 0);
	catod: out std_logic_vector(6 downto 0);
	ok_pin,ok_card: out std_logic;
	suma_invalida: out std_logic;
	ok_tranz: out std_logic;
	chit_led: out std_logic);
	
end entity;

architecture final of Main is

component rom is 
	port (A: in std_logic_vector (2 downto 0);
	CS: in std_logic;
	D: out std_logic_vector (3 downto 0)); 
end component rom;

component afisajSuma is
port
	(anod: out std_logic_vector (3 downto 0);
	catod: out std_logic_vector (6 downto 0);
	dec_H_z: in std_logic_vector (6 downto 0);
	dec_H_s: in std_logic_vector (6 downto 0);
	dec_H_m: in std_logic_vector (6 downto 0);
	clk: in std_logic;
	enable: in std_logic);
end component;	

component afisor_eroarePin is
port
	(anod: out std_logic_vector (3 downto 0);
	catod: out std_logic_vector (6 downto 0);
	clk: in std_logic;
	enable: in std_logic);
end component;	

component afisor_eroareCard is
port
	(anod: out std_logic_vector (3 downto 0);
	catod: out std_logic_vector (6 downto 0);
	clk: in std_logic;
	enable: in std_logic);
end component;	

component numarators is
	port( clk: in std_logic;
	enable : in std_logic;
	CL: in std_logic;
	sute: out std_logic_vector (3 downto 0));
end component numarators;

component numaratorz is
	port( clk: in std_logic;
	CL: in std_logic;
	zeci: out std_logic_vector (3 downto 0);
	enable : in std_logic);
end component numaratorz;

component numaratorm is
	port (CLK: in std_logic;
	      enable: in std_logic;
			CL: in std_logic;
	      mii: out std_logic_vector(1 downto 0));
end component;

component ram is
port (Clk : in std_logic;
        address : in std_logic_vector(2 downto 0);
        we : in std_logic;
		  cs : in std_logic;
        data_i : in std_logic_vector(9 downto 0);
        data_o : out std_logic_vector(9 downto 0)
     );
end component ram;

component numaratoradr is
	port( clk: in std_logic;
	adrese: out std_logic_vector (2 downto 0));
end component numaratoradr;

component divizor is
	port ( clk,enable : in std_logic;
	div_out : out std_logic);
end component divizor;

component decodificatorz is
	port( a: in std_logic_vector (3 downto 0);
	q :out std_logic_vector (6 downto 0)); 
end component;

component decodificators is
	port( a: in std_logic_vector (3 downto 0);
	q :out std_logic_vector (6 downto 0)); 
end component decodificators;

component decodificatorm is
	port( a: in std_logic_vector (1 downto 0);
	q :out std_logic_vector (6 downto 0)); 
end  component;

component afisare is
	port
	(anod: out std_logic_vector (3 downto 0);
	catod: out std_logic_vector (6 downto 0);
	catodin_zeci: in std_logic_vector(6 downto 0);
	catodin_sute: in std_logic_vector(6 downto 0);
	catodin_mii: in std_logic_vector (6 downto 0);
	clk: in std_logic;
	enable: in std_logic);
end component afisare;

component cod is
	port(a: in std_logic_vector (6 downto 0);
	b: in std_logic_vector (6 downto 0);
	c: in std_logic_vector (6 downto 0);
	d: in std_logic_vector (6 downto 0);
	an1,an2,an3,an4 : in std_logic_vector (3 downto 0);
	s1: in std_logic_vector (1 downto 0);
	y: out std_logic_vector( 6 downto 0);
	y1: out std_logic_vector (3 downto 0));
end component;

component poarta_or is
port (A: in std_logic;
B: in std_logic;
Q: out std_logic);
end component;

component poartasi is
port (A: in std_logic;
B: in std_logic;
Q: out std_logic);
end component;

component mux_chitanta is
port (A: in std_logic;
B: in std_logic;
S: in std_logic_vector (1 downto 0);
Q: out std_logic);
end component;


signal idrom: std_logic_vector(1 downto 0);
signal pinrom: std_logic_vector(3 downto 0);
signal adr : std_logic_vector(2 downto 0);
signal enrom : std_logic;
signal ensuma : std_logic;
signal suteout : std_logic_vector(3 downto 0);
signal zeciout : std_logic_vector(3 downto 0);
signal miiout: std_logic_vector (1 downto 0);
signal clkdiv : std_logic;
signal enram : std_logic:='1';
signal scriere : std_logic:='0';
signal tranzactie : std_logic_vector( 9 downto 0);
signal inscazr : std_logic_vector( 9 downto 0);
signal catzeci : std_logic_vector (6 downto 0);
signal catsute : std_logic_vector (6 downto 0);
signal catmii: std_logic_vector (6 downto 0);	
signal dec_H_z_S: std_logic_vector (6 downto 0);
signal dec_H_s_S: std_logic_vector (6 downto 0);
signal dec_H_m_S: std_logic_vector (6 downto 0); 
signal endiv :std_logic:='1';
signal enafis :std_logic:='0';
signal enafisPin :std_logic:='0';
signal enafisCard :std_logic:='0';
signal enafisSuma :std_logic:='0';
signal anodcard :std_logic_vector(3 downto 0);
signal catodcard :std_logic_vector (6 downto 0);
signal anodpin :std_logic_vector(3 downto 0);
signal catodpin :std_logic_vector (6 downto 0);
signal anodsuma :std_logic_vector(3 downto 0);
signal catodsuma :std_logic_vector (6 downto 0);
signal anodafis :std_logic_vector(3 downto 0);
signal catodafis :std_logic_vector (6 downto 0);
signal s:std_logic_vector (1 downto 0);
signal chit_led_si: std_logic;
signal chit_led_si_retr: std_logic;
signal S_mux: std_logic_vector (1 downto 0);



begin 
	afis : Afisare port map (anod=>anodafis,catod=>catodafis,catodin_zeci=>catzeci,catodin_sute=>catsute,catodin_mii=>catmii, clk=>clock,enable=>enafis);	
	afis_errCard: afisor_eroareCard port map (anod=>anodcard, catod=>catodcard, clk=>clock, enable=>enafisCard); 
	afis_errPin: afisor_eroarePin port map (anod=>anodpin, catod=>catodpin, clk=>clock, enable=>enafisPin);	
	afis_suma: afisajSuma port map (anod=>anodsuma, catod=>catodsuma, dec_H_z=>dec_H_z_S, dec_H_s=>dec_H_s_S, dec_H_m=> dec_H_m_s, clk=>clock, enable=>enafisSuma);	  
	rom1 : rom port map (a=>adr,cs=>enrom, d=>pinrom); 
	ram1 : ram port map (address=>adr,cs=>enram,we=>scriere,data_i=>tranzactie,data_o=>inscazr,clk=>clock);
	numarz : numaratorz port map (clk=>suma_zeci,enable=>ensuma,CL=>CNL,zeci=>zeciout);	
	numars : numarators port map (clk=>suma_sute,enable=>ensuma, CL=>CNL, sute=>suteout); 
	numarm: numaratorm port map (suma_mii, ensuma, CNL, miiout);
	numaradr : numaratoradr port map(clk=>clkdiv,adrese=>adr);
	dec : decodificatorz port map (a=>zeciout,q=>catzeci);
	decc : decodificators port map (a=>suteout,q=>catsute);
	decm: decodificatorm port map (miiout, catmii);
	dec_h_z : decodificatorz port map (a=>inscazr(3 downto 0),q=>dec_H_z_S);
	dec_h_s : decodificators port map (a=>inscazr(7 downto 4),q=>dec_H_s_S); 
	dec_h_m: decodificatorm port map (inscazr(9 downto 8), dec_H_m_S); 
	devifez : divizor port map(clk=>clock,div_out=>clkdiv, enable=>endiv);
	mux_chit_p: mux_chitanta port map (chit_led_si, chit_led_si_retr, S_mux, chit_led);
	muxafis : cod port map(a=>catodcard,b=>catodpin,c=>catodsuma,d=>catodafis,an1=>anodcard,an2=>anodpin,an3=>anodsuma,an4=>anodafis,s1=>s,y=>catod,y1=>anod);
	SI_chit: poartasi port map ( chit, confirmare, chit_led_si_retr);
	SAU: poarta_or port map (chit, regim, chit_led_si);
	
 	process(pin, regim)
	
	variable ok_pinvar: std_logic:='0';
	variable ok_cardvar:std_logic:='0';
	variable suma_invalidavar: std_logic:='0';
	variable ok_tranzvar:std_logic:='0';
    variable suteint: integer;
    variable zeciint: integer;
	variable miiint: integer;
	variable endivvar:std_logic:='0';
	variable scrierevar :std_logic:='0';
	variable tranzactievar:std_logic_vector(9 downto 0);
	variable suma : std_logic_vector( 9 downto 0);
	variable suteoutt : std_logic_vector(9 downto 0);
	variable zecioutt :std_logic_vector(9 downto 0);
	variable miioutt: std_logic_vector (9 downto 0);

	
  begin
	enrom<='1';
	enram<='1';
	endivvar:='1';
	scrierevar:='0';
	if pinrom=pin then
		ok_pinvar:='1';
		endivvar:='0';
		enafisPin<='0';
			if regim='1' then
			   ensuma<='1';
			s<="11";
			enafis<='1';
			enafisSuma<='0';
				if confirmare='1' then
				S_mux<="01";
				miiint:=conv_integer(miiout);
				miiint:=miiint*1000;
				miioutt:=conv_std_logic_vector(miiint,10);
				suteint:=conv_integer(suteout);
				suteint:=suteint*100;
				suteoutt:=conv_std_logic_vector(suteint,10);
				zeciint:=conv_integer(zeciout);
				zeciint:=zeciint*10;
				zecioutt:=conv_std_logic_vector(zeciint,10);
				suma:=miioutt+suteoutt+zecioutt;  
if(inscazr>suma) then
	scrierevar:='1';
	tranzactievar:=inscazr-suma;
	ok_tranzvar:='1';
	suma_invalidavar:='0';
else
	scrierevar:='1';
	suma_invalidavar:='0';
	ok_tranzvar:='0';
	s<="00";
	enafiscard<='1';
end if;
end if;
else
	S_mux<="00";
	ok_tranzvar:='0';
	suma_invalidavar:='0';
	enafis<='0';
	enafisSuma<='1';
	s<="10";
end if;
else
	ok_pinvar:='0';
	suma_invalidavar:='0';
	enafisPin<='1';
	ok_tranzvar:='0';
	s<="01";
end if;	
scriere<=scrierevar;
tranzactie<=tranzactievar;
endiv<=endivvar;
ok_card<=ok_cardvar;
ok_pin<=ok_pinvar;
ok_tranz<=ok_tranzvar;
suma_invalida<=suma_invalidavar;
	
	 end process;
 end architecture;