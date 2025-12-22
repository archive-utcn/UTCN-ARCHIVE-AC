library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.all;
use STD.TEXTIO.all;


entity testbench is
end testbench;

architecture TESTBENCH_ARCH of testbench is

	file RESULTS: TEXT open WRITE_MODE is "results.txt";
	shared variable  END_SIM : BOOLEAN := FALSE;
	
-- procedure declaration
	
	procedure WRITE_RESULTS(BUST, HOLD, NEW_CARD, GEN_RES, GEN_CLK, START, SYS_CLK : STD_LOGIC;
						L_L, L_H: STD_LOGIC_VECTOR ( 6 downto 0 );
						LEDS : STD_LOGIC_VECTOR ( 7 downto 0 );
						D_L : STD_LOGIC_VECTOR ( 3 downto 0 );
						D_H : STD_LOGIC_VECTOR ( 1 downto 0 ) ) is
			variable L_OUT : LINE;
		begin
			write(l_out, now, right, 15, ps);
			-- write inputs
			write(l_out,NEW_CARD, right, 2);
			write(l_out,GEN_RES, right, 2);
			write(l_out,START, right, 2);
			write(l_out,GEN_CLK, right, 2);
			write(l_out,SYS_CLK, right, 2);
			-- write outputs
			write(l_out,D_L, right, 5);
			write(l_out,D_H, right, 3);
			write(l_out,BUST, right, 2);
			write(l_out,HOLD, right, 2);
			write(l_out,L_L, right, 8);
			write(l_out,L_H, right, 8);
			write(l_out,LEDS, right, 9);
			writeline(results, l_out);
		end;

-- tested component declaration
	
	component BJACK
		is port (
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
	end component;

	signal SYS_CLK : STD_LOGIC;
	signal START : STD_LOGIC;
	signal NEW_CARD : STD_LOGIC;
	signal L_L : STD_LOGIC_VECTOR (6 downto 0);
	signal L_H : STD_LOGIC_VECTOR (6 downto 0);
	signal LEDS : STD_LOGIC_VECTOR (7 downto 0);
	signal GEN_RES : STD_LOGIC;
	signal GEN_CLK : STD_LOGIC;
	signal D_L : STD_LOGIC_VECTOR (3 downto 0);
	signal D_H : STD_LOGIC_VECTOR (1 downto 0);
	signal BUST : STD_LOGIC;
	signal HOLD : STD_LOGIC;

begin

-- tested component

UUT : BJACK
		port map (
			SYS_CLK => SYS_CLK,
			START => START,
			NEW_CARD => NEW_CARD,
			L_L => L_L,
			L_H => L_H,
			D_L => D_L,
			D_H => D_H,
			BUST => BUST,
			HOLD => HOLD,      
			LEDS => LEDS,
			GEN_RES => GEN_RES,
			GEN_CLK => GEN_CLK);

-- generate SYS_CLK, period 80 ns

SYS_CLK_G:	process
				begin
					if END_SIM = FALSE then
							SYS_CLK <= '0';
						wait for 20 ns;
							SYS_CLK <= '1';
						wait for 20 ns;
					else 
						wait;  
					end if;
			end process;

-- generate GEN_CLK, period 320 ns

GEN_CLK_G:	process
				begin
					if END_SIM = FALSE then
							GEN_CLK <= '0';
						wait for 80 ns;
							GEN_CLK <= '1';
						wait for 80 ns;
					else 
						wait;
					end if;
			end process;

-- generate waveforms for NEW_CARD, GEN_RES, START signals

STIMUL:	process
			begin
				   NEW_CARD <= '1';
				   GEN_RES <= '1';
				   START <= '1';
				wait for 25 ns;			
				    GEN_RES <= '0';
				wait for 600 ns;		
				    START <= '0';
					report "The new game starts";
				wait for 150 ns;		
				    START <= '1';
				wait for 75 ns;		
				    NEW_CARD <= '0';
				wait for 120 ns;		
					NEW_CARD <= '1';
				wait for 2470 ns;		
					NEW_CARD <= '0';
				wait for 60 ns;		
					NEW_CARD <= '1';
				wait for 140 ns;		
					NEW_CARD <= '0';
				wait for 120 ns;		
					NEW_CARD <= '1';
				wait for 1215 ns;		
					START <= '0';
					report "The new game starts";	
				wait for 250 ns;		
					START <= '1';		
				wait for 325 ns;		
					NEW_CARD <= '0';
				wait for 50 ns;		
				    NEW_CARD <= '1';
				wait for 250 ns;		
					NEW_CARD <= '0';
				wait for 50 ns;		
					NEW_CARD <= '1';
				wait for 250 ns;			
					NEW_CARD <= '0';
				wait for 50 ns;		
					NEW_CARD <= '1';
				wait for 280 ns; 
				 	START <= '0';
					report "The new game starts"; 
				wait for 250 ns;		
					START <= '1';
				wait for 230 ns;		
					NEW_CARD <= '0';
				wait for 50 ns;		
					NEW_CARD <= '1';
				wait for 250 ns;		
					NEW_CARD <= '0';
				wait for 50 ns;		
					NEW_CARD <= '1';
				wait for 400 ns;		
				    NEW_CARD <= '0';
				wait for 50 ns;		
					NEW_CARD <= '1';
				wait for 1000 ns;				
					END_SIM := TRUE ;    
					report "BJACK testing completed";
				wait;
		end process;
	
CHECK_HOLD:	assert not(HOLD='1')
				report "enough cards ! "
				severity NOTE;

CHECK_BUST:	assert not(BUST='1')
				report "Sorry, the game is lost ..."
				severity NOTE;

WRITE_TO_FILE:	WRITE_RESULTS(	BUST,HOLD,NEW_CARD,GEN_RES,GEN_CLK,START,
								SYS_CLK,L_L,L_H,LEDS,D_L,D_H);

end TESTBENCH_ARCH;

configuration TESTBENCH_CFG of testbench is
  for TESTBENCH_ARCH
  end for;
end TESTBENCH_CFG;

