-- Xilinx Vhdl netlist produced by netgen application (version G.31a)
-- Command       : -w -sim -ofmt vhdl -pcf COUNTER.pcf -tpw 0 -rpw 100 -ar Structure -xon true -ngm map.ngm COUNTER.ncd time_sim.vhd 
-- Input file    : COUNTER.ncd
-- Output file   : time_sim.vhd
-- Design name   : COUNTER
-- # of Entities : 1
-- Xilinx        : C:/Xilinx
-- Device        : 2vp2fg256-7 (PRODUCTION 1.86 2004-05-01)

-- This vhdl netlist is a simulation model and uses simulation 
-- primitives which may not represent the true implementation of the 
-- device, however the netlist is functionally correct and should not 
-- be modified. This file cannot be synthesized and should only be used 
-- with supported simulation tools.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity COUNTER is
  port (
    CLK : in STD_LOGIC := 'X'; 
    ENABLE : in STD_LOGIC := 'X'; 
    RESET : in STD_LOGIC := 'X'; 
    LOAD : in STD_LOGIC := 'X'; 
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    D : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end COUNTER;

architecture Structure of COUNTER is
  signal LOAD_c : STD_LOGIC; 
  signal ENABLE_c : STD_LOGIC; 
  signal CLK_ibuf_IBUFG : STD_LOGIC; 
  signal RESET_c : STD_LOGIC; 
  signal GLOBAL_LOGIC1 : STD_LOGIC; 
  signal CLK_c : STD_LOGIC; 
  signal un4_qint_axbxc1_n : STD_LOGIC; 
  signal qint_5_sn_m1_2 : STD_LOGIC; 
  signal qint_5_1_O : STD_LOGIC; 
  signal qint_5_0_O : STD_LOGIC; 
  signal un4_qint_axbxc2_n : STD_LOGIC; 
  signal qint_5_2_O : STD_LOGIC; 
  signal un4_qint_axbxc3_n : STD_LOGIC; 
  signal qint_5_3_O : STD_LOGIC; 
  signal GSR : STD_LOGIC; 
  signal GTS : STD_LOGIC; 
  signal LOAD_INBUF : STD_LOGIC; 
  signal ENABLE_INBUF : STD_LOGIC; 
  signal D_0_INBUF : STD_LOGIC; 
  signal D_1_INBUF : STD_LOGIC; 
  signal Q_0_ENABLE : STD_LOGIC; 
  signal Q_0_GTS_OR_T : STD_LOGIC; 
  signal Q_0_O : STD_LOGIC; 
  signal D_2_INBUF : STD_LOGIC; 
  signal Q_1_ENABLE : STD_LOGIC; 
  signal Q_1_GTS_OR_T : STD_LOGIC; 
  signal Q_1_O : STD_LOGIC; 
  signal D_3_INBUF : STD_LOGIC; 
  signal Q_2_ENABLE : STD_LOGIC; 
  signal Q_2_GTS_OR_T : STD_LOGIC; 
  signal Q_2_O : STD_LOGIC; 
  signal Q_3_ENABLE : STD_LOGIC; 
  signal Q_3_GTS_OR_T : STD_LOGIC; 
  signal Q_3_O : STD_LOGIC; 
  signal CLK_INBUF : STD_LOGIC; 
  signal RESET_INBUF : STD_LOGIC; 
  signal CLK_ibuf_BUFG_S_INVNOT : STD_LOGIC; 
  signal Q_c_1_DXMUX : STD_LOGIC; 
  signal Q_c_1_F : STD_LOGIC; 
  signal Q_c_1_DYMUX : STD_LOGIC; 
  signal Q_c_1_G : STD_LOGIC; 
  signal Q_c_1_SRFFMUX : STD_LOGIC; 
  signal Q_c_1_CLKINVNOT : STD_LOGIC; 
  signal Q_c_1_CEINV : STD_LOGIC; 
  signal Q_c_2_DYMUX : STD_LOGIC; 
  signal Q_c_2_G : STD_LOGIC; 
  signal Q_c_2_CLKINVNOT : STD_LOGIC; 
  signal Q_c_2_CEINV : STD_LOGIC; 
  signal Q_c_3_DXMUX : STD_LOGIC; 
  signal Q_c_3_F : STD_LOGIC; 
  signal Q_c_3_G : STD_LOGIC; 
  signal Q_c_3_CLKINVNOT : STD_LOGIC; 
  signal Q_c_3_CEINV : STD_LOGIC; 
  signal un4_qint_axbxc2_n_F : STD_LOGIC; 
  signal un4_qint_axbxc2_n_G : STD_LOGIC; 
  signal un4_qint_axbxc3_n_F : STD_LOGIC; 
  signal Q_c_3_FFX_RST : STD_LOGIC; 
  signal Q_c_3_FFX_RSTAND : STD_LOGIC; 
  signal Q_c_1_FFY_RST : STD_LOGIC; 
  signal Q_c_1_FFX_RST : STD_LOGIC; 
  signal Q_c_2_FFY_RST : STD_LOGIC; 
  signal Q_c_2_FFY_RSTAND : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal D_c : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal Q_c : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  LOAD_ibuf : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => LOAD,
      O => LOAD_INBUF
    );
  ENABLE_ibuf : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE,
      O => ENABLE_INBUF
    );
  D_ibuf_0_Q : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D(0),
      O => D_0_INBUF
    );
  D_ibuf_1_Q : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D(1),
      O => D_1_INBUF
    );
  Q_obuf_0_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_0_O,
      CTL => Q_0_ENABLE,
      O => Q(0)
    );
  Q_0_ENABLEINV : X_INV
    port map (
      I => Q_0_GTS_OR_T,
      O => Q_0_ENABLE
    );
  Q_0_GTS_OR_T_0 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => Q_0_GTS_OR_T
    );
  D_ibuf_2_Q : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D(2),
      O => D_2_INBUF
    );
  Q_obuf_1_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_1_O,
      CTL => Q_1_ENABLE,
      O => Q(1)
    );
  Q_1_ENABLEINV : X_INV
    port map (
      I => Q_1_GTS_OR_T,
      O => Q_1_ENABLE
    );
  Q_1_GTS_OR_T_1 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => Q_1_GTS_OR_T
    );
  D_ibuf_3_Q : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D(3),
      O => D_3_INBUF
    );
  Q_obuf_2_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_2_O,
      CTL => Q_2_ENABLE,
      O => Q(2)
    );
  Q_2_ENABLEINV : X_INV
    port map (
      I => Q_2_GTS_OR_T,
      O => Q_2_ENABLE
    );
  Q_2_GTS_OR_T_2 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => Q_2_GTS_OR_T
    );
  Q_obuf_3_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_3_O,
      CTL => Q_3_ENABLE,
      O => Q(3)
    );
  Q_3_ENABLEINV : X_INV
    port map (
      I => Q_3_GTS_OR_T,
      O => Q_3_ENABLE
    );
  Q_3_GTS_OR_T_3 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => Q_3_GTS_OR_T
    );
  CLK_ibuf_IBUFG_4 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => CLK,
      O => CLK_INBUF
    );
  RESET_ibuf : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => RESET,
      O => RESET_INBUF
    );
  CLK_ibuf_BUFG : X_BUFGMUX
    port map (
      I0 => CLK_ibuf_IBUFG,
      I1 => GND,
      S => CLK_ibuf_BUFG_S_INVNOT,
      O => CLK_c,
      GSR => GSR
    );
  CLK_ibuf_BUFG_SINV : X_INV
    port map (
      I => GLOBAL_LOGIC1,
      O => CLK_ibuf_BUFG_S_INVNOT
    );
  Q_c_1_DXMUX_5 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => qint_5_1_O,
      O => Q_c_1_DXMUX
    );
  Q_c_1_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c_1_F,
      O => qint_5_1_O
    );
  Q_c_1_DYMUX_6 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => qint_5_0_O,
      O => Q_c_1_DYMUX
    );
  Q_c_1_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c_1_G,
      O => qint_5_0_O
    );
  Q_c_1_SRFFMUX_7 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => RESET_c,
      O => Q_c_1_SRFFMUX
    );
  Q_c_1_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => Q_c_1_CLKINVNOT
    );
  Q_c_1_CEINV_8 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => Q_c_1_CEINV
    );
  Q_c_2_DYMUX_9 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => qint_5_2_O,
      O => Q_c_2_DYMUX
    );
  Q_c_2_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c_2_G,
      O => qint_5_2_O
    );
  Q_c_2_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => Q_c_2_CLKINVNOT
    );
  Q_c_2_CEINV_10 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => Q_c_2_CEINV
    );
  Q_c_3_DXMUX_11 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => qint_5_3_O,
      O => Q_c_3_DXMUX
    );
  Q_c_3_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c_3_F,
      O => qint_5_3_O
    );
  Q_c_3_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c_3_G,
      O => qint_5_sn_m1_2
    );
  Q_c_3_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => Q_c_3_CLKINVNOT
    );
  Q_c_3_CEINV_12 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => Q_c_3_CEINV
    );
  un4_qint_axbxc2_n_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => un4_qint_axbxc2_n_F,
      O => un4_qint_axbxc2_n
    );
  un4_qint_axbxc2_n_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => un4_qint_axbxc2_n_G,
      O => un4_qint_axbxc1_n
    );
  un4_qint_axbxc3_n_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => un4_qint_axbxc3_n_F,
      O => un4_qint_axbxc3_n
    );
  qint_5_sn_m1_2_13 : X_LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      ADR0 => Q_c(1),
      ADR1 => Q_c(0),
      ADR2 => Q_c(2),
      ADR3 => Q_c(3),
      O => Q_c_3_G
    );
  qint_5_3_Q : X_LUT4
    generic map(
      INIT => X"88D8"
    )
    port map (
      ADR0 => LOAD_c,
      ADR1 => D_c(3),
      ADR2 => un4_qint_axbxc3_n,
      ADR3 => qint_5_sn_m1_2,
      O => Q_c_3_F
    );
  un4_qint_axbxc2 : X_LUT4
    generic map(
      INIT => X"3CCC"
    )
    port map (
      ADR0 => VCC,
      ADR1 => Q_c(2),
      ADR2 => Q_c(0),
      ADR3 => Q_c(1),
      O => un4_qint_axbxc2_n_F
    );
  Q_3_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => Q_c_3_DXMUX,
      CE => Q_c_3_CEINV,
      CLK => Q_c_3_CLKINVNOT,
      SET => GND,
      RST => Q_c_3_FFX_RST,
      O => Q_c(3)
    );
  Q_c_3_FFX_RSTOR : X_OR2
    port map (
      I0 => Q_c_3_FFX_RSTAND,
      I1 => GSR,
      O => Q_c_3_FFX_RST
    );
  Q_c_3_FFX_RSTAND_14 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => RESET_c,
      O => Q_c_3_FFX_RSTAND
    );
  un4_qint_axbxc3 : X_LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      ADR0 => Q_c(3),
      ADR1 => Q_c(2),
      ADR2 => Q_c(0),
      ADR3 => Q_c(1),
      O => un4_qint_axbxc3_n_F
    );
  qint_5_0_Q : X_LUT4
    generic map(
      INIT => X"A0A3"
    )
    port map (
      ADR0 => D_c(0),
      ADR1 => Q_c(0),
      ADR2 => LOAD_c,
      ADR3 => qint_5_sn_m1_2,
      O => Q_c_1_G
    );
  qint_5_2_Q : X_LUT4
    generic map(
      INIT => X"B1A0"
    )
    port map (
      ADR0 => LOAD_c,
      ADR1 => qint_5_sn_m1_2,
      ADR2 => D_c(2),
      ADR3 => un4_qint_axbxc2_n,
      O => Q_c_2_G
    );
  Q_0_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => Q_c_1_DYMUX,
      CE => Q_c_1_CEINV,
      CLK => Q_c_1_CLKINVNOT,
      SET => GND,
      RST => Q_c_1_FFY_RST,
      O => Q_c(0)
    );
  Q_c_1_FFY_RSTOR : X_OR2
    port map (
      I0 => Q_c_1_SRFFMUX,
      I1 => GSR,
      O => Q_c_1_FFY_RST
    );
  un4_qint_axbxc1 : X_LUT4
    generic map(
      INIT => X"0FF0"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => Q_c(0),
      ADR3 => Q_c(1),
      O => un4_qint_axbxc2_n_G
    );
  qint_5_1_Q : X_LUT4
    generic map(
      INIT => X"C0CA"
    )
    port map (
      ADR0 => un4_qint_axbxc1_n,
      ADR1 => D_c(1),
      ADR2 => LOAD_c,
      ADR3 => qint_5_sn_m1_2,
      O => Q_c_1_F
    );
  Q_1_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => Q_c_1_DXMUX,
      CE => Q_c_1_CEINV,
      CLK => Q_c_1_CLKINVNOT,
      SET => GND,
      RST => Q_c_1_FFX_RST,
      O => Q_c(1)
    );
  Q_c_1_FFX_RSTOR : X_OR2
    port map (
      I0 => Q_c_1_SRFFMUX,
      I1 => GSR,
      O => Q_c_1_FFX_RST
    );
  Q_2_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => Q_c_2_DYMUX,
      CE => Q_c_2_CEINV,
      CLK => Q_c_2_CLKINVNOT,
      SET => GND,
      RST => Q_c_2_FFY_RST,
      O => Q_c(2)
    );
  Q_c_2_FFY_RSTOR : X_OR2
    port map (
      I0 => Q_c_2_FFY_RSTAND,
      I1 => GSR,
      O => Q_c_2_FFY_RST
    );
  Q_c_2_FFY_RSTAND_15 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => RESET_c,
      O => Q_c_2_FFY_RSTAND
    );
  PWR_VCC_0_LOGICAL_ONE : X_ONE
    port map (
      O => GLOBAL_LOGIC1
    );
  LOAD_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => LOAD_INBUF,
      O => LOAD_c
    );
  ENABLE_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_INBUF,
      O => ENABLE_c
    );
  D_0_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D_0_INBUF,
      O => D_c(0)
    );
  D_1_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D_1_INBUF,
      O => D_c(1)
    );
  Q_0_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c(0),
      O => Q_0_O
    );
  D_2_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D_2_INBUF,
      O => D_c(2)
    );
  Q_1_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c(1),
      O => Q_1_O
    );
  D_3_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => D_3_INBUF,
      O => D_c(3)
    );
  Q_2_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c(2),
      O => Q_2_O
    );
  Q_3_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => Q_c(3),
      O => Q_3_O
    );
  CLK_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => CLK_INBUF,
      O => CLK_ibuf_IBUFG
    );
  RESET_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => RESET_INBUF,
      O => RESET_c
    );
  NlwBlock_COUNTER_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_COUNTER_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

