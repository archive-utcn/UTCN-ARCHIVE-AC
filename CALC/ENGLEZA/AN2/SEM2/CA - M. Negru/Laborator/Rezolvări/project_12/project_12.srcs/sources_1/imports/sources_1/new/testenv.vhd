library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           RX: in std_logic;
           TX: out std_logic);

end test_env;

architecture Behavioral of test_env is
component  MPG is
    Port (clk: in std_logic;
      btn: in std_logic;
      en: out std_logic );
  end component;

component FSM_Transmisie is
      Port ( clk : in STD_LOGIC;
             rst : in STD_LOGIC;
             baud_en : in STD_LOGIC; --('0' valoare normala, este pus pe '1' la intervalul de bit, interval care se masoara in tacti de ceas,
                                     -- dupa care se reincepe numararea). !durata cat sta BAUD_ENable '1' pe este egala cu perioada de ceas.
             tx_data : in STD_LOGIC_VECTOR(7 downto 0);
             tx_en:in std_logic;
             tx_rdy : out STD_LOGIC;
             tx : out STD_LOGIC);
  end component;
  
 component FSM_Receptie is
    Port (clk: in STD_LOGIC;
    RX_RDY: out std_logic;
    RX_DATA: out std_logic_Vector(7 downto 0);
    BAUD_EN: IN STD_LOGIC;
    rst:in std_logic;
    rx:in std_logic );
 end component;
  
component SSD is
     Port ( 
         digit: in STD_LOGIC_VECTOR( 15 downto 0);
         clk : in STD_LOGIC;
         catod: out STD_LOGIC_VECTOR(6 downto 0);
         anod: out STD_LOGIC_VECTOR(3 downto 0)); 
 end component;
  
--semnale monopulse
signal enable1:std_logic;
signal enable2:std_logic;



--semnale fsm transmisie

signal fsmnum:std_logic_vector(13 downto 0);
signal bauden:std_logic;
signal tx_en:std_logic;
signal tx_rdy:std_logic;
signal tx_data:std_logic_vector(7 downto 0);
signal enable3:std_logic;

-- semnale FSM pentru receptie

signal counterRec: std_logic_vector(9 downto 0); -- contor pt FSM receptie
signal BAUD_ENABLE2: std_logic;
signal RX_DATA2: std_logic_vector (7 downto 0); 
signal RX_ready: std_logic;
signal deAfisat:std_logic_Vector(15 downto 0);

begin

monopulse: MPG port map(clk,btn(2),enable3);
FSM_Tr: FSM_Transmisie port map(clk,'0',bauden,sw(15 downto 8),tx_en,tx_rdy,tx);
FSM_Rec: FSM_Receptie port map (clk, RX_ready , RX_DATA2 , BAUD_ENABLE2, '0' , RX);
SSDul: SSD port map(RX_DATA2 & "00000000",clk,cat,an);
 
 
 --baud rate generator pt transmisie 
process(clk)
begin
if rising_edge(clk) then
    if fsmnum="10100010110000" --10416 tacti:28B0
       then bauden<='1';
            fsmnum<="00000000000000";
       else 
       bauden<='0';
       fsmnum<=fsmnum+1;
       end if;
       end if;
end process;

tx_data(0)<=sw(8);
tx_data(1)<=sw(9);
tx_data(2)<=sw(10);
tx_data(3)<=sw(11);
tx_data(4)<=sw(12);
tx_data(5)<=sw(13);
tx_data(6)<=sw(14);
tx_data(7)<=sw(15);



--bistabi D care genereaza semnalul de enable
process(clk, bauden, enable3)
begin

       if rising_edge(clk) then
       if enable3='1' then tx_en<='1'; end if;
                           if bauden='1' then 
                           tx_en<='0';
  
       
       end if;
       end if;
end process;

-- BAUD_EN generator pt receptie
process(clk)
begin
    if(rising_edge(clk)) then
        counterRec <= counterRec+1;
             if(counterRec = "1010001011") then  -- 1010001011 - 651 tacti
                counterRec<="0000000000"; -- reset counter
                BAUD_ENABLE2 <='1';
             else BAUD_ENABLE2<='0';
             end if;
    end if;
end process;

end Behavioral;
