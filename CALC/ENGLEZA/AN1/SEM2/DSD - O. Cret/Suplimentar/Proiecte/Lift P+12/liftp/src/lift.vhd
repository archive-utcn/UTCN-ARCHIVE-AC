library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity test12 is
	port(eta,etd:in std_logic_vector(3 downto 0);
	clk1,reset:in std_logic;
	r1,r2: in std_logic_vector(12 downto 0);
	etdeta:out std_logic_vector(3 downto 0));
end test12;

architecture arh of test12 is
component demux is
	port(q:in std_logic_vector(3 downto 0);
	sel:in std_logic_vector(1 downto 0);
	clk:in std_logic;
	e,w,r:out std_logic_vector(3 downto 0));
end component;	

component penc is
	port(a: in std_logic_vector(12 downto 0);
	s,w,re:in std_logic;
	b:out std_logic_vector(3 downto 0));
end component;
component 	comp4bit is
	port(a,b: in std_logic_vector(3 downto 0);
	c:out std_logic_vector(1 downto 0));
end component;		

component reg is
	port (i: in std_logic_vector (3 downto 0);
	r: in std_logic;
	clk: in std_logic;
	o: out std_logic_vector (3 downto 0));
end component;

COMponent decoder1 is
 port(a:in std_logic_vector(3 downto 0);
      b:out std_logic_vector(12 downto 0));
end component;
component input1 is
	port (i, reset: in std_logic_vector (12 downto 0); 
	clk: in std_logic;
	o: out std_logic_vector (12 downto 0));
end component;
component sau13 is
	port(a:in std_logic_vector(12 downto 0);
	b:out std_logic);
end component;

component comp4 is
	port(a,b:in std_logic_vector(3 downto 0);
	c,d,e:out std_logic);
end component;	

component  reg1 is 
	port(clk,a:in std_logic;
	b:out std_logic);
end component;

component mux is
	port(a,b,c,d:in std_logic;
	y:out std_logic);
end component; 

component demux1 is 
	port(a,b,c,en:in std_logic;
	d,e:out std_logic);
end component;

component sau1 is 
	port(a,b:in std_logic;
	y:out std_logic);
end component;
component  neg is 
	port(a:in std_logic;
	y:out std_logic);
end component;

component mux12 is
	port (a,b: in std_logic_vector (12 downto 0);
	c,d:in std_logic;
	f: out std_logic_vector(12 downto 0));
end component;

signal s,eta_etd,etd_eta,etd1:std_logic_vector(3 downto 0);
signal se:std_logic_vector(1 downto 0);
signal s1,s2,s3,s4,k8:std_logic_vector(12 downto 0);
signal s5,s6,x1,x2,z1,z2,p,x3,z3,z4,z5,z6,k5,k4,k6,k7:std_logic;

begin 
	c1:reg port map(i=>etd,r=>reset,clk=>clk1,o=>s);
	c2:comp4bit port map(a=>s,b=>eta,c=>se);
	c3:demux port map(q=>s,sel=>se,clk=>clk1,e=>etd_eta,w=>eta_etd,r=>etdeta);
	c4:decoder1 port map(a=>etd_eta,b=>s1);
	c5:decoder1 port map(a=>eta_etd,b=>s2);
	c6:input1 port map(clk=>clk1,i=>s1,o=>s3,reset=>r1);
	c7:input1 port map(clk=>clk1,i=>s2,o=>s4,reset=>r2);
	c8:sau13 port map(a=>s3,b=>s5);
	c9:sau13 port map(a=>s4,b=>s6);
    c10:comp4 port map(a=>etd1,b=>eta,c=>x1,d=>x2,e=>x3);
	c11:reg1 port map(a=>x1,clk=>clk1,b=>z1);
	c12:reg1 port map(a=>x2,clk=>clk1,b=>z2);
	c13:mux port map(a=>s5,b=>s6,c=>z1,d=>z2,y=>p);
	c14:demux1 port map(a=>p,b=>z1,c=>z2,en=>x3,d=>z3,e=>z4); 
	c15:neg port map(a=>z3,y=>z5);
	c16:neg port map(a=>z4,y=>z6);
	c17:sau1 port map(a=>z3,b=>z6,y=>k4);
	c18:sau1 port map(a=>z4,b=>z5,y=>k5);  
	c19:sau1 port map(a=>k4,b=>x1,y=>k6);
	c20:sau1 port map(a=>k5,b=>x2,y=>k7);
	c21:mux12 port map(a=>s3,b=>s4,c=>k6,d=>k7,f=>k8);
	c22:penc port map(a=>k8,s=>k6,w=>k7,b=>etd1,re=>reset);
end arh;