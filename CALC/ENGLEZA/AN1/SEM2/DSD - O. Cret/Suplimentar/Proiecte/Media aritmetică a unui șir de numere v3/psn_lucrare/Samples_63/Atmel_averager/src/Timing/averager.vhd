-- 
-- VHDL Netlist
-- 
-- Design : averager
-- Program : Figaro
-- Version : Atmel 5.00 (patch level 0 applied)
-- Vendor : Atmel
-- Created : January 21, 1998 at : 6:09:53 am

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use IEEE.VITAL_timing.all;

library AT40K;
use AT40K.VCOMPONENTS.all;

entity averager_toplevel_A is
    generic ( 
      tipd_clk : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_r : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_7 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_6 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_5 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_4 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_3 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_2 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_1 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns);
      tipd_datain_0 : VitalDelayType01Z := (0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns)
    );
    port ( 
      clk : in STD_LOGIC := 'X';
      r : in STD_LOGIC := 'X';
      datain_7 : in STD_LOGIC := 'X';
      datain_6 : in STD_LOGIC := 'X';
      datain_5 : in STD_LOGIC := 'X';
      datain_4 : in STD_LOGIC := 'X';
      datain_3 : in STD_LOGIC := 'X';
      datain_2 : in STD_LOGIC := 'X';
      datain_1 : in STD_LOGIC := 'X';
      datain_0 : in STD_LOGIC := 'X';
      dataout_7 : out STD_LOGIC;
      dataout_6 : out STD_LOGIC;
      dataout_5 : out STD_LOGIC;
      dataout_4 : out STD_LOGIC;
      dataout_3 : out STD_LOGIC;
      dataout_2 : out STD_LOGIC;
      dataout_1 : out STD_LOGIC;
      dataout_0 : out STD_LOGIC
    );
end ;

