---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : proiect_psn
-- Author      : Andrqa
-- Company     : utcn
--
---------------------------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\proiect_psn\proiect_psn\compile\proiect.vhd
-- Generated   : Fri May 20 00:50:57 2016
-- From        : c:\My_Designs\proiect_psn\proiect_psn\src\proiect.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


-- other libraries declarations
-- synopsys translate_off 
library XC9500;
library IEEE;
use IEEE.vital_timing.all;
-- synopsys translate_on 

entity proiect is
  port(
       Clock : in std_ulogic;
       INTRODUCERE_ALIMENTE : in std_ulogic;
       Reset : in STD_LOGIC;
       ST0 : in STD_LOGIC;
       ST1 : in STD_LOGIC;
       ST2 : in STD_LOGIC;
       ST3 : in STD_LOGIC;
       ST4 : in STD_LOGIC;
       ST5 : in STD_LOGIC;
       ST6 : in STD_LOGIC;
       ST7 : in STD_LOGIC;
       START : in std_ulogic;
       Preincalzire : out std_ulogic;
       STINS_2 : out std_ulogic;
       C0 : inout STD_LOGIC;
       C1 : inout STD_LOGIC;
       C2 : inout STD_LOGIC;
       C3 : inout STD_LOGIC;
       C4 : inout STD_LOGIC;
       Coacere : inout std_ulogic;
       DETECT_30 : inout std_ulogic;
       Puteti_introd_alimente : inout std_ulogic;
       STINS_1 : inout std_ulogic;
       TPI0 : inout STD_LOGIC;
       TPI1 : inout STD_LOGIC;
       TPI2 : inout STD_LOGIC;
       TPI3 : inout STD_LOGIC;
       TPI4 : inout STD_LOGIC;
       TPI5 : inout STD_LOGIC;
       TPI6 : inout STD_LOGIC;
       TPI7 : inout STD_LOGIC;
       sig0 : inout STD_LOGIC;
       sig1 : inout STD_LOGIC;
       sig2 : inout STD_LOGIC
  );
end proiect;

architecture proiect of proiect is

---- Component declarations -----

component AND2
-- synopsys translate_off
  generic(
       InstancePath : STRING := "*";
       MsgOn : BOOLEAN := False;
       TimingChecksOn : BOOLEAN := FALSE;
       Xon : BOOLEAN := TRUE;
       tipd_I0 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I1 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I0_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I1_O : VitalDelayType01 := (0.0 ns,0.0 ns)
  );
-- synopsys translate_on
  port (
       I0 : in std_ulogic;
       I1 : in std_ulogic;
       O : out std_ulogic
  );
end component;
component AND3
-- synopsys translate_off
  generic(
       InstancePath : STRING := "*";
       MsgOn : BOOLEAN := False;
       TimingChecksOn : BOOLEAN := FALSE;
       Xon : BOOLEAN := TRUE;
       tipd_I0 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I1 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I2 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I0_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I1_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I2_O : VitalDelayType01 := (0.0 ns,0.0 ns)
  );
-- synopsys translate_on
  port (
       I0 : in std_ulogic;
       I1 : in std_ulogic;
       I2 : in std_ulogic;
       O : out std_ulogic
  );
end component;
component AND5B1
-- synopsys translate_off
  generic(
       InstancePath : STRING := "*";
       MsgOn : BOOLEAN := False;
       TimingChecksOn : BOOLEAN := FALSE;
       Xon : BOOLEAN := TRUE;
       tipd_I0 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I1 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I2 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I3 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I4 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I0_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I1_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I2_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I3_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I4_O : VitalDelayType01 := (0.0 ns,0.0 ns)
  );
-- synopsys translate_on
  port (
       I0 : in std_ulogic;
       I1 : in std_ulogic;
       I2 : in std_ulogic;
       I3 : in std_ulogic;
       I4 : in std_ulogic;
       O : out std_ulogic
  );
end component;
component INV
-- synopsys translate_off
  generic(
       InstancePath : STRING := "*";
       MsgOn : BOOLEAN := False;
       TimingChecksOn : BOOLEAN := FALSE;
       Xon : BOOLEAN := TRUE;
       tipd_I : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I_O : VitalDelayType01 := (0.0 ns,0.0 ns)
  );
