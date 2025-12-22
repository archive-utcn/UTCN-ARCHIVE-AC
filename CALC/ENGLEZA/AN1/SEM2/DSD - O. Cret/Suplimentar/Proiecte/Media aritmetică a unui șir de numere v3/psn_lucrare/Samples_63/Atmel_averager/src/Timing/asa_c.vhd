-- 
-- VHDL Netlist
-- 
-- Design : asa_c
-- Program : Figaro
-- Version : Atmel 5.00 (patch level 0 applied)
-- Vendor : Atmel
-- Created : January 21, 1998 at : 6:03:58 am

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use IEEE.VITAL_timing.all;

library AT40K;
use AT40K.VCOMPONENTS.all;

entity asa_c is
    generic ( 
      tipd_CIN : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA0 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB0 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA1 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB1 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA2 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB2 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA3 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB3 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA4 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB4 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA5 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB5 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA6 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB6 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA7 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB7 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA8 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB8 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA9 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB9 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAA10 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_DATAB10 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns)
    );
    port ( 
      CIN : in STD_LOGIC := 'X';
      DATAA0 : in STD_LOGIC := 'X';
      DATAB0 : in STD_LOGIC := 'X';
      DATAA1 : in STD_LOGIC := 'X';
      DATAB1 : in STD_LOGIC := 'X';
      DATAA2 : in STD_LOGIC := 'X';
      DATAB2 : in STD_LOGIC := 'X';
      DATAA3 : in STD_LOGIC := 'X';
      DATAB3 : in STD_LOGIC := 'X';
      DATAA4 : in STD_LOGIC := 'X';
      DATAB4 : in STD_LOGIC := 'X';
      DATAA5 : in STD_LOGIC := 'X';
      DATAB5 : in STD_LOGIC := 'X';
      DATAA6 : in STD_LOGIC := 'X';
      DATAB6 : in STD_LOGIC := 'X';
      DATAA7 : in STD_LOGIC := 'X';
      DATAB7 : in STD_LOGIC := 'X';
      DATAA8 : in STD_LOGIC := 'X';
      DATAB8 : in STD_LOGIC := 'X';
      DATAA9 : in STD_LOGIC := 'X';
      DATAB9 : in STD_LOGIC := 'X';
      DATAA10 : in STD_LOGIC := 'X';
      DATAB10 : in STD_LOGIC := 'X';
      SUM0 : out STD_LOGIC;
      SUM1 : out STD_LOGIC;
      SUM2 : out STD_LOGIC;
      SUM3 : out STD_LOGIC;
      SUM4 : out STD_LOGIC;
      SUM5 : out STD_LOGIC;
      SUM6 : out STD_LOGIC;
      SUM7 : out STD_LOGIC;
      SUM8 : out STD_LOGIC;
      SUM9 : out STD_LOGIC;
      SUM10 : out STD_LOGIC;
      COUT : out STD_LOGIC
    );
end ;

architecture figaro_implementation of asa_c is 

  signal CARRY0: STD_LOGIC;
  signal CARRY1: STD_LOGIC;
  signal CARRY9: STD_LOGIC;
  signal CARRY2: STD_LOGIC;
  signal CARRY3: STD_LOGIC;
  signal CARRY4: STD_LOGIC;
  signal CARRY5: STD_LOGIC;
  signal CARRY6: STD_LOGIC;
  signal CARRY7: STD_LOGIC;
  signal CARRY8: STD_LOGIC;
  signal CIN_ipd : STD_LOGIC; 
  signal DATAA0_ipd : STD_LOGIC; 
  signal DATAB0_ipd : STD_LOGIC; 
  signal DATAA1_ipd : STD_LOGIC; 
  signal DATAB1_ipd : STD_LOGIC; 
  signal DATAA2_ipd : STD_LOGIC; 
  signal DATAB2_ipd : STD_LOGIC; 
  signal DATAA3_ipd : STD_LOGIC; 
  signal DATAB3_ipd : STD_LOGIC; 
  signal DATAA4_ipd : STD_LOGIC; 
  signal DATAB4_ipd : STD_LOGIC; 
  signal DATAA5_ipd : STD_LOGIC; 
  signal DATAB5_ipd : STD_LOGIC; 
  signal DATAA6_ipd : STD_LOGIC; 
  signal DATAB6_ipd : STD_LOGIC; 
  signal DATAA7_ipd : STD_LOGIC; 
  signal DATAB7_ipd : STD_LOGIC; 
  signal DATAA8_ipd : STD_LOGIC; 
  signal DATAB8_ipd : STD_LOGIC; 
  signal DATAA9_ipd : STD_LOGIC; 
  signal DATAB9_ipd : STD_LOGIC; 
  signal DATAA10_ipd : STD_LOGIC; 
  signal DATAB10_ipd : STD_LOGIC; 
  signal one : STD_LOGIC := '1';
  signal zero : STD_LOGIC := '0';
