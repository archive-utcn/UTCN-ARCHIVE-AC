library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bjack is
	port (
		L_L  : out STD_LOGIC_VECTOR (6 downto 0);
		LEDS : out STD_LOGIC_VECTOR (7 downto 0);
		L_H  : out STD_LOGIC_VECTOR (6 downto 0);
		D_L : inout STD_LOGIC_VECTOR (3 downto 0);
		D_H : inout STD_LOGIC_VECTOR (1 downto 0);
		BUST : inout STD_LOGIC;
		HOLD : inout STD_LOGIC;
		NEW_CARD : in STD_LOGIC;
		GEN_RES  : in STD_LOGIC;
		GEN_CLK  : in STD_LOGIC;
		START    : in STD_LOGIC;
		SYS_CLK  : in STD_LOGIC);
end bjack;

architecture STRUCTURE of bjack is

-- components declaration

component AND2
	port (
		I0 : in STD_LOGIC;
		I1 : in STD_LOGIC;
		O : out STD_LOGIC);
end component;

component INV
	port (
		I : in STD_LOGIC;
		O : out STD_LOGIC);
end component;

component BIN2BCD
	port (
		BIN : in STD_LOGIC_VECTOR (4 downto 0);
		BCD_H : out STD_LOGIC_VECTOR (1 downto 0);
		BCD_L : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component BJACK_C
	port (
		CARD: in STD_LOGIC_VECTOR (3 downto 0);
        CLOCK: in STD_LOGIC;
        NEW_C: in STD_LOGIC;
        NEW_G: in STD_LOGIC;
        BUST: out STD_LOGIC;
        HAND: out STD_LOGIC_VECTOR (4 downto 0);
        HOLD: out STD_LOGIC;
        NEXT_C: out STD_LOGIC);
end component;


component JOHNSON8
	port (
        CLK: in STD_LOGIC;
        RESET: in STD_LOGIC;
        Q: out STD_LOGIC_VECTOR (7 downto 0));
end component;

component OR2
	port (
		I0 : in STD_LOGIC;
		I1 : in STD_LOGIC;
		O : out STD_LOGIC);
end component;

component MUX
	port (
		A : in STD_LOGIC_VECTOR (3 downto 0);
		B : in STD_LOGIC_VECTOR (4 downto 0);
		Y : out STD_LOGIC_VECTOR (4 downto 0);
		S : in STD_LOGIC);
end component;

component GEN
	port (
		CLK: in STD_LOGIC;
		RES: in STD_LOGIC;
		DO: out STD_LOGIC_VECTOR (3 downto 0) ;
		ENC: in STD_LOGIC);
end component;

component BCD2LED
	port (
		DIGIT_H : in STD_LOGIC_VECTOR (1 downto 0);
		DIGIT_L : in STD_LOGIC_VECTOR (3 downto 0);
		LED_H : out STD_LOGIC_VECTOR (6 downto 0);
		LED_L : out STD_LOGIC_VECTOR (6 downto 0);
		OFF : in STD_LOGIC);
end component;

-- signals declaration

	signal CLK : STD_LOGIC;
	signal NOT_NEW_CARD : STD_LOGIC;
	signal NEXT_CARD : STD_LOGIC;
	signal OFF : STD_LOGIC;
	signal NEW_G : STD_LOGIC;
	signal S : STD_LOGIC;
	signal DO : STD_LOGIC_VECTOR (3 downto 0);
	signal HAND : STD_LOGIC_VECTOR (4 downto 0);
	signal VIS : STD_LOGIC_VECTOR (4 downto 0);


begin

-- components 

I1 : AND2
	port map(
		I0 => BUST,
		I1 => GEN_CLK,
		O => OFF);

I13 : INV
	port map(
		I => START,
		O => NEW_G);
		
I14 : BIN2BCD
	port map(
		BIN => VIS,
		BCD_H => D_H,
		BCD_L => D_L);
		
I12 : INV
	port map(
		I => NEW_CARD,
		O => NOT_NEW_CARD);
		
I5 : INV
	port map(
		I => NEXT_CARD,
		O => CLK);
		
I6 : BJACK_C
	port map(
		CARD => DO,
		HAND => HAND,
		BUST => BUST,
		CLOCK => SYS_CLK,
		HOLD => HOLD,
		NEW_C => NOT_NEW_CARD,
		NEW_G => NEW_G,
		NEXT_C => NEXT_CARD);
		
I17 : JOHNSON8
	port map(
		Q => LEDS,
		CLK => CLK,
		RESET => NEW_G);
		
I8 : OR2
	port map(
		I0 => HOLD,
		I1 => BUST,
		O => S);
		
I9 : MUX
	port map(
		A => DO,
		B => HAND,
		Y => VIS,
		S => S);
		
I10 : GEN
	port map(
		DO => DO,
		CLK => GEN_CLK,
		RES => GEN_RES,
		ENC => NEW_CARD);
		
I11 : BCD2LED
	port map(
		DIGIT_H => D_H,
		DIGIT_L => D_L,
		LED_H => L_H,
		LED_L => L_L,
		OFF => OFF);

end STRUCTURE;