-- synopsys translate_on
  port (
       I : in std_ulogic;
       O : out std_ulogic
  );
end component;
component OR2
-- synopsys translate_off
  generic(
       InstancePath : STRING := "*";
       MsgOn : BOOLEAN := False;
       TimingChecksOn : BOOLEAN := FALSE;
       Xon : BOOLEAN := TRUE;
       tipd_I0 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tipd_I1 : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I0_O : VitalDelayType01 := (0.0 ns,0.0 ns);
       tpd_I1_O : VitalDelayType01 := (0.0 ns,0.0 ns)
  );
-- synopsys translate_on
  port (
       I0 : in std_ulogic;
       I1 : in std_ulogic;
       O : out std_ulogic
  );
end component;
component CB2CE
  port (
       C : in STD_LOGIC;
       CE : in STD_LOGIC;
       CLR : in STD_LOGIC;
       CEO : out STD_LOGIC;
       Q0 : out STD_LOGIC;
       Q1 : out STD_LOGIC;
       TC : out STD_LOGIC
  );
end component;
component CB4CE
  port (
       C : in STD_LOGIC;
       CE : in STD_LOGIC;
       CLR : in STD_LOGIC;
       CEO : out STD_LOGIC;
       Q0 : out STD_LOGIC;
       Q1 : out STD_LOGIC;
       Q2 : out STD_LOGIC;
       Q3 : out STD_LOGIC;
       TC : out STD_LOGIC
  );