begin
  WIRE_DELAY : block
  begin
    VitalWireDelay ( OutSig => CIN_ipd, InSig => CIN , twire =>  tipd_CIN );
    VitalWireDelay ( OutSig => DATAA0_ipd, InSig => DATAA0 , twire =>  tipd_DATAA0 );
    VitalWireDelay ( OutSig => DATAB0_ipd, InSig => DATAB0 , twire =>  tipd_DATAB0 );
    VitalWireDelay ( OutSig => DATAA1_ipd, InSig => DATAA1 , twire =>  tipd_DATAA1 );
    VitalWireDelay ( OutSig => DATAB1_ipd, InSig => DATAB1 , twire =>  tipd_DATAB1 );
    VitalWireDelay ( OutSig => DATAA2_ipd, InSig => DATAA2 , twire =>  tipd_DATAA2 );
    VitalWireDelay ( OutSig => DATAB2_ipd, InSig => DATAB2 , twire =>  tipd_DATAB2 );
    VitalWireDelay ( OutSig => DATAA3_ipd, InSig => DATAA3 , twire =>  tipd_DATAA3 );
    VitalWireDelay ( OutSig => DATAB3_ipd, InSig => DATAB3 , twire =>  tipd_DATAB3 );
    VitalWireDelay ( OutSig => DATAA4_ipd, InSig => DATAA4 , twire =>  tipd_DATAA4 );
    VitalWireDelay ( OutSig => DATAB4_ipd, InSig => DATAB4 , twire =>  tipd_DATAB4 );
    VitalWireDelay ( OutSig => DATAA5_ipd, InSig => DATAA5 , twire =>  tipd_DATAA5 );
    VitalWireDelay ( OutSig => DATAB5_ipd, InSig => DATAB5 , twire =>  tipd_DATAB5 );
    VitalWireDelay ( OutSig => DATAA6_ipd, InSig => DATAA6 , twire =>  tipd_DATAA6 );
    VitalWireDelay ( OutSig => DATAB6_ipd, InSig => DATAB6 , twire =>  tipd_DATAB6 );
    VitalWireDelay ( OutSig => DATAA7_ipd, InSig => DATAA7 , twire =>  tipd_DATAA7 );
    VitalWireDelay ( OutSig => DATAB7_ipd, InSig => DATAB7 , twire =>  tipd_DATAB7 );
    VitalWireDelay ( OutSig => DATAA8_ipd, InSig => DATAA8 , twire =>  tipd_DATAA8 );
    VitalWireDelay ( OutSig => DATAB8_ipd, InSig => DATAB8 , twire =>  tipd_DATAB8 );
    VitalWireDelay ( OutSig => DATAA9_ipd, InSig => DATAA9 , twire =>  tipd_DATAA9 );
    VitalWireDelay ( OutSig => DATAB9_ipd, InSig => DATAB9 , twire =>  tipd_DATAB9 );
    VitalWireDelay ( OutSig => DATAA10_ipd, InSig => DATAA10 , twire =>  tipd_DATAA10 );
    VitalWireDelay ( OutSig => DATAB10_ipd, InSig => DATAB10 , twire =>  tipd_DATAB10 );
  end block;
  Cell0_E1 : PLUT2 port map ( W => DATAB0_ipd, X => CIN_ipd, Y => DATAA0_ipd, Z => zero, G => SUM0, H => CARRY0,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell1_E1 : PLUT2 port map ( W => DATAB1_ipd, X => CARRY0, Y => DATAA1_ipd, Z => zero, G => SUM1, H => CARRY1,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell10_E1 : PLUT2 port map ( W => DATAB10_ipd, X => CARRY9, Y => DATAA10_ipd, Z => zero, G => SUM10, H => COUT,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell2_E1 : PLUT2 port map ( W => DATAB2_ipd, X => CARRY1, Y => DATAA2_ipd, Z => zero, G => SUM2, H => CARRY2,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell3_E1 : PLUT2 port map ( W => DATAB3_ipd, X => CARRY2, Y => DATAA3_ipd, Z => zero, G => SUM3, H => CARRY3,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell4_E1 : PLUT2 port map ( W => DATAB4_ipd, X => CARRY3, Y => DATAA4_ipd, Z => zero, G => SUM4, H => CARRY4,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell5_E1 : PLUT2 port map ( W => DATAB5_ipd, X => CARRY4, Y => DATAA5_ipd, Z => zero, G => SUM5, H => CARRY5,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell6_E1 : PLUT2 port map ( W => DATAB6_ipd, X => CARRY5, Y => DATAA6_ipd, Z => zero, G => SUM6, H => CARRY6,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell7_E1 : PLUT2 port map ( W => DATAB7_ipd, X => CARRY6, Y => DATAA7_ipd, Z => zero, G => SUM7, H => CARRY7,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell8_E1 : PLUT2 port map ( W => DATAB8_ipd, X => CARRY7, Y => DATAA8_ipd, Z => zero, G => SUM8, H => CARRY8,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
  Cell9_E1 : PLUT2 port map ( W => DATAB9_ipd, X => CARRY8, Y => DATAA9_ipd, Z => zero, G => SUM9, H => CARRY9,
    H4 => zero ,G5 => zero ,H1 => zero ,G2 => one ,H6 => one ,G7 => one ,H3 => one ,G4 => one ,H0 => zero ,G1 => one ,FB => zero ,H5 => one ,G6 => zero ,H2 => zero ,G3 => zero ,H7 => one ,G0 => zero  ) ;
end;