architecture figaro_implementation of averager_toplevel_A is 
  component asa_a
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
      SUM0 : out STD_LOGIC;
      SUM1 : out STD_LOGIC;
      SUM2 : out STD_LOGIC;
      SUM3 : out STD_LOGIC;
      SUM4 : out STD_LOGIC;
      SUM5 : out STD_LOGIC;
      SUM6 : out STD_LOGIC;
      SUM7 : out STD_LOGIC;
      SUM8 : out STD_LOGIC;
      COUT : out STD_LOGIC
    );
  end component;
  component asa_b
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
      COUT : out STD_LOGIC
    );
  end component;
  component asa_c
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
  end component;

  signal NET1: STD_LOGIC;
  signal clk_vhdl0: STD_LOGIC;
  signal r_vhdl1: STD_LOGIC;
  signal NET183: STD_LOGIC;
  signal NET226: STD_LOGIC;
  signal NET225: STD_LOGIC;
  signal NET182: STD_LOGIC;
  signal datain_0_vhdl2: STD_LOGIC;
  signal NET10: STD_LOGIC;
  signal datain_1_vhdl3: STD_LOGIC;
  signal NET11: STD_LOGIC;
  signal datain_2_vhdl4: STD_LOGIC;
  signal NET12: STD_LOGIC;
  signal datain_3_vhdl5: STD_LOGIC;
  signal NET13: STD_LOGIC;
  signal datain_4_vhdl6: STD_LOGIC;
  signal NET14: STD_LOGIC;
  signal datain_5_vhdl7: STD_LOGIC;
  signal NET15: STD_LOGIC;
  signal datain_6_vhdl8: STD_LOGIC;
  signal NET16: STD_LOGIC;
  signal datain_7_vhdl9: STD_LOGIC;
  signal NET17: STD_LOGIC;
  signal NET25: STD_LOGIC;
  signal NET24: STD_LOGIC;
  signal NET23: STD_LOGIC;
  signal NET22: STD_LOGIC;
  signal NET21: STD_LOGIC;
  signal NET20: STD_LOGIC;
  signal NET19: STD_LOGIC;
  signal NET18: STD_LOGIC;
  signal NET160: STD_LOGIC;
  signal NET206: STD_LOGIC;
  signal NET205: STD_LOGIC;
  signal NET204: STD_LOGIC;
  signal NET203: STD_LOGIC;
  signal NET202: STD_LOGIC;
  signal NET201: STD_LOGIC;
  signal NET215: STD_LOGIC;
  signal NET173: STD_LOGIC;
  signal NET214: STD_LOGIC;
  signal NET172: STD_LOGIC;
  signal NET213: STD_LOGIC;
  signal NET171: STD_LOGIC;
  signal NET212: STD_LOGIC;
  signal NET139: STD_LOGIC;
  signal NET211: STD_LOGIC;
  signal NET138: STD_LOGIC;
  signal NET210: STD_LOGIC;
  signal NET137: STD_LOGIC;
  signal NET209: STD_LOGIC;
  signal NET136: STD_LOGIC;
  signal NET208: STD_LOGIC;
  signal NET135: STD_LOGIC;
  signal NET207: STD_LOGIC;
  signal NET134: STD_LOGIC;
  signal NET106: STD_LOGIC;
  signal NET224: STD_LOGIC;
  signal NET181: STD_LOGIC;
  signal NET26: STD_LOGIC;
  signal NET27: STD_LOGIC;
  signal NET28: STD_LOGIC;
  signal NET29: STD_LOGIC;
  signal NET30: STD_LOGIC;
  signal NET31: STD_LOGIC;
  signal NET32: STD_LOGIC;
  signal NET33: STD_LOGIC;
  signal NET41: STD_LOGIC;
  signal NET40: STD_LOGIC;
  signal NET39: STD_LOGIC;
  signal NET38: STD_LOGIC;
  signal NET37: STD_LOGIC;
  signal NET36: STD_LOGIC;
  signal NET35: STD_LOGIC;
  signal NET34: STD_LOGIC;
  signal NET100: STD_LOGIC;
  signal NET99: STD_LOGIC;
  signal NET98: STD_LOGIC;
  signal NET97: STD_LOGIC;
  signal NET96: STD_LOGIC;
  signal NET95: STD_LOGIC;
  signal NET94: STD_LOGIC;
  signal NET93: STD_LOGIC;
  signal NET92: STD_LOGIC;
  signal NET105: STD_LOGIC;
  signal NET104: STD_LOGIC;
  signal NET103: STD_LOGIC;
  signal NET102: STD_LOGIC;
  signal NET101: STD_LOGIC;
  signal NET223: STD_LOGIC;
  signal NET180: STD_LOGIC;
  signal NET42: STD_LOGIC;
  signal NET43: STD_LOGIC;
  signal NET44: STD_LOGIC;
  signal NET45: STD_LOGIC;
  signal NET46: STD_LOGIC;
  signal NET47: STD_LOGIC;
  signal NET48: STD_LOGIC;
  signal NET49: STD_LOGIC;
  signal NET57: STD_LOGIC;
  signal NET56: STD_LOGIC;
  signal NET55: STD_LOGIC;
  signal NET54: STD_LOGIC;
  signal NET53: STD_LOGIC;
  signal NET52: STD_LOGIC;
  signal NET51: STD_LOGIC;
  signal NET50: STD_LOGIC;
  signal NET200: STD_LOGIC;
  signal dataout_0_vhdl10: STD_LOGIC;
  signal NET199: STD_LOGIC;
  signal dataout_1_vhdl11: STD_LOGIC;
  signal NET198: STD_LOGIC;
  signal dataout_2_vhdl12: STD_LOGIC;
  signal NET222: STD_LOGIC;
  signal NET179: STD_LOGIC;
  signal NET58: STD_LOGIC;
  signal NET59: STD_LOGIC;
  signal NET60: STD_LOGIC;
  signal NET61: STD_LOGIC;
  signal NET62: STD_LOGIC;
  signal NET63: STD_LOGIC;
  signal NET64: STD_LOGIC;
  signal NET65: STD_LOGIC;
  signal NET66: STD_LOGIC;
  signal NET67: STD_LOGIC;
  signal NET68: STD_LOGIC;
  signal NET69: STD_LOGIC;
  signal NET70: STD_LOGIC;
  signal NET71: STD_LOGIC;
  signal NET72: STD_LOGIC;
  signal NET73: STD_LOGIC;
  signal NET133: STD_LOGIC;
  signal NET132: STD_LOGIC;
  signal NET131: STD_LOGIC;
  signal NET130: STD_LOGIC;
  signal NET129: STD_LOGIC;
  signal NET128: STD_LOGIC;
  signal NET127: STD_LOGIC;
  signal NET126: STD_LOGIC;
  signal NET125: STD_LOGIC;
  signal NET197: STD_LOGIC;
  signal dataout_3_vhdl13: STD_LOGIC;
  signal NET196: STD_LOGIC;
  signal dataout_4_vhdl14: STD_LOGIC;
  signal NET195: STD_LOGIC;
  signal dataout_5_vhdl15: STD_LOGIC;
  signal NET194: STD_LOGIC;
  signal dataout_6_vhdl16: STD_LOGIC;
  signal NET193: STD_LOGIC;
  signal dataout_7_vhdl17: STD_LOGIC;
  signal NET221: STD_LOGIC;
  signal NET178: STD_LOGIC;
  signal NET83: STD_LOGIC;
  signal NET74: STD_LOGIC;
  signal NET84: STD_LOGIC;
  signal NET75: STD_LOGIC;
  signal NET85: STD_LOGIC;
  signal NET76: STD_LOGIC;
  signal NET86: STD_LOGIC;
  signal NET77: STD_LOGIC;
  signal NET87: STD_LOGIC;
  signal NET78: STD_LOGIC;
  signal NET88: STD_LOGIC;
  signal NET79: STD_LOGIC;
  signal NET89: STD_LOGIC;
  signal NET80: STD_LOGIC;
  signal NET90: STD_LOGIC;
  signal NET81: STD_LOGIC;
  signal NET91: STD_LOGIC;
  signal NET82: STD_LOGIC;
  signal NET220: STD_LOGIC;
  signal NET218: STD_LOGIC;
  signal NET217: STD_LOGIC;
  signal NET216: STD_LOGIC;
  signal NET177: STD_LOGIC;
  signal NET116: STD_LOGIC;
  signal NET107: STD_LOGIC;
  signal NET117: STD_LOGIC;
  signal NET108: STD_LOGIC;
  signal NET118: STD_LOGIC;
  signal NET109: STD_LOGIC;
  signal NET119: STD_LOGIC;
  signal NET110: STD_LOGIC;
  signal NET120: STD_LOGIC;
  signal NET111: STD_LOGIC;
  signal NET121: STD_LOGIC;
  signal NET112: STD_LOGIC;
  signal NET122: STD_LOGIC;
  signal NET113: STD_LOGIC;
  signal NET123: STD_LOGIC;
  signal NET114: STD_LOGIC;
  signal NET124: STD_LOGIC;
  signal NET115: STD_LOGIC;
  signal NET170: STD_LOGIC;
  signal NET169: STD_LOGIC;
  signal NET168: STD_LOGIC;
  signal NET167: STD_LOGIC;
  signal NET166: STD_LOGIC;
  signal NET165: STD_LOGIC;
  signal NET164: STD_LOGIC;
  signal NET163: STD_LOGIC;
  signal NET162: STD_LOGIC;
  signal NET161: STD_LOGIC;
  signal NET176: STD_LOGIC;
  signal NET140: STD_LOGIC;
  signal NET141: STD_LOGIC;
  signal NET175: STD_LOGIC;
  signal NET142: STD_LOGIC;
  signal NET174: STD_LOGIC;
  signal NET143: STD_LOGIC;
  signal NET144: STD_LOGIC;
  signal NET145: STD_LOGIC;
  signal NET146: STD_LOGIC;
  signal NET147: STD_LOGIC;
  signal NET148: STD_LOGIC;
  signal NET149: STD_LOGIC;
  signal NET150: STD_LOGIC;
  signal NET151: STD_LOGIC;
  signal NET152: STD_LOGIC;
  signal NET153: STD_LOGIC;
  signal NET154: STD_LOGIC;
  signal NET155: STD_LOGIC;
  signal NET156: STD_LOGIC;
  signal NET157: STD_LOGIC;
  signal NET158: STD_LOGIC;
  signal NET159: STD_LOGIC;
  signal NET191: STD_LOGIC;
  signal NET190: STD_LOGIC;
  signal NET189: STD_LOGIC;
  signal NET188: STD_LOGIC;
  signal NET187: STD_LOGIC;
  signal NET186: STD_LOGIC;
  signal NET185: STD_LOGIC;
  signal NET184: STD_LOGIC;
  signal NET192: STD_LOGIC;
  signal NET219: STD_LOGIC;
  signal NET2: STD_LOGIC;
  signal NET3: STD_LOGIC;
  signal NET4: STD_LOGIC;
  signal NET5: STD_LOGIC;
  signal NET6: STD_LOGIC;
  signal NET7: STD_LOGIC;
  signal NET8: STD_LOGIC;
  signal NET9: STD_LOGIC;
  signal datain_3_ipd : STD_LOGIC; 
  signal datain_4_ipd : STD_LOGIC; 
  signal datain_5_ipd : STD_LOGIC; 
  signal datain_7_ipd : STD_LOGIC; 
  signal r_ipd : STD_LOGIC; 
  signal datain_6_ipd : STD_LOGIC; 
  signal clk_ipd : STD_LOGIC; 
  signal datain_0_ipd : STD_LOGIC; 
  signal datain_1_ipd : STD_LOGIC; 
  signal datain_2_ipd : STD_LOGIC; 
  signal one : STD_LOGIC := '1';
  signal zero : STD_LOGIC := '0';