end component;
component COMP4
  port (
       A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       EQ : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1083 : std_ulogic;
signal NET179 : STD_LOGIC;
signal NET183 : STD_LOGIC;
signal NET194 : STD_LOGIC;
signal NET266 : STD_LOGIC;
signal NET311 : STD_LOGIC;
signal NET374 : std_ulogic;
signal NET384 : std_ulogic;
signal NET424 : std_ulogic;
signal NET445 : STD_LOGIC;
signal NET477 : STD_LOGIC;
signal NET479 : std_ulogic;
signal NET484 : STD_LOGIC;
signal NET49 : STD_LOGIC;
signal NET494 : std_ulogic;
signal NET55 : STD_LOGIC;
signal NET648 : std_ulogic;

---- Configuration specifications for declared components 

-- synopsys translate_off
for U1 : CB4CE use entity xc9500.CB4CE;
-- synopsys translate_on
-- synopsys translate_off
for U10 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U11 : AND3 use entity xc9500.AND3;
-- synopsys translate_on
-- synopsys translate_off
for U12 : AND3 use entity xc9500.AND3;
-- synopsys translate_on
-- synopsys translate_off
for U13 : AND3 use entity xc9500.AND3;
-- synopsys translate_on
-- synopsys translate_off
for U14 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U15 : AND5B1 use entity xc9500.AND5B1;
-- synopsys translate_on
-- synopsys translate_off
for U16 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U17 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U18 : OR2 use entity xc9500.OR2;
-- synopsys translate_on
-- synopsys translate_off
for U19 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U2 : CB4CE use entity xc9500.CB4CE;
-- synopsys translate_on
-- synopsys translate_off
for U20 : AND2 use entity xc9500.AND2;
-- synopsys translate_on
-- synopsys translate_off
for U21 : CB4CE use entity xc9500.CB4CE;
-- synopsys translate_on
-- synopsys translate_off
for U22 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U23 : AND2 use entity xc9500.AND2;
-- synopsys translate_on
-- synopsys translate_off
for U24 : AND2 use entity xc9500.AND2;
-- synopsys translate_on
-- synopsys translate_off
for U25 : CB2CE use entity xc9500.CB2CE;
-- synopsys translate_on
-- synopsys translate_off
for U26 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U3 : COMP4 use entity xc9500.COMP4;
-- synopsys translate_on
-- synopsys translate_off
for U4 : COMP4 use entity xc9500.COMP4;
-- synopsys translate_on
-- synopsys translate_off
for U5 : AND2 use entity xc9500.AND2;
-- synopsys translate_on
-- synopsys translate_off
for U7 : INV use entity xc9500.INV;
-- synopsys translate_on
-- synopsys translate_off
for U8 : AND2 use entity xc9500.AND2;
-- synopsys translate_on
-- synopsys translate_off
for U9 : CB4CE use entity xc9500.CB4CE;
-- synopsys translate_on
-- synopsys translate_off
for u6 : INV use entity xc9500.INV;
-- synopsys translate_on

begin

----  Component instantiations  ----

U1 : CB4CE
  port map(
       C => NET55,
       CE => NET194,
       CLR => Reset,
       Q0 => TPI0,
       Q1 => TPI1,
       Q2 => TPI2,
       Q3 => TPI3,
       TC => NET49
  );

U10 : INV
  port map(
       I => DETECT_30,
       O => NET311
  );

U11 : AND3
  port map(
       I0 => Clock,
       I1 => NET384,
       I2 => NET479,
       O => NET445
  );

U12 : AND3
  port map(
       I0 => Puteti_introd_alimente,
       I1 => NET374,
       I2 => Clock,
       O => NET484
  );

U13 : AND3
  port map(
       I0 => sig2,
       I1 => NET424,
       I2 => sig0,
       O => STINS_1
  );

U14 : INV
  port map(
       I => INTRODUCERE_ALIMENTE,
       O => NET479
  );

U15 : AND5B1
  port map(
       I0 => C0,
       I1 => C1,
       I2 => C2,
       I3 => C3,
       I4 => C4,
       O => DETECT_30
  );

U16 : INV
  port map(
       I => sig1,
       O => NET424
  );

U17 : INV
  port map(
       I => STINS_1,
       O => NET477
  );

U18 : OR2
  port map(
       I0 => NET484,
       I1 => DETECT_30,
       O => NET494
  );

U19 : INV
  port map(
       I => START,
       O => NET384
  );

U2 : CB4CE
  port map(
       C => NET55,
       CE => NET49,
       CLR => Reset,
       Q0 => TPI4,
       Q1 => TPI5,
       Q2 => TPI6,
       Q3 => TPI7
  );

U20 : AND2
  port map(
       I0 => INTRODUCERE_ALIMENTE,
       I1 => NET384,
       O => NET374
  );

U21 : CB4CE
  port map(
       C => NET445,
       CE => NET477,
       CLR => Reset,
       Q0 => sig0,
       Q1 => sig1,
       Q2 => sig2
  );

U22 : INV
  port map(
       I => DETECT_30,
       O => NET648
  );

U23 : AND2
  port map(
       I0 => NET494,
       I1 => NET648,
       O => Coacere
  );

U24 : AND2
  port map(
       I0 => NET1083,
       I1 => DETECT_30,
       O => STINS_2
  );

U25 : CB2CE
  port map(
       C => NET484,
       CE => NET266,
       CLR => Reset,
       Q0 => C4
  );

U26 : INV
  port map(
       I => Coacere,
       O => NET1083
  );

U3 : COMP4
  port map(
       A0 => ST0,
       A1 => ST1,
       A2 => ST2,
       A3 => ST3,
       B0 => TPI0,
       B1 => TPI1,
       B2 => TPI2,
       B3 => TPI3,
       EQ => NET179
  );

U4 : COMP4
  port map(
       A0 => ST4,
       A1 => ST5,
       A2 => ST6,
       A3 => ST7,
       B0 => TPI4,
       B1 => TPI5,
       B2 => TPI6,
       B3 => TPI7,
       EQ => NET183
  );

U5 : AND2
  port map(
       I0 => NET183,
       I1 => NET179,
       O => Puteti_introd_alimente
  );

U7 : INV
  port map(
       I => Puteti_introd_alimente,
       O => NET194
  );

U8 : AND2
  port map(
       I0 => START,
       I1 => Clock,
       O => NET55
  );

U9 : CB4CE
  port map(
       C => NET484,
       CE => NET311,
       CLR => Reset,
       Q0 => C0,
       Q1 => C1,
       Q2 => C2,
       Q3 => C3,
       TC => NET266
  );

u6 : INV
  port map(
       I => Puteti_introd_alimente,
       O => Preincalzire
  );


end proiect;
