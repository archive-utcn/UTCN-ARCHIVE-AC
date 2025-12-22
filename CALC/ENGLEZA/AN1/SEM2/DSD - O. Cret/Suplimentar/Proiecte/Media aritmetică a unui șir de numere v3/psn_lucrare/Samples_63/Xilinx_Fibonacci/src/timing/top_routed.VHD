-- Xilinx Vhdl netlist produced by netgen application (version G.31a)
-- Command       : -w -sim -ofmt vhdl -pcf TOP.pcf -tpw 0 -rpw 100 -ar Structure -xon true -ngm map.ngm TOP.ncd time_sim.vhd 
-- Input file    : TOP.ncd
-- Output file   : time_sim.vhd
-- Design name   : TOP
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

entity TOP is
  port (
    CLK : in STD_LOGIC := 'X'; 
    ENABLE : in STD_LOGIC := 'X'; 
    RESET : in STD_LOGIC := 'X'; 
    DISPB : out STD_LOGIC_VECTOR ( 6 downto 0 ); 
    DISPA : out STD_LOGIC_VECTOR ( 6 downto 0 ); 
    FIBO : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end TOP;

architecture Structure of TOP is
  signal ENABLE_c : STD_LOGIC; 
  signal CLK_c : STD_LOGIC; 
  signal RESET_c : STD_LOGIC; 
  signal DISPB_c_1_Q : STD_LOGIC; 
  signal DISPB_c_0_Q : STD_LOGIC; 
  signal DISPA_c_1_Q : STD_LOGIC; 
  signal DISPA_c_0_Q : STD_LOGIC; 
  signal DISPB_c_2_Q : STD_LOGIC; 
  signal U1_N_22_i : STD_LOGIC; 
  signal U1_fibadd_axb_7 : STD_LOGIC; 
  signal U1_un3_prev_fib_0 : STD_LOGIC; 
  signal GLOBAL_LOGIC0 : STD_LOGIC; 
  signal U1_fibadd_axb_0 : STD_LOGIC; 
  signal U1_fibadd_cry_1_O : STD_LOGIC; 
  signal U1_fibadd_cry_3_O : STD_LOGIC; 
  signal U1_fibadd_cry_5_O : STD_LOGIC; 
  signal DISPA_c_2_Q : STD_LOGIC; 
  signal U1_N_51_i : STD_LOGIC; 
  signal U1_N_54_i : STD_LOGIC; 
  signal U1_N_58_i : STD_LOGIC; 
  signal DISPA_c_6_Q : STD_LOGIC; 
  signal U1_N_25_i : STD_LOGIC; 
  signal U1_N_29_i : STD_LOGIC; 
  signal DISPB_c_6_Q : STD_LOGIC; 
  signal CLK_ibuf_IBUFG : STD_LOGIC; 
  signal GLOBAL_LOGIC1 : STD_LOGIC; 
  signal U1_un3_prev_fib_10 : STD_LOGIC; 
  signal U1_un3_prev_fib_11 : STD_LOGIC; 
  signal U1_un3_prev_fib_12_O : STD_LOGIC; 
  signal U1_un3_prev_fib_8 : STD_LOGIC; 
  signal U1_N_86_i_O : STD_LOGIC; 
  signal GLOBAL_LOGIC1_0 : STD_LOGIC; 
  signal GSR : STD_LOGIC; 
  signal GTS : STD_LOGIC; 
  signal U1_prev_fib_1_FFY_RST : STD_LOGIC; 
  signal U1_prev_fib_1_DXMUX : STD_LOGIC; 
  signal U1_prev_fib_1_DYMUX : STD_LOGIC; 
  signal U1_prev_fib_1_SRFFMUX : STD_LOGIC; 
  signal U1_prev_fib_1_SRINVNOT : STD_LOGIC; 
  signal U1_prev_fib_1_CLKINVNOT : STD_LOGIC; 
  signal U1_prev_fib_1_CEINV : STD_LOGIC; 
  signal U1_prev_fib_3_DXMUX : STD_LOGIC; 
  signal U1_prev_fib_3_DYMUX : STD_LOGIC; 
  signal U1_prev_fib_3_SRFFMUX : STD_LOGIC; 
  signal U1_prev_fib_3_SRINVNOT : STD_LOGIC; 
  signal U1_prev_fib_3_CLKINVNOT : STD_LOGIC; 
  signal U1_prev_fib_3_CEINV : STD_LOGIC; 
  signal DISPB_c_1_F : STD_LOGIC; 
  signal DISPB_c_1_G : STD_LOGIC; 
  signal U1_prev_fib_5_DXMUX : STD_LOGIC; 
  signal U1_prev_fib_5_DYMUX : STD_LOGIC; 
  signal U1_prev_fib_5_SRFFMUX : STD_LOGIC; 
  signal U1_prev_fib_5_SRINVNOT : STD_LOGIC; 
  signal U1_prev_fib_5_CLKINVNOT : STD_LOGIC; 
  signal U1_prev_fib_5_CEINV : STD_LOGIC; 
  signal U1_prev_fib_1_FFX_RST : STD_LOGIC; 
  signal DISPA_c_1_F : STD_LOGIC; 
  signal DISPA_c_1_G : STD_LOGIC; 
  signal U1_prev_fib_7_DXMUX : STD_LOGIC; 
  signal U1_prev_fib_7_DYMUX : STD_LOGIC; 
  signal U1_prev_fib_7_SRFFMUX : STD_LOGIC; 
  signal U1_prev_fib_7_SRINVNOT : STD_LOGIC; 
  signal U1_prev_fib_7_CLKINVNOT : STD_LOGIC; 
  signal U1_prev_fib_7_CEINV : STD_LOGIC; 
  signal DISPB_c_2_F : STD_LOGIC; 
  signal DISPB_c_2_G : STD_LOGIC; 
  signal U1_fibadd_axb_7_F : STD_LOGIC; 
  signal U1_fibadd_axb_7_G : STD_LOGIC; 
  signal FIBO_c_1_CYINIT : STD_LOGIC; 
  signal FIBO_c_1_CY0F : STD_LOGIC; 
  signal FIBO_c_1_CYSELF : STD_LOGIC; 
  signal FIBO_c_1_F : STD_LOGIC; 
  signal FIBO_c_1_BXINVNOT : STD_LOGIC; 
  signal FIBO_c_1_DYMUX : STD_LOGIC; 
  signal FIBO_c_1_XORG : STD_LOGIC; 
  signal FIBO_c_1_CYMUXG : STD_LOGIC; 
  signal U1_fibadd_cry_0_O : STD_LOGIC; 
  signal FIBO_c_1_CY0G : STD_LOGIC; 
  signal FIBO_c_1_CYSELG : STD_LOGIC; 
  signal U1_fibadd_axb_1 : STD_LOGIC; 
  signal FIBO_c_1_SRINVNOT : STD_LOGIC; 
  signal FIBO_c_1_CLKINVNOT : STD_LOGIC; 
  signal FIBO_c_1_CEINV : STD_LOGIC; 
  signal FIBO_c_2_DXMUX : STD_LOGIC; 
  signal FIBO_c_2_XORF : STD_LOGIC; 
  signal FIBO_c_2_CYINIT : STD_LOGIC; 
  signal FIBO_c_2_CY0F : STD_LOGIC; 
  signal U1_fibadd_axb_2 : STD_LOGIC; 
  signal FIBO_c_2_DYMUX : STD_LOGIC; 
  signal FIBO_c_2_XORG : STD_LOGIC; 
  signal U1_fibadd_cry_2_O : STD_LOGIC; 
  signal FIBO_c_2_CYSELF : STD_LOGIC; 
  signal FIBO_c_2_CYMUXFAST : STD_LOGIC; 
  signal FIBO_c_2_CYAND : STD_LOGIC; 
  signal FIBO_c_2_FASTCARRY : STD_LOGIC; 
  signal FIBO_c_2_CYMUXG2 : STD_LOGIC; 
  signal FIBO_c_2_CYMUXF2 : STD_LOGIC; 
  signal FIBO_c_2_CY0G : STD_LOGIC; 
  signal FIBO_c_2_CYSELG : STD_LOGIC; 
  signal U1_fibadd_axb_3 : STD_LOGIC; 
  signal FIBO_c_2_SRFFMUX : STD_LOGIC; 
  signal FIBO_c_2_SRINVNOT : STD_LOGIC; 
  signal FIBO_c_2_CLKINVNOT : STD_LOGIC; 
  signal FIBO_c_2_CEINV : STD_LOGIC; 
  signal FIBO_c_4_DXMUX : STD_LOGIC; 
  signal FIBO_c_4_XORF : STD_LOGIC; 
  signal FIBO_c_4_CYINIT : STD_LOGIC; 
  signal FIBO_c_4_CY0F : STD_LOGIC; 
  signal U1_fibadd_axb_4 : STD_LOGIC; 
  signal FIBO_c_4_DYMUX : STD_LOGIC; 
  signal FIBO_c_4_XORG : STD_LOGIC; 
  signal U1_fibadd_cry_4_O : STD_LOGIC; 
  signal FIBO_c_4_CYSELF : STD_LOGIC; 
  signal FIBO_c_4_CYMUXFAST : STD_LOGIC; 
  signal FIBO_c_4_CYAND : STD_LOGIC; 
  signal FIBO_c_4_FASTCARRY : STD_LOGIC; 
  signal FIBO_c_4_CYMUXG2 : STD_LOGIC; 
  signal FIBO_c_4_CYMUXF2 : STD_LOGIC; 
  signal FIBO_c_4_CY0G : STD_LOGIC; 
  signal FIBO_c_4_CYSELG : STD_LOGIC; 
  signal U1_fibadd_axb_5 : STD_LOGIC; 
  signal FIBO_c_4_SRFFMUX : STD_LOGIC; 
  signal FIBO_c_4_SRINVNOT : STD_LOGIC; 
  signal FIBO_c_4_CLKINVNOT : STD_LOGIC; 
  signal FIBO_c_4_CEINV : STD_LOGIC; 
  signal FIBO_c_6_FFX_RST : STD_LOGIC; 
  signal FIBO_c_6_FFY_RST : STD_LOGIC; 
  signal FIBO_c_6_DXMUX : STD_LOGIC; 
  signal FIBO_c_6_XORF : STD_LOGIC; 
  signal FIBO_c_6_CYINIT : STD_LOGIC; 
  signal FIBO_c_6_CY0F : STD_LOGIC; 
  signal FIBO_c_6_CYSELF : STD_LOGIC; 
  signal U1_fibadd_axb_6 : STD_LOGIC; 
  signal FIBO_c_6_DYMUX : STD_LOGIC; 
  signal FIBO_c_6_XORG : STD_LOGIC; 
  signal U1_fibadd_cry_6_O : STD_LOGIC; 
  signal U1_fibadd_axb_7_rt : STD_LOGIC; 
  signal FIBO_c_6_SRFFMUX : STD_LOGIC; 
  signal FIBO_c_6_SRINVNOT : STD_LOGIC; 
  signal FIBO_c_6_CLKINVNOT : STD_LOGIC; 
  signal FIBO_c_6_CEINV : STD_LOGIC; 
  signal FIBO_0_ENABLE : STD_LOGIC; 
  signal FIBO_0_GTS_OR_T : STD_LOGIC; 
  signal FIBO_0_O : STD_LOGIC; 
  signal FIBO_1_ENABLE : STD_LOGIC; 
  signal FIBO_1_GTS_OR_T : STD_LOGIC; 
  signal FIBO_1_O : STD_LOGIC; 
  signal ENABLE_INBUF : STD_LOGIC; 
  signal FIBO_2_ENABLE : STD_LOGIC; 
  signal FIBO_2_GTS_OR_T : STD_LOGIC; 
  signal FIBO_2_O : STD_LOGIC; 
  signal FIBO_3_ENABLE : STD_LOGIC; 
  signal FIBO_3_GTS_OR_T : STD_LOGIC; 
  signal FIBO_3_O : STD_LOGIC; 
  signal FIBO_4_ENABLE : STD_LOGIC; 
  signal FIBO_4_GTS_OR_T : STD_LOGIC; 
  signal FIBO_4_O : STD_LOGIC; 
  signal FIBO_5_ENABLE : STD_LOGIC; 
  signal FIBO_5_GTS_OR_T : STD_LOGIC; 
  signal FIBO_5_O : STD_LOGIC; 
  signal FIBO_6_ENABLE : STD_LOGIC; 
  signal FIBO_6_GTS_OR_T : STD_LOGIC; 
  signal FIBO_6_O : STD_LOGIC; 
  signal FIBO_7_ENABLE : STD_LOGIC; 
  signal FIBO_7_GTS_OR_T : STD_LOGIC; 
  signal FIBO_7_O : STD_LOGIC; 
  signal U1_prev_fib_3_FFY_RST : STD_LOGIC; 
  signal DISPA_0_ENABLE : STD_LOGIC; 
  signal DISPA_0_GTS_OR_T : STD_LOGIC; 
  signal DISPA_0_O : STD_LOGIC; 
  signal DISPA_1_ENABLE : STD_LOGIC; 
  signal DISPA_1_GTS_OR_T : STD_LOGIC; 
  signal DISPA_1_O : STD_LOGIC; 
  signal DISPA_2_ENABLE : STD_LOGIC; 
  signal DISPA_2_GTS_OR_T : STD_LOGIC; 
  signal DISPA_2_O : STD_LOGIC; 
  signal DISPA_3_ENABLE : STD_LOGIC; 
  signal DISPA_3_GTS_OR_T : STD_LOGIC; 
  signal DISPA_3_O : STD_LOGIC; 
  signal DISPB_0_ENABLE : STD_LOGIC; 
  signal DISPB_0_GTS_OR_T : STD_LOGIC; 
  signal DISPB_0_O : STD_LOGIC; 
  signal DISPA_4_ENABLE : STD_LOGIC; 
  signal DISPA_4_GTS_OR_T : STD_LOGIC; 
  signal DISPA_4_O : STD_LOGIC; 
  signal DISPB_1_ENABLE : STD_LOGIC; 
  signal DISPB_1_GTS_OR_T : STD_LOGIC; 
  signal DISPB_1_O : STD_LOGIC; 
  signal DISPA_5_ENABLE : STD_LOGIC; 
  signal DISPA_5_GTS_OR_T : STD_LOGIC; 
  signal DISPA_5_O : STD_LOGIC; 
  signal DISPB_2_ENABLE : STD_LOGIC; 
  signal DISPB_2_GTS_OR_T : STD_LOGIC; 
  signal DISPB_2_O : STD_LOGIC; 
  signal DISPA_6_ENABLE : STD_LOGIC; 
  signal DISPA_6_GTS_OR_T : STD_LOGIC; 
  signal DISPA_6_O : STD_LOGIC; 
  signal DISPB_3_ENABLE : STD_LOGIC; 
  signal DISPB_3_GTS_OR_T : STD_LOGIC; 
  signal DISPB_3_O : STD_LOGIC; 
  signal DISPB_4_ENABLE : STD_LOGIC; 
  signal DISPB_4_GTS_OR_T : STD_LOGIC; 
  signal DISPB_4_O : STD_LOGIC; 
  signal DISPB_5_ENABLE : STD_LOGIC; 
  signal DISPB_5_GTS_OR_T : STD_LOGIC; 
  signal DISPB_5_O : STD_LOGIC; 
  signal DISPB_6_ENABLE : STD_LOGIC; 
  signal DISPB_6_GTS_OR_T : STD_LOGIC; 
  signal DISPB_6_O : STD_LOGIC; 
  signal U1_prev_fib_3_FFX_RST : STD_LOGIC; 
  signal CLK_INBUF : STD_LOGIC; 
  signal RESET_INBUF : STD_LOGIC; 
  signal CLK_ibuf_BUFG_S_INVNOT : STD_LOGIC; 
  signal FIBO_c_0_DXMUX : STD_LOGIC; 
  signal FIBO_c_0_F : STD_LOGIC; 
  signal FIBO_c_0_G : STD_LOGIC; 
  signal FIBO_c_0_SRFFMUX : STD_LOGIC; 
  signal FIBO_c_0_SRINVNOT : STD_LOGIC; 
  signal FIBO_c_0_CLKINVNOT : STD_LOGIC; 
  signal FIBO_c_0_CEINV : STD_LOGIC; 
  signal U1_un3_prev_fib_8_F : STD_LOGIC; 
  signal DISPB_c_6_F : STD_LOGIC; 
  signal DISPB_c_6_G : STD_LOGIC; 
  signal DISPA_c_2_F : STD_LOGIC; 
  signal DISPA_c_2_G : STD_LOGIC; 
  signal U1_un3_prev_fib_10_F : STD_LOGIC; 
  signal U1_un3_prev_fib_10_G : STD_LOGIC; 
  signal DISPA_c_6_F : STD_LOGIC; 
  signal DISPA_c_6_G : STD_LOGIC; 
  signal U1_un3_prev_fib_11_F : STD_LOGIC; 
  signal U1_un3_prev_fib_11_G : STD_LOGIC; 
  signal U1_prev_fib_5_FFY_RST : STD_LOGIC; 
  signal U1_prev_fib_5_FFX_RST : STD_LOGIC; 
  signal FIBO_c_2_FFY_RST : STD_LOGIC; 
  signal FIBO_c_0_FFX_SET : STD_LOGIC; 
  signal U1_prev_fib_7_FFY_RST : STD_LOGIC; 
  signal U1_prev_fib_7_FFX_RST : STD_LOGIC; 
  signal FIBO_c_1_FFY_RST : STD_LOGIC; 
  signal FIBO_c_1_FFY_RSTAND : STD_LOGIC; 
  signal FIBO_c_2_FFX_RST : STD_LOGIC; 
  signal FIBO_c_4_FFY_RST : STD_LOGIC; 
  signal FIBO_c_4_FFX_RST : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal FIBO_c : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U1_prev_fib : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U1_fibadd : STD_LOGIC_VECTOR ( 7 downto 1 ); 
begin
  GLOBAL_LOGIC0_ZERO : X_ZERO
    port map (
      O => GLOBAL_LOGIC0
    );
  U1_prev_fib_1_FFY_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_1_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_1_FFY_RST
    );
  U1_prev_fib_0_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_1_DYMUX,
      CE => U1_prev_fib_1_CEINV,
      CLK => U1_prev_fib_1_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_1_FFY_RST,
      O => U1_prev_fib(0)
    );
  U1_prev_fib_1_DXMUX_0 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(1),
      O => U1_prev_fib_1_DXMUX
    );
  U1_prev_fib_1_DYMUX_1 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(0),
      O => U1_prev_fib_1_DYMUX
    );
  U1_prev_fib_1_SRFFMUX_2 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib_1_SRINVNOT,
      O => U1_prev_fib_1_SRFFMUX
    );
  U1_prev_fib_1_SRINV : X_INV
    port map (
      I => RESET_c,
      O => U1_prev_fib_1_SRINVNOT
    );
  U1_prev_fib_1_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => U1_prev_fib_1_CLKINVNOT
    );
  U1_prev_fib_1_CEINV_3 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => U1_prev_fib_1_CEINV
    );
  U1_prev_fib_3_DXMUX_4 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(3),
      O => U1_prev_fib_3_DXMUX
    );
  U1_prev_fib_3_DYMUX_5 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(2),
      O => U1_prev_fib_3_DYMUX
    );
  U1_prev_fib_3_SRFFMUX_6 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib_3_SRINVNOT,
      O => U1_prev_fib_3_SRFFMUX
    );
  U1_prev_fib_3_SRINV : X_INV
    port map (
      I => RESET_c,
      O => U1_prev_fib_3_SRINVNOT
    );
  U1_prev_fib_3_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => U1_prev_fib_3_CLKINVNOT
    );
  U1_prev_fib_3_CEINV_7 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => U1_prev_fib_3_CEINV
    );
  U1_m5 : X_LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(1),
      ADR2 => FIBO_c(2),
      ADR3 => FIBO_c(3),
      O => DISPB_c_1_G
    );
  DISPB_c_1_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_1_F,
      O => DISPB_c_1_Q
    );
  DISPB_c_1_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_1_G,
      O => DISPB_c_0_Q
    );
  U1_prev_fib_5_DXMUX_8 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(5),
      O => U1_prev_fib_5_DXMUX
    );
  U1_prev_fib_5_DYMUX_9 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(4),
      O => U1_prev_fib_5_DYMUX
    );
  U1_prev_fib_5_SRFFMUX_10 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib_5_SRINVNOT,
      O => U1_prev_fib_5_SRFFMUX
    );
  U1_prev_fib_5_SRINV : X_INV
    port map (
      I => RESET_c,
      O => U1_prev_fib_5_SRINVNOT
    );
  U1_prev_fib_5_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => U1_prev_fib_5_CLKINVNOT
    );
  U1_prev_fib_5_CEINV_11 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => U1_prev_fib_5_CEINV
    );
  U1_prev_fib_1_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_1_DXMUX,
      CE => U1_prev_fib_1_CEINV,
      CLK => U1_prev_fib_1_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_1_FFX_RST,
      O => U1_prev_fib(1)
    );
  U1_prev_fib_1_FFX_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_1_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_1_FFX_RST
    );
  U1_m5_0 : X_LUT4
    generic map(
      INIT => X"0825"
    )
    port map (
      ADR0 => FIBO_c(6),
      ADR1 => FIBO_c(4),
      ADR2 => FIBO_c(7),
      ADR3 => FIBO_c(5),
      O => DISPA_c_1_G
    );
  DISPA_c_1_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_1_F,
      O => DISPA_c_1_Q
    );
  DISPA_c_1_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_1_G,
      O => DISPA_c_0_Q
    );
  U1_prev_fib_7_DXMUX_12 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(7),
      O => U1_prev_fib_7_DXMUX
    );
  U1_prev_fib_7_DYMUX_13 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(6),
      O => U1_prev_fib_7_DYMUX
    );
  U1_prev_fib_7_SRFFMUX_14 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib_7_SRINVNOT,
      O => U1_prev_fib_7_SRFFMUX
    );
  U1_prev_fib_7_SRINV : X_INV
    port map (
      I => RESET_c,
      O => U1_prev_fib_7_SRINVNOT
    );
  U1_prev_fib_7_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => U1_prev_fib_7_CLKINVNOT
    );
  U1_prev_fib_7_CEINV_15 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => U1_prev_fib_7_CEINV
    );
  U1_N_22_i_16 : X_LUT4
    generic map(
      INIT => X"A142"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(3),
      ADR2 => FIBO_c(1),
      ADR3 => FIBO_c(2),
      O => DISPB_c_2_G
    );
  DISPB_c_2_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_2_F,
      O => DISPB_c_2_Q
    );
  DISPB_c_2_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_2_G,
      O => U1_N_22_i
    );
  U1_fibadd_axb_7_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_7_F,
      O => U1_fibadd_axb_7
    );
  U1_fibadd_axb_7_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_7_G,
      O => U1_un3_prev_fib_0
    );
  FIBO_c_1_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_1_F,
      O => U1_fibadd_axb_0
    );
  FIBO_c_1_CYMUXF : X_MUX2
    port map (
      IA => FIBO_c_1_CY0F,
      IB => FIBO_c_1_CYINIT,
      SEL => FIBO_c_1_CYSELF,
      O => U1_fibadd_cry_0_O
    );
  FIBO_c_1_CYINIT_17 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_1_BXINVNOT,
      O => FIBO_c_1_CYINIT
    );
  FIBO_c_1_CY0F_18 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib(0),
      O => FIBO_c_1_CY0F
    );
  FIBO_c_1_CYSELF_19 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_1_F,
      O => FIBO_c_1_CYSELF
    );
  FIBO_c_1_BXINV : X_INV
    port map (
      I => GLOBAL_LOGIC1_0,
      O => FIBO_c_1_BXINVNOT
    );
  FIBO_c_1_DYMUX_20 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd(7),
      O => FIBO_c_1_DYMUX
    );
  FIBO_c_1_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_1_XORG,
      O => U1_fibadd(7)
    );
  FIBO_c_1_XORG_21 : X_XOR2
    port map (
      I0 => U1_fibadd_cry_0_O,
      I1 => U1_fibadd_axb_1,
      O => FIBO_c_1_XORG
    );
  FIBO_c_1_COUTUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_1_CYMUXG,
      O => U1_fibadd_cry_1_O
    );
  FIBO_c_1_CYMUXG_22 : X_MUX2
    port map (
      IA => FIBO_c_1_CY0G,
      IB => U1_fibadd_cry_0_O,
      SEL => FIBO_c_1_CYSELG,
      O => FIBO_c_1_CYMUXG
    );
  FIBO_c_1_CY0G_23 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib(1),
      O => FIBO_c_1_CY0G
    );
  FIBO_c_1_CYSELG_24 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_1,
      O => FIBO_c_1_CYSELG
    );
  FIBO_c_1_SRINV : X_INV
    port map (
      I => RESET_c,
      O => FIBO_c_1_SRINVNOT
    );
  FIBO_c_1_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => FIBO_c_1_CLKINVNOT
    );
  FIBO_c_1_CEINV_25 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => FIBO_c_1_CEINV
    );
  FIBO_c_2_DXMUX_26 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd(6),
      O => FIBO_c_2_DXMUX
    );
  FIBO_c_2_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_2_XORF,
      O => U1_fibadd(6)
    );
  FIBO_c_2_XORF_27 : X_XOR2
    port map (
      I0 => FIBO_c_2_CYINIT,
      I1 => U1_fibadd_axb_2,
      O => FIBO_c_2_XORF
    );
  FIBO_c_2_CYMUXF2_28 : X_MUX2
    port map (
      IA => FIBO_c_2_CY0F,
      IB => FIBO_c_2_CY0F,
      SEL => FIBO_c_2_CYSELF,
      O => FIBO_c_2_CYMUXF2
    );
  FIBO_c_2_CYMUXF : X_MUX2
    port map (
      IA => FIBO_c_2_CY0F,
      IB => FIBO_c_2_CYINIT,
      SEL => FIBO_c_2_CYSELF,
      O => U1_fibadd_cry_2_O
    );
  FIBO_c_2_CYINIT_29 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_cry_1_O,
      O => FIBO_c_2_CYINIT
    );
  FIBO_c_2_CY0F_30 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib(2),
      O => FIBO_c_2_CY0F
    );
  FIBO_c_2_CYSELF_31 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_2,
      O => FIBO_c_2_CYSELF
    );
  FIBO_c_2_DYMUX_32 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd(5),
      O => FIBO_c_2_DYMUX
    );
  FIBO_c_2_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_2_XORG,
      O => U1_fibadd(5)
    );
  FIBO_c_2_XORG_33 : X_XOR2
    port map (
      I0 => U1_fibadd_cry_2_O,
      I1 => U1_fibadd_axb_3,
      O => FIBO_c_2_XORG
    );
  FIBO_c_2_COUTUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_2_CYMUXFAST,
      O => U1_fibadd_cry_3_O
    );
  FIBO_c_2_FASTCARRY_34 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_cry_1_O,
      O => FIBO_c_2_FASTCARRY
    );
  FIBO_c_2_CYAND_35 : X_AND2
    port map (
      I0 => FIBO_c_2_CYSELG,
      I1 => FIBO_c_2_CYSELF,
      O => FIBO_c_2_CYAND
    );
  FIBO_c_2_CYMUXFAST_36 : X_MUX2
    port map (
      IA => FIBO_c_2_CYMUXG2,
      IB => FIBO_c_2_FASTCARRY,
      SEL => FIBO_c_2_CYAND,
      O => FIBO_c_2_CYMUXFAST
    );
  FIBO_c_2_CYMUXG2_37 : X_MUX2
    port map (
      IA => FIBO_c_2_CY0G,
      IB => FIBO_c_2_CYMUXF2,
      SEL => FIBO_c_2_CYSELG,
      O => FIBO_c_2_CYMUXG2
    );
  FIBO_c_2_CY0G_38 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib(3),
      O => FIBO_c_2_CY0G
    );
  FIBO_c_2_CYSELG_39 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_3,
      O => FIBO_c_2_CYSELG
    );
  FIBO_c_2_SRFFMUX_40 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_2_SRINVNOT,
      O => FIBO_c_2_SRFFMUX
    );
  FIBO_c_2_SRINV : X_INV
    port map (
      I => RESET_c,
      O => FIBO_c_2_SRINVNOT
    );
  FIBO_c_2_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => FIBO_c_2_CLKINVNOT
    );
  FIBO_c_2_CEINV_41 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => FIBO_c_2_CEINV
    );
  FIBO_c_4_DXMUX_42 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd(4),
      O => FIBO_c_4_DXMUX
    );
  FIBO_c_4_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_4_XORF,
      O => U1_fibadd(4)
    );
  FIBO_c_4_XORF_43 : X_XOR2
    port map (
      I0 => FIBO_c_4_CYINIT,
      I1 => U1_fibadd_axb_4,
      O => FIBO_c_4_XORF
    );
  FIBO_c_4_CYMUXF2_44 : X_MUX2
    port map (
      IA => FIBO_c_4_CY0F,
      IB => FIBO_c_4_CY0F,
      SEL => FIBO_c_4_CYSELF,
      O => FIBO_c_4_CYMUXF2
    );
  FIBO_c_4_CYMUXF : X_MUX2
    port map (
      IA => FIBO_c_4_CY0F,
      IB => FIBO_c_4_CYINIT,
      SEL => FIBO_c_4_CYSELF,
      O => U1_fibadd_cry_4_O
    );
  FIBO_c_4_CYINIT_45 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_cry_3_O,
      O => FIBO_c_4_CYINIT
    );
  FIBO_c_4_CY0F_46 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib(4),
      O => FIBO_c_4_CY0F
    );
  FIBO_c_4_CYSELF_47 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_4,
      O => FIBO_c_4_CYSELF
    );
  FIBO_c_4_DYMUX_48 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd(3),
      O => FIBO_c_4_DYMUX
    );
  FIBO_c_4_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_4_XORG,
      O => U1_fibadd(3)
    );
  FIBO_c_4_XORG_49 : X_XOR2
    port map (
      I0 => U1_fibadd_cry_4_O,
      I1 => U1_fibadd_axb_5,
      O => FIBO_c_4_XORG
    );
  FIBO_c_4_COUTUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_4_CYMUXFAST,
      O => U1_fibadd_cry_5_O
    );
  FIBO_c_4_FASTCARRY_50 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_cry_3_O,
      O => FIBO_c_4_FASTCARRY
    );
  FIBO_c_4_CYAND_51 : X_AND2
    port map (
      I0 => FIBO_c_4_CYSELG,
      I1 => FIBO_c_4_CYSELF,
      O => FIBO_c_4_CYAND
    );
  FIBO_c_4_CYMUXFAST_52 : X_MUX2
    port map (
      IA => FIBO_c_4_CYMUXG2,
      IB => FIBO_c_4_FASTCARRY,
      SEL => FIBO_c_4_CYAND,
      O => FIBO_c_4_CYMUXFAST
    );
  FIBO_c_4_CYMUXG2_53 : X_MUX2
    port map (
      IA => FIBO_c_4_CY0G,
      IB => FIBO_c_4_CYMUXF2,
      SEL => FIBO_c_4_CYSELG,
      O => FIBO_c_4_CYMUXG2
    );
  FIBO_c_4_CY0G_54 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib(5),
      O => FIBO_c_4_CY0G
    );
  FIBO_c_4_CYSELG_55 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_5,
      O => FIBO_c_4_CYSELG
    );
  FIBO_c_4_SRFFMUX_56 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_4_SRINVNOT,
      O => FIBO_c_4_SRFFMUX
    );
  FIBO_c_4_SRINV : X_INV
    port map (
      I => RESET_c,
      O => FIBO_c_4_SRINVNOT
    );
  FIBO_c_4_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => FIBO_c_4_CLKINVNOT
    );
  FIBO_c_4_CEINV_57 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => FIBO_c_4_CEINV
    );
  FIBO_c_6_FFX_RSTOR : X_OR2
    port map (
      I0 => FIBO_c_6_SRFFMUX,
      I1 => GSR,
      O => FIBO_c_6_FFX_RST
    );
  U1_FIB_6_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => FIBO_c_6_DXMUX,
      CE => FIBO_c_6_CEINV,
      CLK => FIBO_c_6_CLKINVNOT,
      SET => GND,
      RST => FIBO_c_6_FFX_RST,
      O => FIBO_c(6)
    );
  U1_fibadd_axb_6_58 : X_LUT4
    generic map(
      INIT => X"55AA"
    )
    port map (
      ADR0 => U1_prev_fib(6),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => FIBO_c(6),
      O => U1_fibadd_axb_6
    );
  FIBO_c_6_FFY_RSTOR : X_OR2
    port map (
      I0 => FIBO_c_6_SRFFMUX,
      I1 => GSR,
      O => FIBO_c_6_FFY_RST
    );
  U1_FIB_7_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => FIBO_c_6_DYMUX,
      CE => FIBO_c_6_CEINV,
      CLK => FIBO_c_6_CLKINVNOT,
      SET => GND,
      RST => FIBO_c_6_FFY_RST,
      O => FIBO_c(7)
    );
  FIBO_c_6_DXMUX_59 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd(2),
      O => FIBO_c_6_DXMUX
    );
  FIBO_c_6_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_6_XORF,
      O => U1_fibadd(2)
    );
  FIBO_c_6_XORF_60 : X_XOR2
    port map (
      I0 => FIBO_c_6_CYINIT,
      I1 => U1_fibadd_axb_6,
      O => FIBO_c_6_XORF
    );
  FIBO_c_6_CYMUXF : X_MUX2
    port map (
      IA => FIBO_c_6_CY0F,
      IB => FIBO_c_6_CYINIT,
      SEL => FIBO_c_6_CYSELF,
      O => U1_fibadd_cry_6_O
    );
  FIBO_c_6_CYINIT_61 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_cry_5_O,
      O => FIBO_c_6_CYINIT
    );
  FIBO_c_6_CY0F_62 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_prev_fib(6),
      O => FIBO_c_6_CY0F
    );
  FIBO_c_6_CYSELF_63 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd_axb_6,
      O => FIBO_c_6_CYSELF
    );
  FIBO_c_6_DYMUX_64 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_fibadd(1),
      O => FIBO_c_6_DYMUX
    );
  FIBO_c_6_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_6_XORG,
      O => U1_fibadd(1)
    );
  FIBO_c_6_XORG_65 : X_XOR2
    port map (
      I0 => U1_fibadd_cry_6_O,
      I1 => U1_fibadd_axb_7_rt,
      O => FIBO_c_6_XORG
    );
  FIBO_c_6_SRFFMUX_66 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_6_SRINVNOT,
      O => FIBO_c_6_SRFFMUX
    );
  FIBO_c_6_SRINV : X_INV
    port map (
      I => RESET_c,
      O => FIBO_c_6_SRINVNOT
    );
  FIBO_c_6_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => FIBO_c_6_CLKINVNOT
    );
  FIBO_c_6_CEINV_67 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => FIBO_c_6_CEINV
    );
  FIBO_obuf_0_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_0_O,
      CTL => FIBO_0_ENABLE,
      O => FIBO(0)
    );
  FIBO_0_ENABLEINV : X_INV
    port map (
      I => FIBO_0_GTS_OR_T,
      O => FIBO_0_ENABLE
    );
  FIBO_0_GTS_OR_T_68 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_0_GTS_OR_T
    );
  FIBO_obuf_1_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_1_O,
      CTL => FIBO_1_ENABLE,
      O => FIBO(1)
    );
  FIBO_1_ENABLEINV : X_INV
    port map (
      I => FIBO_1_GTS_OR_T,
      O => FIBO_1_ENABLE
    );
  FIBO_1_GTS_OR_T_69 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_1_GTS_OR_T
    );
  ENABLE_ibuf : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE,
      O => ENABLE_INBUF
    );
  FIBO_obuf_2_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_2_O,
      CTL => FIBO_2_ENABLE,
      O => FIBO(2)
    );
  FIBO_2_ENABLEINV : X_INV
    port map (
      I => FIBO_2_GTS_OR_T,
      O => FIBO_2_ENABLE
    );
  FIBO_2_GTS_OR_T_70 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_2_GTS_OR_T
    );
  FIBO_obuf_3_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_3_O,
      CTL => FIBO_3_ENABLE,
      O => FIBO(3)
    );
  FIBO_3_ENABLEINV : X_INV
    port map (
      I => FIBO_3_GTS_OR_T,
      O => FIBO_3_ENABLE
    );
  FIBO_3_GTS_OR_T_71 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_3_GTS_OR_T
    );
  FIBO_obuf_4_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_4_O,
      CTL => FIBO_4_ENABLE,
      O => FIBO(4)
    );
  FIBO_4_ENABLEINV : X_INV
    port map (
      I => FIBO_4_GTS_OR_T,
      O => FIBO_4_ENABLE
    );
  FIBO_4_GTS_OR_T_72 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_4_GTS_OR_T
    );
  FIBO_obuf_5_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_5_O,
      CTL => FIBO_5_ENABLE,
      O => FIBO(5)
    );
  FIBO_5_ENABLEINV : X_INV
    port map (
      I => FIBO_5_GTS_OR_T,
      O => FIBO_5_ENABLE
    );
  FIBO_5_GTS_OR_T_73 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_5_GTS_OR_T
    );
  FIBO_obuf_6_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_6_O,
      CTL => FIBO_6_ENABLE,
      O => FIBO(6)
    );
  FIBO_6_ENABLEINV : X_INV
    port map (
      I => FIBO_6_GTS_OR_T,
      O => FIBO_6_ENABLE
    );
  FIBO_6_GTS_OR_T_74 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_6_GTS_OR_T
    );
  FIBO_obuf_7_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_7_O,
      CTL => FIBO_7_ENABLE,
      O => FIBO(7)
    );
  FIBO_7_ENABLEINV : X_INV
    port map (
      I => FIBO_7_GTS_OR_T,
      O => FIBO_7_ENABLE
    );
  FIBO_7_GTS_OR_T_75 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => FIBO_7_GTS_OR_T
    );
  U1_prev_fib_2_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_3_DYMUX,
      CE => U1_prev_fib_3_CEINV,
      CLK => U1_prev_fib_3_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_3_FFY_RST,
      O => U1_prev_fib(2)
    );
  U1_prev_fib_3_FFY_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_3_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_3_FFY_RST
    );
  DISPA_obuf_0_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_0_O,
      CTL => DISPA_0_ENABLE,
      O => DISPA(0)
    );
  DISPA_0_ENABLEINV : X_INV
    port map (
      I => DISPA_0_GTS_OR_T,
      O => DISPA_0_ENABLE
    );
  DISPA_0_GTS_OR_T_76 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPA_0_GTS_OR_T
    );
  DISPA_obuf_1_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_1_O,
      CTL => DISPA_1_ENABLE,
      O => DISPA(1)
    );
  DISPA_1_ENABLEINV : X_INV
    port map (
      I => DISPA_1_GTS_OR_T,
      O => DISPA_1_ENABLE
    );
  DISPA_1_GTS_OR_T_77 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPA_1_GTS_OR_T
    );
  DISPA_obuf_2_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_2_O,
      CTL => DISPA_2_ENABLE,
      O => DISPA(2)
    );
  DISPA_2_ENABLEINV : X_INV
    port map (
      I => DISPA_2_GTS_OR_T,
      O => DISPA_2_ENABLE
    );
  DISPA_2_GTS_OR_T_78 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPA_2_GTS_OR_T
    );
  DISPA_obuf_3_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_3_O,
      CTL => DISPA_3_ENABLE,
      O => DISPA(3)
    );
  DISPA_3_ENABLEINV : X_INV
    port map (
      I => DISPA_3_GTS_OR_T,
      O => DISPA_3_ENABLE
    );
  DISPA_3_GTS_OR_T_79 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPA_3_GTS_OR_T
    );
  DISPB_obuf_0_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_0_O,
      CTL => DISPB_0_ENABLE,
      O => DISPB(0)
    );
  DISPB_0_ENABLEINV : X_INV
    port map (
      I => DISPB_0_GTS_OR_T,
      O => DISPB_0_ENABLE
    );
  DISPB_0_GTS_OR_T_80 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPB_0_GTS_OR_T
    );
  DISPA_obuf_4_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_4_O,
      CTL => DISPA_4_ENABLE,
      O => DISPA(4)
    );
  DISPA_4_ENABLEINV : X_INV
    port map (
      I => DISPA_4_GTS_OR_T,
      O => DISPA_4_ENABLE
    );
  DISPA_4_GTS_OR_T_81 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPA_4_GTS_OR_T
    );
  DISPB_obuf_1_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_1_O,
      CTL => DISPB_1_ENABLE,
      O => DISPB(1)
    );
  DISPB_1_ENABLEINV : X_INV
    port map (
      I => DISPB_1_GTS_OR_T,
      O => DISPB_1_ENABLE
    );
  DISPB_1_GTS_OR_T_82 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPB_1_GTS_OR_T
    );
  DISPA_obuf_5_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_5_O,
      CTL => DISPA_5_ENABLE,
      O => DISPA(5)
    );
  DISPA_5_ENABLEINV : X_INV
    port map (
      I => DISPA_5_GTS_OR_T,
      O => DISPA_5_ENABLE
    );
  DISPA_5_GTS_OR_T_83 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPA_5_GTS_OR_T
    );
  DISPB_obuf_2_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_2_O,
      CTL => DISPB_2_ENABLE,
      O => DISPB(2)
    );
  DISPB_2_ENABLEINV : X_INV
    port map (
      I => DISPB_2_GTS_OR_T,
      O => DISPB_2_ENABLE
    );
  DISPB_2_GTS_OR_T_84 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPB_2_GTS_OR_T
    );
  DISPA_obuf_6_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_6_O,
      CTL => DISPA_6_ENABLE,
      O => DISPA(6)
    );
  DISPA_6_ENABLEINV : X_INV
    port map (
      I => DISPA_6_GTS_OR_T,
      O => DISPA_6_ENABLE
    );
  DISPA_6_GTS_OR_T_85 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPA_6_GTS_OR_T
    );
  DISPB_obuf_3_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_3_O,
      CTL => DISPB_3_ENABLE,
      O => DISPB(3)
    );
  DISPB_3_ENABLEINV : X_INV
    port map (
      I => DISPB_3_GTS_OR_T,
      O => DISPB_3_ENABLE
    );
  DISPB_3_GTS_OR_T_86 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPB_3_GTS_OR_T
    );
  DISPB_obuf_4_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_4_O,
      CTL => DISPB_4_ENABLE,
      O => DISPB(4)
    );
  DISPB_4_ENABLEINV : X_INV
    port map (
      I => DISPB_4_GTS_OR_T,
      O => DISPB_4_ENABLE
    );
  DISPB_4_GTS_OR_T_87 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPB_4_GTS_OR_T
    );
  DISPB_obuf_5_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_5_O,
      CTL => DISPB_5_ENABLE,
      O => DISPB(5)
    );
  DISPB_5_ENABLEINV : X_INV
    port map (
      I => DISPB_5_GTS_OR_T,
      O => DISPB_5_ENABLE
    );
  DISPB_5_GTS_OR_T_88 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPB_5_GTS_OR_T
    );
  DISPB_obuf_6_Q : X_TRI_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_6_O,
      CTL => DISPB_6_ENABLE,
      O => DISPB(6)
    );
  DISPB_6_ENABLEINV : X_INV
    port map (
      I => DISPB_6_GTS_OR_T,
      O => DISPB_6_ENABLE
    );
  DISPB_6_GTS_OR_T_89 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => GTS,
      O => DISPB_6_GTS_OR_T
    );
  U1_prev_fib_3_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_3_DXMUX,
      CE => U1_prev_fib_3_CEINV,
      CLK => U1_prev_fib_3_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_3_FFX_RST,
      O => U1_prev_fib(3)
    );
  U1_prev_fib_3_FFX_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_3_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_3_FFX_RST
    );
  CLK_ibuf_IBUFG_90 : X_BUF_PP
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
  FIBO_c_0_DXMUX_91 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_N_86_i_O,
      O => FIBO_c_0_DXMUX
    );
  FIBO_c_0_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_0_F,
      O => U1_N_86_i_O
    );
  FIBO_c_0_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_0_G,
      O => U1_un3_prev_fib_12_O
    );
  FIBO_c_0_SRFFMUX_92 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_0_SRINVNOT,
      O => FIBO_c_0_SRFFMUX
    );
  FIBO_c_0_SRINV : X_INV
    port map (
      I => RESET_c,
      O => FIBO_c_0_SRINVNOT
    );
  FIBO_c_0_CLKINV : X_INV
    port map (
      I => CLK_c,
      O => FIBO_c_0_CLKINVNOT
    );
  FIBO_c_0_CEINV_93 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_c,
      O => FIBO_c_0_CEINV
    );
  U1_un3_prev_fib_8_94 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => U1_prev_fib(0),
      ADR1 => U1_prev_fib(1),
      ADR2 => U1_prev_fib(2),
      ADR3 => U1_prev_fib(3),
      O => U1_un3_prev_fib_8_F
    );
  U1_un3_prev_fib_8_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_un3_prev_fib_8_F,
      O => U1_un3_prev_fib_8
    );
  DISPB_c_6_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_6_F,
      O => DISPB_c_6_Q
    );
  DISPB_c_6_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_6_G,
      O => U1_N_25_i
    );
  DISPA_c_2_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_2_F,
      O => DISPA_c_2_Q
    );
  DISPA_c_2_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_2_G,
      O => U1_N_51_i
    );
  U1_un3_prev_fib_10_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_un3_prev_fib_10_F,
      O => U1_un3_prev_fib_10
    );
  U1_un3_prev_fib_10_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_un3_prev_fib_10_G,
      O => U1_N_29_i
    );
  DISPA_c_6_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_6_F,
      O => DISPA_c_6_Q
    );
  DISPA_c_6_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_6_G,
      O => U1_N_54_i
    );
  U1_un3_prev_fib_11_XUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_un3_prev_fib_11_F,
      O => U1_un3_prev_fib_11
    );
  U1_un3_prev_fib_11_YUSED : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_un3_prev_fib_11_G,
      O => U1_N_58_i
    );
  U1_m9 : X_LUT4
    generic map(
      INIT => X"200E"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(1),
      ADR2 => FIBO_c(2),
      ADR3 => FIBO_c(3),
      O => DISPB_c_1_F
    );
  U1_prev_fib_4_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_5_DYMUX,
      CE => U1_prev_fib_5_CEINV,
      CLK => U1_prev_fib_5_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_5_FFY_RST,
      O => U1_prev_fib(4)
    );
  U1_prev_fib_5_FFY_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_5_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_5_FFY_RST
    );
  U1_prev_fib_5_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_5_DXMUX,
      CE => U1_prev_fib_5_CEINV,
      CLK => U1_prev_fib_5_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_5_FFX_RST,
      O => U1_prev_fib(5)
    );
  U1_prev_fib_5_FFX_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_5_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_5_FFX_RST
    );
  U1_un3_prev_fib_0_95 : X_LUT4
    generic map(
      INIT => X"0055"
    )
    port map (
      ADR0 => U1_prev_fib(6),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => U1_prev_fib(7),
      O => U1_fibadd_axb_7_G
    );
  U1_m9_0 : X_LUT4
    generic map(
      INIT => X"0584"
    )
    port map (
      ADR0 => FIBO_c(6),
      ADR1 => FIBO_c(4),
      ADR2 => FIBO_c(7),
      ADR3 => FIBO_c(5),
      O => DISPA_c_1_F
    );
  U1_fibadd_axb_0_96 : X_LUT4
    generic map(
      INIT => X"55AA"
    )
    port map (
      ADR0 => U1_prev_fib(0),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => FIBO_c(0),
      O => FIBO_c_1_F
    );
  U1_fibadd_axb_3_97 : X_LUT4
    generic map(
      INIT => X"5A5A"
    )
    port map (
      ADR0 => U1_prev_fib(3),
      ADR1 => VCC,
      ADR2 => FIBO_c(3),
      ADR3 => VCC,
      O => U1_fibadd_axb_3
    );
  U1_FIB_3_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => FIBO_c_2_DYMUX,
      CE => FIBO_c_2_CEINV,
      CLK => FIBO_c_2_CLKINVNOT,
      SET => GND,
      RST => FIBO_c_2_FFY_RST,
      O => FIBO_c(3)
    );
  FIBO_c_2_FFY_RSTOR : X_OR2
    port map (
      I0 => FIBO_c_2_SRFFMUX,
      I1 => GSR,
      O => FIBO_c_2_FFY_RST
    );
  U1_fibadd_axb_2_98 : X_LUT4
    generic map(
      INIT => X"3C3C"
    )
    port map (
      ADR0 => VCC,
      ADR1 => U1_prev_fib(2),
      ADR2 => FIBO_c(2),
      ADR3 => VCC,
      O => U1_fibadd_axb_2
    );
  U1_N_51_i_99 : X_LUT4
    generic map(
      INIT => X"C124"
    )
    port map (
      ADR0 => FIBO_c(7),
      ADR1 => FIBO_c(6),
      ADR2 => FIBO_c(5),
      ADR3 => FIBO_c(4),
      O => DISPA_c_2_G
    );
  U1_un3_prev_fib_12 : X_LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      ADR0 => U1_un3_prev_fib_0,
      ADR1 => U1_prev_fib(5),
      ADR2 => U1_prev_fib(4),
      ADR3 => U1_un3_prev_fib_8,
      O => FIBO_c_0_G
    );
  U1_N_25_i_100 : X_LUT4
    generic map(
      INIT => X"D004"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(1),
      ADR2 => FIBO_c(2),
      ADR3 => FIBO_c(3),
      O => DISPB_c_6_G
    );
  U1_N_86_i : X_LUT4
    generic map(
      INIT => X"ECCC"
    )
    port map (
      ADR0 => U1_un3_prev_fib_10,
      ADR1 => U1_fibadd_axb_0,
      ADR2 => U1_un3_prev_fib_11,
      ADR3 => U1_un3_prev_fib_12_O,
      O => FIBO_c_0_F
    );
  U1_FIB_0_Q : X_FF
    generic map(
      INIT => '1'
    )
    port map (
      I => FIBO_c_0_DXMUX,
      CE => FIBO_c_0_CEINV,
      CLK => FIBO_c_0_CLKINVNOT,
      SET => FIBO_c_0_FFX_SET,
      RST => GND,
      O => FIBO_c(0)
    );
  FIBO_c_0_FFX_SETOR : X_OR2
    port map (
      I0 => GSR,
      I1 => FIBO_c_0_SRFFMUX,
      O => FIBO_c_0_FFX_SET
    );
  U1_prev_fib_6_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_7_DYMUX,
      CE => U1_prev_fib_7_CEINV,
      CLK => U1_prev_fib_7_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_7_FFY_RST,
      O => U1_prev_fib(6)
    );
  U1_prev_fib_7_FFY_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_7_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_7_FFY_RST
    );
  U1_prev_fib_7_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => U1_prev_fib_7_DXMUX,
      CE => U1_prev_fib_7_CEINV,
      CLK => U1_prev_fib_7_CLKINVNOT,
      SET => GND,
      RST => U1_prev_fib_7_FFX_RST,
      O => U1_prev_fib(7)
    );
  U1_prev_fib_7_FFX_RSTOR : X_OR2
    port map (
      I0 => U1_prev_fib_7_SRFFMUX,
      I1 => GSR,
      O => U1_prev_fib_7_FFX_RST
    );
  U1_m13 : X_LUT4
    generic map(
      INIT => X"232A"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(3),
      ADR2 => FIBO_c(1),
      ADR3 => FIBO_c(2),
      O => DISPB_c_2_F
    );
  U1_fibadd_axb_7_101 : X_LUT4
    generic map(
      INIT => X"33CC"
    )
    port map (
      ADR0 => VCC,
      ADR1 => FIBO_c(7),
      ADR2 => VCC,
      ADR3 => U1_prev_fib(7),
      O => U1_fibadd_axb_7_F
    );
  U1_fibadd_axb_1_102 : X_LUT4
    generic map(
      INIT => X"6666"
    )
    port map (
      ADR0 => FIBO_c(1),
      ADR1 => U1_prev_fib(1),
      ADR2 => VCC,
      ADR3 => VCC,
      O => U1_fibadd_axb_1
    );
  U1_FIB_1_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => FIBO_c_1_DYMUX,
      CE => FIBO_c_1_CEINV,
      CLK => FIBO_c_1_CLKINVNOT,
      SET => GND,
      RST => FIBO_c_1_FFY_RST,
      O => FIBO_c(1)
    );
  FIBO_c_1_FFY_RSTOR : X_OR2
    port map (
      I0 => FIBO_c_1_FFY_RSTAND,
      I1 => GSR,
      O => FIBO_c_1_FFY_RST
    );
  FIBO_c_1_FFY_RSTAND_103 : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c_1_SRINVNOT,
      O => FIBO_c_1_FFY_RSTAND
    );
  U1_fibadd_axb_5_104 : X_LUT4
    generic map(
      INIT => X"55AA"
    )
    port map (
      ADR0 => U1_prev_fib(5),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => FIBO_c(5),
      O => U1_fibadd_axb_5
    );
  U1_FIB_2_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => FIBO_c_2_DXMUX,
      CE => FIBO_c_2_CEINV,
      CLK => FIBO_c_2_CLKINVNOT,
      SET => GND,
      RST => FIBO_c_2_FFX_RST,
      O => FIBO_c(2)
    );
  FIBO_c_2_FFX_RSTOR : X_OR2
    port map (
      I0 => FIBO_c_2_SRFFMUX,
      I1 => GSR,
      O => FIBO_c_2_FFX_RST
    );
  U1_fibadd_axb_7_rt_105 : X_LUT4
    generic map(
      INIT => X"F0F0"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => U1_fibadd_axb_7,
      ADR3 => VCC,
      O => U1_fibadd_axb_7_rt
    );
  U1_FIB_5_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => FIBO_c_4_DYMUX,
      CE => FIBO_c_4_CEINV,
      CLK => FIBO_c_4_CLKINVNOT,
      SET => GND,
      RST => FIBO_c_4_FFY_RST,
      O => FIBO_c(5)
    );
  FIBO_c_4_FFY_RSTOR : X_OR2
    port map (
      I0 => FIBO_c_4_SRFFMUX,
      I1 => GSR,
      O => FIBO_c_4_FFY_RST
    );
  U1_fibadd_axb_4_106 : X_LUT4
    generic map(
      INIT => X"6666"
    )
    port map (
      ADR0 => U1_prev_fib(4),
      ADR1 => FIBO_c(4),
      ADR2 => VCC,
      ADR3 => VCC,
      O => U1_fibadd_axb_4
    );
  U1_FIB_4_Q : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => FIBO_c_4_DXMUX,
      CE => FIBO_c_4_CEINV,
      CLK => FIBO_c_4_CLKINVNOT,
      SET => GND,
      RST => FIBO_c_4_FFX_RST,
      O => FIBO_c(4)
    );
  FIBO_c_4_FFX_RSTOR : X_OR2
    port map (
      I0 => FIBO_c_4_SRFFMUX,
      I1 => GSR,
      O => FIBO_c_4_FFX_RST
    );
  U1_m26 : X_LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(1),
      ADR2 => FIBO_c(2),
      ADR3 => FIBO_c(3),
      O => DISPB_c_6_F
    );
  U1_N_29_i_107 : X_LUT4
    generic map(
      INIT => X"E448"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(2),
      ADR2 => FIBO_c(1),
      ADR3 => FIBO_c(3),
      O => U1_un3_prev_fib_10_G
    );
  U1_m13_0 : X_LUT4
    generic map(
      INIT => X"5704"
    )
    port map (
      ADR0 => FIBO_c(7),
      ADR1 => FIBO_c(6),
      ADR2 => FIBO_c(5),
      ADR3 => FIBO_c(4),
      O => DISPA_c_2_F
    );
  U1_un3_prev_fib_10_108 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => FIBO_c(1),
      ADR1 => FIBO_c(2),
      ADR2 => FIBO_c(3),
      ADR3 => FIBO_c(5),
      O => U1_un3_prev_fib_10_F
    );
  U1_N_54_i_109 : X_LUT4
    generic map(
      INIT => X"A120"
    )
    port map (
      ADR0 => FIBO_c(7),
      ADR1 => FIBO_c(4),
      ADR2 => FIBO_c(6),
      ADR3 => FIBO_c(5),
      O => DISPA_c_6_G
    );
  U1_m26_0 : X_LUT4
    generic map(
      INIT => X"0894"
    )
    port map (
      ADR0 => FIBO_c(7),
      ADR1 => FIBO_c(4),
      ADR2 => FIBO_c(6),
      ADR3 => FIBO_c(5),
      O => DISPA_c_6_F
    );
  U1_N_58_i_110 : X_LUT4
    generic map(
      INIT => X"CA28"
    )
    port map (
      ADR0 => FIBO_c(6),
      ADR1 => FIBO_c(7),
      ADR2 => FIBO_c(4),
      ADR3 => FIBO_c(5),
      O => U1_un3_prev_fib_11_G
    );
  U1_un3_prev_fib_11_111 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => FIBO_c(0),
      ADR1 => FIBO_c(7),
      ADR2 => FIBO_c(4),
      ADR3 => FIBO_c(6),
      O => U1_un3_prev_fib_11_F
    );
  PWR_VCC_0_LOGICAL_ONE : X_ONE
    port map (
      O => GLOBAL_LOGIC1
    );
  PWR_VCC_1_LOGICAL_ONE : X_ONE
    port map (
      O => GLOBAL_LOGIC1_0
    );
  FIBO_0_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(0),
      O => FIBO_0_O
    );
  FIBO_1_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(1),
      O => FIBO_1_O
    );
  ENABLE_IFF_IMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => ENABLE_INBUF,
      O => ENABLE_c
    );
  FIBO_2_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(2),
      O => FIBO_2_O
    );
  FIBO_3_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(3),
      O => FIBO_3_O
    );
  FIBO_4_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(4),
      O => FIBO_4_O
    );
  FIBO_5_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(5),
      O => FIBO_5_O
    );
  FIBO_6_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(6),
      O => FIBO_6_O
    );
  FIBO_7_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => FIBO_c(7),
      O => FIBO_7_O
    );
  DISPA_0_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_0_Q,
      O => DISPA_0_O
    );
  DISPA_1_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_1_Q,
      O => DISPA_1_O
    );
  DISPA_2_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_2_Q,
      O => DISPA_2_O
    );
  DISPA_3_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_N_51_i,
      O => DISPA_3_O
    );
  DISPB_0_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_0_Q,
      O => DISPB_0_O
    );
  DISPA_4_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_N_54_i,
      O => DISPA_4_O
    );
  DISPB_1_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_1_Q,
      O => DISPB_1_O
    );
  DISPA_5_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_N_58_i,
      O => DISPA_5_O
    );
  DISPB_2_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_2_Q,
      O => DISPB_2_O
    );
  DISPA_6_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPA_c_6_Q,
      O => DISPA_6_O
    );
  DISPB_3_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_N_22_i,
      O => DISPB_3_O
    );
  DISPB_4_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_N_25_i,
      O => DISPB_4_O
    );
  DISPB_5_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => U1_N_29_i,
      O => DISPB_5_O
    );
  DISPB_6_OUTPUT_OFF_OMUX : X_BUF_PP
    generic map(
      PATHPULSE => 369 ps
    )
    port map (
      I => DISPB_c_6_Q,
      O => DISPB_6_O
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
  NlwBlock_TOP_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_TOP_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