begin
  WIRE_DELAY : block
  begin
    VitalWireDelay ( OutSig => datain_3_ipd, InSig => datain_3 , twire =>  tipd_datain_3 );
    VitalWireDelay ( OutSig => datain_4_ipd, InSig => datain_4 , twire =>  tipd_datain_4 );
    VitalWireDelay ( OutSig => datain_5_ipd, InSig => datain_5 , twire =>  tipd_datain_5 );
    VitalWireDelay ( OutSig => datain_7_ipd, InSig => datain_7 , twire =>  tipd_datain_7 );
    VitalWireDelay ( OutSig => r_ipd, InSig => r , twire =>  tipd_r );
    VitalWireDelay ( OutSig => datain_6_ipd, InSig => datain_6 , twire =>  tipd_datain_6 );
    VitalWireDelay ( OutSig => clk_ipd, InSig => clk , twire =>  tipd_clk );
    VitalWireDelay ( OutSig => datain_0_ipd, InSig => datain_0 , twire =>  tipd_datain_0 );
    VitalWireDelay ( OutSig => datain_1_ipd, InSig => datain_1 , twire =>  tipd_datain_1 );
    VitalWireDelay ( OutSig => datain_2_ipd, InSig => datain_2 , twire =>  tipd_datain_2 );
  end block;
  INPUT_ASSIGNMENTS : block
  begin
    clk_vhdl0 <= clk_ipd ;
    r_vhdl1 <= r_ipd ;
    datain_0_vhdl2 <= datain_0_ipd ;
    datain_1_vhdl3 <= datain_1_ipd ;
    datain_2_vhdl4 <= datain_2_ipd ;
    datain_3_vhdl5 <= datain_3_ipd ;
    datain_4_vhdl6 <= datain_4_ipd ;
    datain_5_vhdl7 <= datain_5_ipd ;
    datain_6_vhdl8 <= datain_6_ipd ;
    datain_7_vhdl9 <= datain_7_ipd ;
  end block;
  clkarrived_EA_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET1, Y => zero, CLK => NET192, RS => NET219, G => NET183,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  U1_E1 : PLUT1 port map ( Z => zero, X => NET225, Y => NET226, W => zero, G => NET182,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DF_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET9, W => zero, CLK => NET192, RS => NET219, G => NET10,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DG_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET8, Y => zero, CLK => NET192, RS => NET219, G => NET11,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DH_E1 : PLUTR1 port map ( Y => zero, X => NET7, W => zero, Z => zero, CLK => NET192, RS => NET219, G => NET12,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DI_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET6, Y => zero, CLK => NET192, RS => NET219, G => NET13,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DJ_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET5, Z => zero, CLK => NET192, RS => NET219, G => NET14,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DK_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET4, Z => zero, CLK => NET192, RS => NET219, G => NET15,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DL_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET3, Z => zero, CLK => NET192, RS => NET219, G => NET16,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u1_q_DM_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET2, Y => zero, CLK => NET192, RS => NET219, G => NET17,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DF_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET10, Y => zero, CLK => NET192, RS => NET219, G => NET25,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DG_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET11, W => zero, CLK => NET192, RS => NET219, G => NET24,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DH_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET12, W => zero, CLK => NET192, RS => NET219, G => NET23,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DI_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET13, Y => zero, CLK => NET192, RS => NET219, G => NET22,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DJ_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET14, W => zero, CLK => NET192, RS => NET219, G => NET21,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DK_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET15, Z => zero, CLK => NET192, RS => NET219, G => NET20,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DL_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET16, Y => zero, CLK => NET192, RS => NET219, G => NET19,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u2_q_DM_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET17, W => zero, CLK => NET192, RS => NET219, G => NET18,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u1_u3_E : asa_a port map ( CIN => NET160, DATAA0 => NET25, DATAB0 => NET10, DATAA1 => NET24, DATAB1 => NET11, DATAA2 => NET23, DATAB2 => NET12, DATAA3 => NET22, DATAB3 => NET13, DATAA4 => NET21, 
    DATAB4 => NET14, DATAA5 => NET20, DATAB5 => NET15, DATAA6 => NET19, DATAB6 => NET16, DATAA7 => NET18, DATAB7 => NET17, DATAA8 => NET160, DATAB8 => NET160, SUM0 => NET206, 
    SUM1 => NET205, SUM2 => NET204, SUM3 => NET203, SUM4 => NET202, SUM5 => NET201 ) ;
  U10_E1 : PLUT1 port map ( Z => zero, X => NET219, Y => NET215, W => zero, G => NET173,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U11_E1 : PLUT1 port map ( W => zero, X => NET219, Y => NET214, Z => zero, G => NET172,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U12_E1 : PLUT1 port map ( Z => zero, Y => NET219, X => NET213, W => zero, G => NET171,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U13_E1 : PLUT1 port map ( Z => zero, Y => NET212, X => NET219, W => zero, G => NET139,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U14_E1 : PLUT1 port map ( Z => zero, Y => NET219, X => NET211, W => zero, G => NET138,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U15_E1 : PLUT1 port map ( Z => zero, X => NET210, Y => NET219, W => zero, G => NET137,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U16_E1 : PLUT1 port map ( Z => zero, X => NET219, Y => NET209, W => zero, G => NET136,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U17_E1 : PLUT1 port map ( Z => zero, Y => NET208, X => NET219, W => zero, G => NET135,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U18_E1 : PLUT1 port map ( Z => zero, Y => NET207, X => NET219, W => zero, G => NET134,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U19_E1 : PLUT1 port map ( Z => zero, X => NET206, Y => NET219, W => zero, G => NET106,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U2_E1 : PLUT1 port map ( Z => zero, Y => NET224, X => NET225, W => zero, G => NET181,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DF_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET25, Y => zero, CLK => NET192, RS => NET219, G => NET26,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DG_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET24, Y => zero, CLK => NET192, RS => NET219, G => NET27,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DH_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET23, Z => zero, CLK => NET192, RS => NET219, G => NET28,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DI_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET22, Z => zero, CLK => NET192, RS => NET219, G => NET29,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DJ_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET21, Y => zero, CLK => NET192, RS => NET219, G => NET30,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DK_E1 : PLUTR1 port map ( Z => zero, X => NET20, W => zero, Y => zero, CLK => NET192, RS => NET219, G => NET31,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DL_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET19, W => zero, CLK => NET192, RS => NET219, G => NET32,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u1_q_DM_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET18, Y => zero, CLK => NET192, RS => NET219, G => NET33,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DF_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET26, Y => zero, CLK => NET192, RS => NET219, G => NET41,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DG_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET27, Y => zero, CLK => NET192, RS => NET219, G => NET40,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DH_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET28, Y => zero, CLK => NET192, RS => NET219, G => NET39,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DI_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET29, Y => zero, CLK => NET192, RS => NET219, G => NET38,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DJ_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET30, Z => zero, CLK => NET192, RS => NET219, G => NET37,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DK_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET31, Y => zero, CLK => NET192, RS => NET219, G => NET36,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DL_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET32, W => zero, CLK => NET192, RS => NET219, G => NET35,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u2_q_DM_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET33, W => zero, CLK => NET192, RS => NET219, G => NET34,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u2_u3_E : asa_a port map ( CIN => NET160, DATAA0 => NET41, DATAB0 => NET26, DATAA1 => NET40, DATAB1 => NET27, DATAA2 => NET39, DATAB2 => NET28, DATAA3 => NET38, DATAB3 => NET29, DATAA4 => NET37, 
    DATAB4 => NET30, DATAA5 => NET36, DATAB5 => NET31, DATAA6 => NET35, DATAB6 => NET32, DATAA7 => NET34, DATAB7 => NET33, DATAA8 => NET160, DATAB8 => NET160, SUM0 => NET100, 
    SUM1 => NET99, SUM2 => NET98, SUM3 => NET97, SUM4 => NET96, SUM5 => NET95, SUM6 => NET94, SUM7 => NET93, SUM8 => NET92 ) ;
  U20_E1 : PLUT1 port map ( W => zero, X => NET205, Y => NET219, Z => zero, G => NET105,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U21_E1 : PLUT1 port map ( W => zero, Y => NET204, X => NET219, Z => zero, G => NET104,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U22_E1 : PLUT1 port map ( W => zero, X => NET219, Y => NET203, Z => zero, G => NET103,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U23_E1 : PLUT1 port map ( Z => zero, Y => NET202, X => NET219, W => zero, G => NET102,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U24_E1 : PLUT1 port map ( Z => zero, X => NET219, Y => NET201, W => zero, G => NET101,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U25_E1 : PLUT1 port map ( X => zero, Z => zero, W => zero, Y => zero, G => NET160,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => zero ,G12 => zero ,G15 => zero ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => zero ,G14 => zero ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  U26_E1 : PLUT1 port map ( Y => zero, W => zero, Z => zero, X => zero, G => NET1,
    G10 => one ,G13 => one ,G5 => one ,G2 => one ,G7 => one ,G12 => one ,G15 => one ,G4 => one ,G9 => one ,G1 => one ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,G8 => one ,G0 => one  ) ;
  U3_E1 : PLUT1 port map ( Z => zero, X => NET225, Y => NET223, W => zero, G => NET180,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DF_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET41, Z => zero, CLK => NET192, RS => NET219, G => NET42,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DG_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET40, Z => zero, CLK => NET192, RS => NET219, G => NET43,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DH_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET39, Z => zero, CLK => NET192, RS => NET219, G => NET44,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DI_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET38, Y => zero, CLK => NET192, RS => NET219, G => NET45,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DJ_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET37, Z => zero, CLK => NET192, RS => NET219, G => NET46,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DK_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET36, Y => zero, CLK => NET192, RS => NET219, G => NET47,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DL_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET35, Y => zero, CLK => NET192, RS => NET219, G => NET48,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u1_q_DM_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET34, W => zero, CLK => NET192, RS => NET219, G => NET49,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DF_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET42, Y => zero, CLK => NET192, RS => NET219, G => NET57,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DG_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET43, Y => zero, CLK => NET192, RS => NET219, G => NET56,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DH_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET44, W => zero, CLK => NET192, RS => NET219, G => NET55,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DI_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET45, W => zero, CLK => NET192, RS => NET219, G => NET54,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DJ_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET46, Z => zero, CLK => NET192, RS => NET219, G => NET53,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DK_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET47, Y => zero, CLK => NET192, RS => NET219, G => NET52,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DL_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET48, W => zero, CLK => NET192, RS => NET219, G => NET51,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u2_q_DM_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET49, Z => zero, CLK => NET192, RS => NET219, G => NET50,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u3_u3_E : asa_a port map ( CIN => NET160, DATAA0 => NET57, DATAB0 => NET42, DATAA1 => NET56, DATAB1 => NET43, DATAA2 => NET55, DATAB2 => NET44, DATAA3 => NET54, DATAB3 => NET45, DATAA4 => NET53, 
    DATAB4 => NET46, DATAA5 => NET52, DATAB5 => NET47, DATAA6 => NET51, DATAB6 => NET48, DATAA7 => NET50, DATAB7 => NET49, DATAA8 => NET160, DATAB8 => NET160, SUM0 => NET212, 
    SUM1 => NET211, SUM2 => NET210, SUM3 => NET209, SUM4 => NET208, SUM5 => NET207 ) ;
  U4_E1 : PLUT1 port map ( W => zero, Y => NET222, X => NET225, Z => zero, G => NET179,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DF_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET57, Y => zero, CLK => NET192, RS => NET219, G => NET58,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DG_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET56, Z => zero, CLK => NET192, RS => NET219, G => NET59,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DH_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET55, Y => zero, CLK => NET192, RS => NET219, G => NET60,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DI_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET54, Y => zero, CLK => NET192, RS => NET219, G => NET61,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DJ_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET53, W => zero, CLK => NET192, RS => NET219, G => NET62,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DK_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET52, W => zero, CLK => NET192, RS => NET219, G => NET63,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DL_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET51, Y => zero, CLK => NET192, RS => NET219, G => NET64,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u1_q_DM_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET50, W => zero, CLK => NET192, RS => NET219, G => NET65,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DF_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET58, Z => zero, CLK => NET192, RS => NET219, G => NET66,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DG_E1 : PLUTR1 port map ( W => zero, Y => zero, X => NET59, Z => zero, CLK => NET192, RS => NET219, G => NET67,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DH_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET60, Y => zero, CLK => NET192, RS => NET219, G => NET68,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DI_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET61, Y => zero, CLK => NET192, RS => NET219, G => NET69,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DJ_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET62, Y => zero, CLK => NET192, RS => NET219, G => NET70,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DK_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET63, Y => zero, CLK => NET192, RS => NET219, G => NET71,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DL_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET64, W => zero, CLK => NET192, RS => NET219, G => NET72,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u2_q_DM_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET65, Y => zero, CLK => NET192, RS => NET219, G => NET73,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u4_u3_E : asa_a port map ( CIN => NET160, DATAA0 => NET66, DATAB0 => NET58, DATAA1 => NET67, DATAB1 => NET59, DATAA2 => NET68, DATAB2 => NET60, DATAA3 => NET69, DATAB3 => NET61, DATAA4 => NET70, 
    DATAB4 => NET62, DATAA5 => NET71, DATAB5 => NET63, DATAA6 => NET72, DATAB6 => NET64, DATAA7 => NET73, DATAB7 => NET65, DATAA8 => NET160, DATAB8 => NET160, SUM0 => NET133, 
    SUM1 => NET132, SUM2 => NET131, SUM3 => NET130, SUM4 => NET129, SUM5 => NET128, SUM6 => NET127, SUM7 => NET126, SUM8 => NET125 ) ;
  U5_E1 : PLUT1 port map ( W => zero, Y => NET221, X => NET225, Z => zero, G => NET178,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u5_O : asa_b port map ( CIN => NET160, DATAA0 => NET83, DATAB0 => NET74, DATAA1 => NET84, DATAB1 => NET75, DATAA2 => NET85, DATAB2 => NET76, DATAA3 => NET86, DATAB3 => NET77, DATAA4 => NET87, 
    DATAB4 => NET78, DATAA5 => NET88, DATAB5 => NET79, DATAA6 => NET89, DATAB6 => NET80, DATAA7 => NET90, DATAB7 => NET81, DATAA8 => NET91, DATAB8 => NET82, DATAA9 => NET160, 
    DATAB9 => NET160, SUM0 => NET220, SUM1 => NET218, SUM2 => NET217, SUM3 => NET216, SUM4 => NET215, SUM5 => NET214, SUM6 => NET213 ) ;
  u5_operand1_BX_E1 : PLUTR1 port map ( X => NET106, Y => NET219, Z => zero, CLK => NET192, RS => NET219, G => NET74, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_BY_E1 : PLUTR1 port map ( Y => NET219, X => NET105, Z => zero, CLK => NET192, RS => NET219, G => NET75, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_BZ_E1 : PLUTR1 port map ( Y => NET219, X => NET104, Z => zero, CLK => NET192, RS => NET219, G => NET76, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_CA_E1 : PLUTR1 port map ( Y => NET219, X => NET103, Z => zero, CLK => NET192, RS => NET219, G => NET77, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_CB_E1 : PLUTR1 port map ( Y => NET219, X => NET102, Z => zero, CLK => NET192, RS => NET219, G => NET78, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_CC_E1 : PLUTR1 port map ( X => NET101, Y => NET219, Z => zero, CLK => NET192, RS => NET219, G => NET79, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_CD_E1 : PLUTR1 port map ( Y => NET219, X => NET101, Z => zero, CLK => NET192, RS => NET219, G => NET80, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_CE_E1 : PLUTR1 port map ( Y => NET219, X => NET101, Z => zero, CLK => NET192, RS => NET219, G => NET81, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand1_CF_E1 : PLUTR1 port map ( X => NET101, Y => NET219, Z => zero, CLK => NET192, RS => NET219, G => NET82, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CK_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET100, W => zero, CLK => NET192, RS => NET219, G => NET83,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CL_E1 : PLUTR1 port map ( Y => zero, X => NET99, Z => zero, W => zero, CLK => NET192, RS => NET219, G => NET84,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CM_E1 : PLUTR1 port map ( Z => zero, X => NET98, Y => zero, W => zero, CLK => NET192, RS => NET219, G => NET85,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CN_E1 : PLUTR1 port map ( W => zero, X => NET97, Y => zero, Z => zero, CLK => NET192, RS => NET219, G => NET86,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CO_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET96, W => zero, CLK => NET192, RS => NET219, G => NET87,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CP_E1 : PLUTR1 port map ( Z => zero, X => NET95, W => zero, Y => zero, CLK => NET192, RS => NET219, G => NET88,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CQ_E1 : PLUTR1 port map ( W => zero, X => NET94, Z => zero, Y => zero, CLK => NET192, RS => NET219, G => NET89,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CR_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET93, Y => zero, CLK => NET192, RS => NET219, G => NET90,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u5_operand2_CS_E1 : PLUTR1 port map ( Y => zero, X => NET92, W => zero, Z => zero, CLK => NET192, RS => NET219, G => NET91,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  U6_E1 : PLUT1 port map ( W => zero, X => NET219, Y => NET220, Z => zero, G => NET177,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u6_O : asa_b port map ( CIN => NET160, DATAA0 => NET116, DATAB0 => NET107, DATAA1 => NET117, DATAB1 => NET108, DATAA2 => NET118, DATAB2 => NET109, DATAA3 => NET119, DATAB3 => NET110, DATAA4 => NET120, 
    DATAB4 => NET111, DATAA5 => NET121, DATAB5 => NET112, DATAA6 => NET122, DATAB6 => NET113, DATAA7 => NET123, DATAB7 => NET114, DATAA8 => NET124, DATAB8 => NET115, DATAA9 => NET160, 
    DATAB9 => NET160, SUM0 => NET170, SUM1 => NET169, SUM2 => NET168, SUM3 => NET167, SUM4 => NET166, SUM5 => NET165, SUM6 => NET164, SUM7 => NET163, SUM8 => NET162, 
    SUM9 => NET161 ) ;
  u6_operand1_BX_E1 : PLUTR1 port map ( Y => NET219, X => NET139, Z => zero, CLK => NET192, RS => NET219, G => NET107, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_BY_E1 : PLUTR1 port map ( Y => NET219, X => NET138, Z => zero, CLK => NET192, RS => NET219, G => NET108, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_BZ_E1 : PLUTR1 port map ( Y => NET219, X => NET137, Z => zero, CLK => NET192, RS => NET219, G => NET109, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_CA_E1 : PLUTR1 port map ( Y => NET219, X => NET136, Z => zero, CLK => NET192, RS => NET219, G => NET110, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_CB_E1 : PLUTR1 port map ( Y => NET219, X => NET135, Z => zero, CLK => NET192, RS => NET219, G => NET111, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_CC_E1 : PLUTR1 port map ( X => NET134, Y => NET219, Z => zero, CLK => NET192, RS => NET219, G => NET112, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_CD_E1 : PLUTR1 port map ( Y => NET219, X => NET134, Z => zero, CLK => NET192, RS => NET219, G => NET113, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_CE_E1 : PLUTR1 port map ( X => NET134, Y => NET219, Z => zero, CLK => NET192, RS => NET219, G => NET114, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand1_CF_E1 : PLUTR1 port map ( Y => NET219, X => NET134, Z => zero, CLK => NET192, RS => NET219, G => NET115, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CK_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET133, W => zero, CLK => NET192, RS => NET219, G => NET116,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CL_E1 : PLUTR1 port map ( W => zero, X => NET132, Z => zero, Y => zero, CLK => NET192, RS => NET219, G => NET117,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CM_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET131, Z => zero, CLK => NET192, RS => NET219, G => NET118,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CN_E1 : PLUTR1 port map ( Y => zero, X => NET130, W => zero, Z => zero, CLK => NET192, RS => NET219, G => NET119,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CO_E1 : PLUTR1 port map ( Z => zero, X => NET129, Y => zero, W => zero, CLK => NET192, RS => NET219, G => NET120,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CP_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET128, Z => zero, CLK => NET192, RS => NET219, G => NET121,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CQ_E1 : PLUTR1 port map ( W => zero, X => NET127, Y => zero, Z => zero, CLK => NET192, RS => NET219, G => NET122,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CR_E1 : PLUTR1 port map ( W => zero, X => NET126, Z => zero, Y => zero, CLK => NET192, RS => NET219, G => NET123,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u6_operand2_CS_E1 : PLUTR1 port map ( Y => zero, X => NET125, Z => zero, W => zero, CLK => NET192, RS => NET219, G => NET124,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  U7_E1 : PLUT1 port map ( Z => zero, X => NET218, Y => NET219, W => zero, G => NET176,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AS_E1 : PLUTR1 port map ( Y => NET219, X => NET177, Z => zero, CLK => NET192, RS => NET219, G => NET140, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AT_E1 : PLUTR1 port map ( Y => NET219, X => NET176, Z => zero, CLK => NET192, RS => NET219, G => NET141, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AU_E1 : PLUTR1 port map ( Y => NET219, X => NET175, Z => zero, CLK => NET192, RS => NET219, G => NET142, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AV_E1 : PLUTR1 port map ( Y => NET219, X => NET174, Z => zero, CLK => NET192, RS => NET219, G => NET143, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AW_E1 : PLUTR1 port map ( Y => NET219, X => NET173, Z => zero, CLK => NET192, RS => NET219, G => NET144, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AX_E1 : PLUTR1 port map ( Y => NET219, X => NET172, Z => zero, CLK => NET192, RS => NET219, G => NET145, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AY_E1 : PLUTR1 port map ( Y => NET219, X => NET171, Z => zero, CLK => NET192, RS => NET219, G => NET146, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_AZ_E1 : PLUTR1 port map ( X => NET171, Y => NET219, Z => zero, CLK => NET192, RS => NET219, G => NET147, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_BA_E1 : PLUTR1 port map ( Y => NET219, X => NET171, Z => zero, CLK => NET192, RS => NET219, G => NET148, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand1_BB_E1 : PLUTR1 port map ( Y => NET219, X => NET171, Z => zero, CLK => NET192, RS => NET219, G => NET149, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BG_E1 : PLUTR1 port map ( Z => zero, X => NET170, Y => zero, W => zero, CLK => NET192, RS => NET219, G => NET150,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BH_E1 : PLUTR1 port map ( Z => zero, X => NET169, W => zero, Y => zero, CLK => NET192, RS => NET219, G => NET151,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BI_E1 : PLUTR1 port map ( W => zero, X => NET168, Z => zero, Y => zero, CLK => NET192, RS => NET219, G => NET152,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BJ_E1 : PLUTR1 port map ( W => zero, X => NET167, Y => zero, Z => zero, CLK => NET192, RS => NET219, G => NET153,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BK_E1 : PLUTR1 port map ( Y => zero, X => NET166, W => zero, Z => zero, CLK => NET192, RS => NET219, G => NET154,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BL_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET165, W => zero, CLK => NET192, RS => NET219, G => NET155,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BM_E1 : PLUTR1 port map ( Z => zero, X => NET164, Y => zero, W => zero, CLK => NET192, RS => NET219, G => NET156,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BN_E1 : PLUTR1 port map ( W => zero, X => NET163, Z => zero, Y => zero, CLK => NET192, RS => NET219, G => NET157,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BO_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET162, W => zero, CLK => NET192, RS => NET219, G => NET158,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_operand2_BP_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET161, Z => zero, CLK => NET192, RS => NET219, G => NET159,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u7_Z : asa_c port map ( CIN => NET160, DATAA0 => NET150, DATAB0 => NET140, DATAA1 => NET151, DATAB1 => NET141, DATAA2 => NET152, DATAB2 => NET142, DATAA3 => NET153, DATAB3 => NET143, DATAA4 => NET154, 
    DATAB4 => NET144, DATAA5 => NET155, DATAB5 => NET145, DATAA6 => NET156, DATAB6 => NET146, DATAA7 => NET157, DATAB7 => NET147, DATAA8 => NET158, DATAB8 => NET148, DATAA9 => NET159, 
    DATAB9 => NET149, DATAA10 => NET160, DATAB10 => NET160, SUM3 => NET226, SUM4 => NET224, SUM5 => NET223, SUM6 => NET222, SUM7 => NET221 ) ;
  U8_E1 : PLUT1 port map ( Z => zero, X => NET217, Y => NET219, W => zero, G => NET175,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_CX_E1 : PLUTR1 port map ( Y => NET225, X => NET182, Z => zero, CLK => NET192, RS => NET219, G => NET200, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_CY_E1 : PLUTR1 port map ( Y => NET225, X => NET181, Z => zero, CLK => NET192, RS => NET219, G => NET199, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_CZ_E1 : PLUTR1 port map ( Y => NET225, X => NET180, Z => zero, CLK => NET192, RS => NET219, G => NET198, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_DA_E1 : PLUTR1 port map ( Y => NET225, X => NET179, Z => zero, CLK => NET192, RS => NET219, G => NET197, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_DB_E1 : PLUTR1 port map ( Y => NET225, X => NET178, Z => zero, CLK => NET192, RS => NET219, G => NET196, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_DC_E1 : PLUTR1 port map ( Y => NET225, X => NET178, Z => zero, CLK => NET192, RS => NET219, G => NET195, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_DD_E1 : PLUTR1 port map ( X => NET178, Y => NET225, Z => zero, CLK => NET192, RS => NET219, G => NET194, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u8_q_DE_E1 : PLUTR1 port map ( X => NET178, Y => NET225, Z => zero, CLK => NET192, RS => NET219, G => NET193, W => zero,
    G10 => zero ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => zero ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => one ,G1 => one ,FB => one ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  U9_E1 : PLUT1 port map ( W => zero, Y => NET216, X => NET219, Z => zero, G => NET174,
    G10 => zero ,G13 => zero ,G5 => zero ,G2 => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => zero ,G6 => one ,G14 => one ,G3 => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DR_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET191, Z => zero, CLK => NET192, RS => NET219, G => NET225,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DS_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET190, W => zero, CLK => NET192, RS => NET219, G => NET191,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DT_E1 : PLUTR1 port map ( W => zero, Z => zero, X => NET189, Y => zero, CLK => NET192, RS => NET219, G => NET190,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DU_E1 : PLUTR1 port map ( Y => zero, W => zero, X => NET188, Z => zero, CLK => NET192, RS => NET219, G => NET189,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DV_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET187, Y => zero, CLK => NET192, RS => NET219, G => NET188,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DW_E1 : PLUTR1 port map ( Z => zero, W => zero, X => NET186, Y => zero, CLK => NET192, RS => NET219, G => NET187,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DX_E1 : PLUTR1 port map ( Y => zero, Z => zero, X => NET185, W => zero, CLK => NET192, RS => NET219, G => NET186,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DY_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET184, W => zero, CLK => NET192, RS => NET219, G => NET185,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  u9_pipe_DZ_E1 : PLUTR1 port map ( Z => zero, Y => zero, X => NET183, W => zero, CLK => NET192, RS => NET219, G => NET184,
    G10 => one ,G13 => zero ,G5 => zero ,CLOCKEDGE => one ,G2 => one ,RSPOLARITY => zero ,G7 => one ,G12 => zero ,G15 => one ,G4 => zero ,G9 => zero ,G1 => zero ,FB => zero ,G11 => one ,G6 => one ,G14 => one ,G3 => one ,RSFUNCTION => zero ,G8 => zero ,G0 => zero  ) ;
  U35 : RSBUF port map ( PAD => r_vhdl1, Q => NET219 ); 
  U41 : OBUF port map ( A => NET196, PAD => dataout_4_vhdl14 ); 
  U42 : OBUF port map ( A => NET195, PAD => dataout_5_vhdl15 ); 
  U43 : OBUF port map ( A => NET194, PAD => dataout_6_vhdl16 ); 
  U44 : OBUF port map ( A => NET193, PAD => dataout_7_vhdl17 ); 
  U40 : OBUF port map ( A => NET197, PAD => dataout_3_vhdl13 ); 
  U37 : OBUF port map ( A => NET200, PAD => dataout_0_vhdl10 ); 
  U39 : OBUF port map ( A => NET198, PAD => dataout_2_vhdl12 ); 
  U38 : OBUF port map ( A => NET199, PAD => dataout_1_vhdl11 ); 
  U34 : IBUF port map ( PAD => datain_7_vhdl9, Q => NET2 ); 
  U33 : IBUF port map ( PAD => datain_6_vhdl8, Q => NET3 ); 
  U31 : IBUF port map ( PAD => datain_4_vhdl6, Q => NET5 ); 
  U32 : IBUF port map ( PAD => datain_5_vhdl7, Q => NET4 ); 
  U30 : IBUF port map ( PAD => datain_3_vhdl5, Q => NET6 ); 
  U36 : GCLKBUF port map ( PAD => clk_vhdl0, Q => NET192 ); 
  U27 : IBUF port map ( PAD => datain_0_vhdl2, Q => NET9 ); 
  U28 : IBUF port map ( PAD => datain_1_vhdl3, Q => NET8 ); 
  U29 : IBUF port map ( PAD => datain_2_vhdl4, Q => NET7 ); 
  OUTPUT_ASSIGNMENTS : block
  begin
    dataout_0 <= dataout_0_vhdl10;
    dataout_1 <= dataout_1_vhdl11;
    dataout_2 <= dataout_2_vhdl12;
    dataout_3 <= dataout_3_vhdl13;
    dataout_4 <= dataout_4_vhdl14;
    dataout_5 <= dataout_5_vhdl15;
    dataout_6 <= dataout_6_vhdl16;
    dataout_7 <= dataout_7_vhdl17;
  end block;
end;

