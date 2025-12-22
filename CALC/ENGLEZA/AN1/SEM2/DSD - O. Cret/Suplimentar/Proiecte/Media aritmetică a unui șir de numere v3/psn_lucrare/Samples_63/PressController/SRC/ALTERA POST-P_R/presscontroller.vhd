-- Copyright (C) 1991-2004 Altera Corporation
-- Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
-- support information,  device programming or simulation file,  and any other
-- associated  documentation or information  provided by  Altera  or a partner
-- under  Altera's   Megafunction   Partnership   Program  may  be  used  only
-- to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
-- other  use  of such  megafunction  design,  netlist,  support  information,
-- device programming or simulation file,  or any other  related documentation
-- or information  is prohibited  for  any  other purpose,  including, but not
-- limited to  modification,  reverse engineering,  de-compiling, or use  with
-- any other  silicon devices,  unless such use is  explicitly  licensed under
-- a separate agreement with  Altera  or a megafunction partner.  Title to the
-- intellectual property,  including patents,  copyrights,  trademarks,  trade
-- secrets,  or maskworks,  embodied in any such megafunction design, netlist,
-- support  information,  device programming or simulation file,  or any other
-- related documentation or information provided by  Altera  or a megafunction
-- partner, remains with Altera, the megafunction partner, or their respective
-- licensors. No other licenses, including any licenses needed under any third
-- party's intellectual property, are provided herein.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 4.1 Build 181 06/29/2004 SJ Full Version"

-- DATE "09/14/2004 16:49:56"

-- 
-- Device: Altera EPF10K10AFC256-1 Package FBGA256
-- 

-- 
-- This VHDL file should be used for Custom VHDL only
-- 

LIBRARY IEEE, flex10ke;
USE IEEE.std_logic_1164.all;
USE flex10ke.flex10ke_components.all;

ENTITY 	Press_top IS
    PORT (
	DET : IN std_logic;
	CLK : IN std_logic;
	clr : IN std_logic;
	CLK_T : IN std_logic;
	STR : IN std_logic;
	RST : IN std_logic;
	STP : IN std_logic;
	LIMIT : OUT std_logic_vector(5 DOWNTO 0);
	OUTPUT : OUT std_logic;
	TIMER : OUT std_logic_vector(9 DOWNTO 0);
	Y : OUT std_logic_vector(2 DOWNTO 0)
	);
END Press_top;

ARCHITECTURE structure OF Press_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL devoe : std_logic := '0';
SIGNAL ww_DET : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_clr : std_logic;
SIGNAL ww_CLK_T : std_logic;
SIGNAL ww_STR : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_STP : std_logic;
SIGNAL ww_LIMIT : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_OUTPUT : std_logic;
SIGNAL ww_TIMER : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_Y : std_logic_vector(2 DOWNTO 0);
SIGNAL \U101|U202|time_down_tim_cnt8lt8_5\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_a2_2_\ : std_logic;
SIGNAL \U101|U202|un1_timer_add3_cry\ : std_logic;
SIGNAL \U101|U202|un1_timer_add4_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add5_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add5_cry\ : std_logic;
SIGNAL \U101|U202|un1_timer_add6_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add6_cry\ : std_logic;
SIGNAL \U101|U202|un1_timer_add7_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add7_cry\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_a2_0_1_\ : std_logic;
SIGNAL \U101|U202|un1_timer_add8\ : std_logic;
SIGNAL \U101|U201|mds_ns_i_0_0_5_\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_0_0_\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_a2_0_i_0_\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_2_cand_0_~9\ : std_logic;
SIGNAL \U101|U201|mds_srsts_4_~4\ : std_logic;
SIGNAL \clr~dataout\ : std_logic;
SIGNAL \CLK~dataout\ : std_logic;
SIGNAL \U101|U202|LIMIT_i_0_1_\ : std_logic;
SIGNAL \U101|U202|LIMIT_i_0_2_\ : std_logic;
SIGNAL \U101|U202|limit_down_un4_detlt4_3\ : std_logic;
SIGNAL \U101|U202|LIMIT_4_\ : std_logic;
SIGNAL \DET~dataout\ : std_logic;
SIGNAL \STP~dataout\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_o2_1_\ : std_logic;
SIGNAL \RST~dataout\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_2_\ : std_logic;
SIGNAL \U101|U201|mds_5_\ : std_logic;
SIGNAL \U101|U201|mds_4_\ : std_logic;
SIGNAL \U101|U202|time_down_un2_clr\ : std_logic;
SIGNAL \CLK_T~dataout\ : std_logic;
SIGNAL \U101|U202|TIM1\ : std_logic;
SIGNAL \U101|U201|mds_ns_i_0_a2_3_0_i_5_\ : std_logic;
SIGNAL \U101|U201|mds_ns_i_0_a2_3_5_\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_0_i_1_\ : std_logic;
SIGNAL \U101|U201|mds_6_\ : std_logic;
SIGNAL \STR~dataout\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_7_\ : std_logic;
SIGNAL \U101|U201|mds_0_\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_o2_0_0_\ : std_logic;
SIGNAL \U101|U201|mds_ns_i_0_4_\ : std_logic;
SIGNAL \U101|U201|mds_3_\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_0_0_~cascout\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_2_cand_0_~9_cascout\ : std_logic;
SIGNAL \U101|U201|mds_i_7_\ : std_logic;
SIGNAL \U101|U201|mds_ns_i_0_a2_2_5_\ : std_logic;
SIGNAL \U101|U201|mds_ns_i_0_a2_5_\ : std_logic;
SIGNAL \U101|U201|mds_ns_i_0_0_5_~cascout\ : std_logic;
SIGNAL \U101|U201|mds_2_\ : std_logic;
SIGNAL \U101|U201|mds_ns_0_0_a2_6_\ : std_logic;
SIGNAL \U101|U201|mds_1_\ : std_logic;
SIGNAL \U101|U202|un1_det_1\ : std_logic;
SIGNAL \U101|U202|LIMIT_i_0_0_\ : std_logic;
SIGNAL \U101|U202|un2_lim_cnt_c2\ : std_logic;
SIGNAL \U101|U202|LIMIT_3_\ : std_logic;
SIGNAL \U101|U201|OUTPUT_assignment_1_0\ : std_logic;
SIGNAL \U101|U202|TIMER_5_\ : std_logic;
SIGNAL \U101|U202|TIMER_i_0_6_\ : std_logic;
SIGNAL \U101|U202|TIMER_i_0_3_\ : std_logic;
SIGNAL \U101|U202|time_down_tim_cnt8lt8_4\ : std_logic;
SIGNAL \U101|U202|TIMER_8_\ : std_logic;
SIGNAL \U101|U202|TIMER_7_\ : std_logic;
SIGNAL \U101|U202|time_down_tim_cnt8lt8\ : std_logic;
SIGNAL \U101|U202|un1_timer_add0_cry\ : std_logic;
SIGNAL \U101|U202|TIMER_0_\ : std_logic;
SIGNAL \U101|U202|un1_timer_add0_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add1_cry\ : std_logic;
SIGNAL \U101|U202|TIMER_i_0_1_\ : std_logic;
SIGNAL \U101|U202|un1_timer_add1_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add2_cry\ : std_logic;
SIGNAL \U101|U202|TIMER_2_\ : std_logic;
SIGNAL \U101|U202|un1_timer_add2_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add3_cry~COUT\ : std_logic;
SIGNAL \U101|U202|un1_timer_add4_cry\ : std_logic;
SIGNAL \U101|U202|TIMER_i_0_4_\ : std_logic;
SIGNAL \U101|U201|Y_0_\ : std_logic;
SIGNAL \U101|U201|Y_0_i_a2_1_\ : std_logic;
SIGNAL \U101|U201|Y_1_\ : std_logic;
SIGNAL \U101|U201|Y_0_i_a2_2_\ : std_logic;
SIGNAL \U101|U201|Y_2_\ : std_logic;
SIGNAL \U101|U202|ALT_INV_LIMIT_i_0_0_\ : std_logic;
SIGNAL \U101|U202|ALT_INV_LIMIT_i_0_1_\ : std_logic;
SIGNAL \U101|U202|ALT_INV_LIMIT_i_0_2_\ : std_logic;
SIGNAL \U101|U202|ALT_INV_TIMER_i_0_1_\ : std_logic;
SIGNAL \U101|U202|ALT_INV_TIMER_i_0_3_\ : std_logic;
SIGNAL \U101|U202|ALT_INV_TIMER_i_0_4_\ : std_logic;
SIGNAL \U101|U202|ALT_INV_TIMER_i_0_6_\ : std_logic;
SIGNAL \ALT_INV_clr~dataout\ : std_logic;

BEGIN

ww_DET <= DET;
ww_CLK <= CLK;
ww_clr <= clr;
ww_CLK_T <= CLK_T;
ww_STR <= STR;
ww_RST <= RST;
ww_STP <= STP;
LIMIT <= ww_LIMIT;
OUTPUT <= ww_OUTPUT;
TIMER <= ww_TIMER;
Y <= ww_Y;
\U101|U202|ALT_INV_LIMIT_i_0_0_\ <= NOT \U101|U202|LIMIT_i_0_0_\;
\U101|U202|ALT_INV_LIMIT_i_0_1_\ <= NOT \U101|U202|LIMIT_i_0_1_\;
\U101|U202|ALT_INV_LIMIT_i_0_2_\ <= NOT \U101|U202|LIMIT_i_0_2_\;
\U101|U202|ALT_INV_TIMER_i_0_1_\ <= NOT \U101|U202|TIMER_i_0_1_\;
\U101|U202|ALT_INV_TIMER_i_0_3_\ <= NOT \U101|U202|TIMER_i_0_3_\;
\U101|U202|ALT_INV_TIMER_i_0_4_\ <= NOT \U101|U202|TIMER_i_0_4_\;
\U101|U202|ALT_INV_TIMER_i_0_6_\ <= NOT \U101|U202|TIMER_i_0_6_\;
\ALT_INV_clr~dataout\ <= NOT \clr~dataout\;

\U101|U202|time_down_tim_cnt8lt8_5~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|time_down_tim_cnt8lt8_5\ = !\U101|U202|TIMER_2_\ & !\U101|U202|TIMER_0_\ & \U101|U202|TIMER_i_0_4_\ & \U101|U202|TIMER_i_0_1_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "1000",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_2_\,
	datab => \U101|U202|TIMER_0_\,
	datac => \U101|U202|TIMER_i_0_4_\,
	datad => \U101|U202|TIMER_i_0_1_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|time_down_tim_cnt8lt8_5\);

\U101|U201|mds_ns_0_0_a2_2_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_a2_2_\ = \U101|U201|mds_6_\ & !\STR~dataout\ & \RST~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0C00",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U201|mds_6_\,
	datac => \STR~dataout\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_a2_2_\);

\U101|U202|un1_timer_add3_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add3_cry\ = \U101|U202|TIMER_i_0_3_\ $ \U101|U202|time_down_tim_cnt8lt8\ $ \U101|U202|un1_timer_add2_cry~COUT\
-- \U101|U202|un1_timer_add3_cry~COUT\ = CARRY(\U101|U202|TIMER_i_0_3_\ & !\U101|U202|time_down_tim_cnt8lt8\ & \U101|U202|un1_timer_add2_cry~COUT\ # !\U101|U202|TIMER_i_0_3_\ & (\U101|U202|un1_timer_add2_cry~COUT\ # !\U101|U202|time_down_tim_cnt8lt8\))

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "9671",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_i_0_3_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	cin => \U101|U202|un1_timer_add2_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add3_cry\,
	cout => \U101|U202|un1_timer_add3_cry~COUT\);

\U101|U202|un1_timer_add4_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add4_cry\ = \U101|U202|TIMER_i_0_4_\ $ \U101|U202|time_down_tim_cnt8lt8\ $ \U101|U202|un1_timer_add3_cry~COUT\
-- \U101|U202|un1_timer_add4_cry~COUT\ = CARRY(\U101|U202|TIMER_i_0_4_\ & !\U101|U202|time_down_tim_cnt8lt8\ & \U101|U202|un1_timer_add3_cry~COUT\ # !\U101|U202|TIMER_i_0_4_\ & (\U101|U202|un1_timer_add3_cry~COUT\ # !\U101|U202|time_down_tim_cnt8lt8\))

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "9671",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_i_0_4_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	cin => \U101|U202|un1_timer_add3_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add4_cry\,
	cout => \U101|U202|un1_timer_add4_cry~COUT\);

\U101|U202|un1_timer_add5_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add5_cry\ = \U101|U202|TIMER_5_\ $ \U101|U202|time_down_tim_cnt8lt8\ $ !\U101|U202|un1_timer_add4_cry~COUT\
-- \U101|U202|un1_timer_add5_cry~COUT\ = CARRY(\U101|U202|TIMER_5_\ & (\U101|U202|un1_timer_add4_cry~COUT\ # !\U101|U202|time_down_tim_cnt8lt8\) # !\U101|U202|TIMER_5_\ & !\U101|U202|time_down_tim_cnt8lt8\ & \U101|U202|un1_timer_add4_cry~COUT\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "69B2",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_5_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	cin => \U101|U202|un1_timer_add4_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add5_cry\,
	cout => \U101|U202|un1_timer_add5_cry~COUT\);

\U101|U202|un1_timer_add6_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add6_cry\ = \U101|U202|TIMER_i_0_6_\ $ \U101|U202|time_down_tim_cnt8lt8\ $ \U101|U202|un1_timer_add5_cry~COUT\
-- \U101|U202|un1_timer_add6_cry~COUT\ = CARRY(\U101|U202|TIMER_i_0_6_\ & !\U101|U202|time_down_tim_cnt8lt8\ & \U101|U202|un1_timer_add5_cry~COUT\ # !\U101|U202|TIMER_i_0_6_\ & (\U101|U202|un1_timer_add5_cry~COUT\ # !\U101|U202|time_down_tim_cnt8lt8\))

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "9671",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_i_0_6_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	cin => \U101|U202|un1_timer_add5_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add6_cry\,
	cout => \U101|U202|un1_timer_add6_cry~COUT\);

\U101|U202|un1_timer_add7_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add7_cry\ = \U101|U202|TIMER_7_\ $ \U101|U202|time_down_tim_cnt8lt8\ $ !\U101|U202|un1_timer_add6_cry~COUT\
-- \U101|U202|un1_timer_add7_cry~COUT\ = CARRY(\U101|U202|TIMER_7_\ & (\U101|U202|un1_timer_add6_cry~COUT\ # !\U101|U202|time_down_tim_cnt8lt8\) # !\U101|U202|TIMER_7_\ & !\U101|U202|time_down_tim_cnt8lt8\ & \U101|U202|un1_timer_add6_cry~COUT\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "69B2",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_7_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	cin => \U101|U202|un1_timer_add6_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add7_cry\,
	cout => \U101|U202|un1_timer_add7_cry~COUT\);

\U101|U201|mds_ns_0_0_a2_0_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_a2_0_1_\ = \U101|U201|mds_6_\ & \STR~dataout\ & \RST~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "C000",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U201|mds_6_\,
	datac => \STR~dataout\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_a2_0_1_\);

\U101|U202|un1_timer_add8_lut\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add8\ = \U101|U202|time_down_tim_cnt8lt8\ $ \U101|U202|un1_timer_add7_cry~COUT\ $ !\U101|U202|TIMER_8_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "3CC3",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	datad => \U101|U202|TIMER_8_\,
	cin => \U101|U202|un1_timer_add7_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add8\);

\U101|U201|mds_ns_0_0_a2_0_i_0_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_a2_0_i_0_\ = \U101|U202|TIM1\ # \STP~dataout\ & \RST~dataout\ # !\U101|U201|mds_4_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "FDDD",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_4_\,
	datab => \U101|U202|TIM1\,
	datac => \STP~dataout\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_a2_0_i_0_\);

\U101|U201|mds_srsts_4_~4_I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_srsts_4_~4\ = \U101|U201|mds_4_\ & (!\U101|U201|mds_i_7_\ & !\STR~dataout\ # !\U101|U202|TIM1\) # !\U101|U201|mds_4_\ & !\U101|U201|mds_i_7_\ & !\STR~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "222F",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_4_\,
	datab => \U101|U202|TIM1\,
	datac => \U101|U201|mds_i_7_\,
	datad => \STR~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_srsts_4_~4\);

\clr~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input",
	reg_source_mode => "none",
	feedback_mode => "from_pin")
-- pragma translate_on
PORT MAP (
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => GND,
	ena => VCC,
	padio => ww_clr,
	dataout => \clr~dataout\);

\CLK~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input",
	reg_source_mode => "none",
	feedback_mode => "from_pin")
-- pragma translate_on
PORT MAP (
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => GND,
	ena => VCC,
	padio => ww_CLK,
	dataout => \CLK~dataout\);

\U101|U202|LIMIT_i_0_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|LIMIT_i_0_1_\ = DFFEA(\U101|U202|LIMIT_i_0_0_\ $ \U101|U202|LIMIT_i_0_1_\, GLOBAL(\CLK~dataout\), GLOBAL(\clr~dataout\), , \U101|U202|un1_det_1\, , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0FF0",
	clock_enable_mode => "true",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_det_1\,
	datac => \U101|U202|LIMIT_i_0_0_\,
	datad => \U101|U202|LIMIT_i_0_1_\,
	aclr => \ALT_INV_clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|LIMIT_i_0_1_\);

\U101|U202|LIMIT_i_0_2_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|LIMIT_i_0_2_\ = DFFEA(\U101|U202|LIMIT_i_0_2_\ $ (\U101|U202|LIMIT_i_0_1_\ & \U101|U202|LIMIT_i_0_0_\), GLOBAL(\CLK~dataout\), GLOBAL(\clr~dataout\), , \U101|U202|un1_det_1\, , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "3FC0",
	clock_enable_mode => "true",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_det_1\,
	datab => \U101|U202|LIMIT_i_0_1_\,
	datac => \U101|U202|LIMIT_i_0_0_\,
	datad => \U101|U202|LIMIT_i_0_2_\,
	aclr => \ALT_INV_clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|LIMIT_i_0_2_\);

\U101|U202|limit_down_un4_detlt4_3~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|limit_down_un4_detlt4_3\ = !\U101|U202|LIMIT_3_\ & \U101|U202|LIMIT_i_0_2_\ & \U101|U202|LIMIT_i_0_1_\ & \U101|U202|LIMIT_i_0_0_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "4000",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|LIMIT_3_\,
	datab => \U101|U202|LIMIT_i_0_2_\,
	datac => \U101|U202|LIMIT_i_0_1_\,
	datad => \U101|U202|LIMIT_i_0_0_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|limit_down_un4_detlt4_3\);

\U101|U202|LIMIT_4_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|LIMIT_4_\ = DFFEA(\U101|U202|limit_down_un4_detlt4_3\ $ \U101|U202|LIMIT_4_\, GLOBAL(\CLK~dataout\), GLOBAL(\clr~dataout\), , \U101|U202|un1_det_1\, , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0FF0",
	clock_enable_mode => "true",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_det_1\,
	datac => \U101|U202|limit_down_un4_detlt4_3\,
	datad => \U101|U202|LIMIT_4_\,
	aclr => \ALT_INV_clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|LIMIT_4_\);

\DET~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input",
	reg_source_mode => "none",
	feedback_mode => "from_pin")
-- pragma translate_on
PORT MAP (
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => GND,
	ena => VCC,
	padio => ww_DET,
	dataout => \DET~dataout\);

\STP~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input",
	reg_source_mode => "none",
	feedback_mode => "from_pin")
-- pragma translate_on
PORT MAP (
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => GND,
	ena => VCC,
	padio => ww_STP,
	dataout => \STP~dataout\);

\U101|U201|mds_ns_0_0_o2_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_o2_1_\ = !\DET~dataout\ & !\U101|U202|TIM1\ & \STP~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0300",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \DET~dataout\,
	datac => \U101|U202|TIM1\,
	datad => \STP~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_o2_1_\);

\RST~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input",
	reg_source_mode => "none",
	feedback_mode => "from_pin")
-- pragma translate_on
PORT MAP (
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => GND,
	ena => VCC,
	padio => ww_RST,
	dataout => \RST~dataout\);

\U101|U201|mds_ns_0_0_2_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_2_\ = !\U101|U201|mds_ns_0_0_a2_2_\ & (!\RST~dataout\ # !\U101|U201|mds_5_\ # !\U101|U201|mds_ns_0_0_o2_1_\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "1555",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_ns_0_0_a2_2_\,
	datab => \U101|U201|mds_ns_0_0_o2_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_2_\);

\U101|U201|mds_5_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_5_\ = DFFEA(!\U101|U201|mds_ns_0_0_2_\ & \clr~dataout\, GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0F00",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	datac => \U101|U201|mds_ns_0_0_2_\,
	datad => \clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_5_\);

\U101|U201|mds_4_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_4_\ = DFFEA(\U101|U201|mds_srsts_4_~4\ & \STP~dataout\ & \RST~dataout\ & \clr~dataout\, GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "8000",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_srsts_4_~4\,
	datab => \STP~dataout\,
	datac => \RST~dataout\,
	datad => \clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_4_\);

\U101|U202|time_down_un2_clr~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|time_down_un2_clr\ = \DET~dataout\ # !\clr~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "F0FF",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datac => \DET~dataout\,
	datad => \clr~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|time_down_un2_clr\);

\CLK_T~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input",
	reg_source_mode => "none",
	feedback_mode => "from_pin")
-- pragma translate_on
PORT MAP (
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => GND,
	ena => VCC,
	padio => ww_CLK_T,
	dataout => \CLK_T~dataout\);

\U101|U202|TIM1~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIM1\ = DFFEA(\U101|U202|time_down_tim_cnt8lt8\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "AAA8",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|time_down_tim_cnt8lt8\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIM1\);

\U101|U201|mds_ns_i_0_a2_3_0_i_5_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_i_0_a2_3_0_i_5_\ = \U101|U202|TIM1\ # !\STP~dataout\ # !\U101|U201|mds_1_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "F3FF",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U201|mds_1_\,
	datac => \U101|U202|TIM1\,
	datad => \STP~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_i_0_a2_3_0_i_5_\);

\U101|U201|mds_ns_i_0_a2_3_5_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_i_0_a2_3_5_\ = !\U101|U201|mds_ns_i_0_a2_3_0_i_5_\ & (\U101|U202|LIMIT_4_\ # !\U101|U202|limit_down_un4_detlt4_3\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "3303",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U201|mds_ns_i_0_a2_3_0_i_5_\,
	datac => \U101|U202|limit_down_un4_detlt4_3\,
	datad => \U101|U202|LIMIT_4_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_i_0_a2_3_5_\);

\U101|U201|mds_ns_0_0_0_i_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_0_i_1_\ = \U101|U201|mds_ns_0_0_a2_0_1_\ # !\U101|U201|mds_i_7_\ & !\STP~dataout\ & \RST~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "ABAA",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_ns_0_0_a2_0_1_\,
	datab => \U101|U201|mds_i_7_\,
	datac => \STP~dataout\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_0_i_1_\);

\U101|U201|mds_6_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_6_\ = DFFEA(\clr~dataout\ & (\U101|U201|mds_ns_0_0_0_i_1_\ # \U101|U201|mds_5_\ & !\U101|U201|mds_ns_0_0_o2_1_\), GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "88A8",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \clr~dataout\,
	datab => \U101|U201|mds_ns_0_0_0_i_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_ns_0_0_o2_1_\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_6_\);

\STR~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input",
	reg_source_mode => "none",
	feedback_mode => "from_pin")
-- pragma translate_on
PORT MAP (
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => GND,
	ena => VCC,
	padio => ww_STR,
	dataout => \STR~dataout\);

\U101|U201|mds_ns_0_0_7_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_7_\ = \RST~dataout\ & !\U101|U201|mds_0_\ # !\RST~dataout\ & (\U101|U201|mds_i_7_\ # \STR~dataout\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "7774",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_0_\,
	datab => \RST~dataout\,
	datac => \U101|U201|mds_i_7_\,
	datad => \STR~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_7_\);

\U101|U201|mds_0_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_0_\ = DFFEA(!\U101|U201|mds_ns_0_0_7_\ & \clr~dataout\, GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0F00",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	datac => \U101|U201|mds_ns_0_0_7_\,
	datad => \clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_0_\);

\U101|U201|mds_ns_0_0_o2_0_0_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_o2_0_0_\ = !\U101|U201|mds_6_\ & !\U101|U201|mds_2_\ & !\U101|U201|mds_0_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0003",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U201|mds_6_\,
	datac => \U101|U201|mds_2_\,
	datad => \U101|U201|mds_0_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_o2_0_0_\);

\U101|U201|mds_ns_i_0_4_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_i_0_4_\ = \U101|U201|mds_3_\ & \RST~dataout\ # !\U101|U201|mds_3_\ & \U101|U202|TIM1\ & \U101|U201|mds_4_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "E2C0",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIM1\,
	datab => \U101|U201|mds_3_\,
	datac => \RST~dataout\,
	datad => \U101|U201|mds_4_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_i_0_4_\);

\U101|U201|mds_3_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_3_\ = DFFEA(\U101|U201|mds_ns_i_0_4_\ & \clr~dataout\, GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "F000",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	datac => \U101|U201|mds_ns_i_0_4_\,
	datad => \clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_3_\);

\U101|U201|mds_ns_0_0_0_0_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_0_0_~cascout\ = \RST~dataout\ # !\U101|U201|mds_3_\ & (!\U101|U201|mds_5_\ # !\U101|U201|mds_ns_0_0_o2_1_\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "F0F7",
	clock_enable_mode => "false",
	output_mode => "none")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_ns_0_0_o2_1_\,
	datab => \U101|U201|mds_5_\,
	datac => \RST~dataout\,
	datad => \U101|U201|mds_3_\,
	devclrn => devclrn,
	devpor => devpor,
	cascout => \U101|U201|mds_ns_0_0_0_0_~cascout\);

\U101|U201|mds_ns_0_0_2_cand_0_~9_I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_2_cand_0_~9_cascout\ = (\U101|U201|mds_ns_0_0_a2_0_i_0_\ & (\U101|U201|mds_i_7_\ # !\STP~dataout\ # !\STR~dataout\)) & CASCADE(\U101|U201|mds_ns_0_0_0_0_~cascout\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "8AAA",
	clock_enable_mode => "false",
	output_mode => "none")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_ns_0_0_a2_0_i_0_\,
	datab => \U101|U201|mds_i_7_\,
	datac => \STR~dataout\,
	datad => \STP~dataout\,
	cascin => \U101|U201|mds_ns_0_0_0_0_~cascout\,
	devclrn => devclrn,
	devpor => devpor,
	cascout => \U101|U201|mds_ns_0_0_2_cand_0_~9_cascout\);

\U101|U201|mds_i_7_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_i_7_\ = DFFEA((\clr~dataout\ & (\RST~dataout\ # !\U101|U201|mds_ns_i_0_a2_3_5_\ & \U101|U201|mds_ns_0_0_o2_0_0_\)) & CASCADE(\U101|U201|mds_ns_0_0_2_cand_0_~9_cascout\), GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "A2A0",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \clr~dataout\,
	datab => \U101|U201|mds_ns_i_0_a2_3_5_\,
	datac => \RST~dataout\,
	datad => \U101|U201|mds_ns_0_0_o2_0_0_\,
	clk => \CLK~dataout\,
	cascin => \U101|U201|mds_ns_0_0_2_cand_0_~9_cascout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_i_7_\);

\U101|U201|mds_ns_i_0_a2_2_5_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_i_0_a2_2_5_\ = !\U101|U201|mds_1_\ & \U101|U201|mds_i_7_\ & !\RST~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0030",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_i_7_\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_i_0_a2_2_5_\);

\U101|U201|mds_ns_i_0_a2_5_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_i_0_a2_5_\ = !\U101|U201|mds_1_\ & !\U101|U201|mds_2_\ & (\STP~dataout\ # \RST~dataout\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "1110",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_1_\,
	datab => \U101|U201|mds_2_\,
	datac => \STP~dataout\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_i_0_a2_5_\);

\U101|U201|mds_ns_i_0_0_5_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_i_0_0_5_~cascout\ = \U101|U201|mds_2_\ & \RST~dataout\ & (\U101|U201|mds_1_\ # \STR~dataout\) # !\U101|U201|mds_2_\ & (\U101|U201|mds_1_\ # \STR~dataout\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "DDD0",
	clock_enable_mode => "false",
	output_mode => "none")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_2_\,
	datab => \RST~dataout\,
	datac => \U101|U201|mds_1_\,
	datad => \STR~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	cascout => \U101|U201|mds_ns_i_0_0_5_~cascout\);

\U101|U201|mds_2_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_2_\ = DFFEA((\clr~dataout\ & !\U101|U201|mds_ns_i_0_a2_3_5_\ & !\U101|U201|mds_ns_i_0_a2_2_5_\ & !\U101|U201|mds_ns_i_0_a2_5_\) & CASCADE(\U101|U201|mds_ns_i_0_0_5_~cascout\), GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0002",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \clr~dataout\,
	datab => \U101|U201|mds_ns_i_0_a2_3_5_\,
	datac => \U101|U201|mds_ns_i_0_a2_2_5_\,
	datad => \U101|U201|mds_ns_i_0_a2_5_\,
	clk => \CLK~dataout\,
	cascin => \U101|U201|mds_ns_i_0_0_5_~cascout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_2_\);

\U101|U201|mds_ns_0_0_a2_6_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_ns_0_0_a2_6_\ = \U101|U201|mds_2_\ & !\STR~dataout\ & \RST~dataout\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0C00",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U201|mds_2_\,
	datac => \STR~dataout\,
	datad => \RST~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|mds_ns_0_0_a2_6_\);

\U101|U201|mds_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|mds_1_\ = DFFEA(\clr~dataout\ & (\U101|U201|mds_ns_0_0_a2_6_\ # \U101|U201|mds_ns_i_0_a2_3_5_\ & \RST~dataout\), GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "A888",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \clr~dataout\,
	datab => \U101|U201|mds_ns_0_0_a2_6_\,
	datac => \U101|U201|mds_ns_i_0_a2_3_5_\,
	datad => \RST~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|mds_1_\);

\U101|U202|un1_det_1~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_det_1\ = \U101|U201|mds_1_\ & \DET~dataout\ & (\U101|U202|LIMIT_4_\ # !\U101|U202|limit_down_un4_detlt4_3\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "D000",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|limit_down_un4_detlt4_3\,
	datab => \U101|U202|LIMIT_4_\,
	datac => \U101|U201|mds_1_\,
	datad => \DET~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_det_1\);

\U101|U202|LIMIT_i_0_0_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|LIMIT_i_0_0_\ = DFFEA(\U101|U202|LIMIT_i_0_0_\ $ \U101|U202|un1_det_1\, GLOBAL(\CLK~dataout\), GLOBAL(\clr~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0FF0",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	datac => \U101|U202|LIMIT_i_0_0_\,
	datad => \U101|U202|un1_det_1\,
	aclr => \ALT_INV_clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|LIMIT_i_0_0_\);

\U101|U202|un2_lim_cnt_c2~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un2_lim_cnt_c2\ = \U101|U202|LIMIT_i_0_2_\ & \U101|U202|LIMIT_i_0_1_\ & \U101|U202|LIMIT_i_0_0_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "C000",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U202|LIMIT_i_0_2_\,
	datac => \U101|U202|LIMIT_i_0_1_\,
	datad => \U101|U202|LIMIT_i_0_0_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un2_lim_cnt_c2\);

\U101|U202|LIMIT_3_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|LIMIT_3_\ = DFFEA(\U101|U202|un2_lim_cnt_c2\ $ \U101|U202|LIMIT_3_\, GLOBAL(\CLK~dataout\), GLOBAL(\clr~dataout\), , \U101|U202|un1_det_1\, , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0FF0",
	clock_enable_mode => "true",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_det_1\,
	datac => \U101|U202|un2_lim_cnt_c2\,
	datad => \U101|U202|LIMIT_3_\,
	aclr => \ALT_INV_clr~dataout\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|LIMIT_3_\);

\U101|U201|OUTPUT_assignment_1_0~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|OUTPUT_assignment_1_0\ = !\U101|U202|TIM1\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "5554",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIM1\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|OUTPUT_assignment_1_0\);

\U101|U202|TIMER_5_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_5_\ = DFFEA(\U101|U202|un1_timer_add5_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "AAA8",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add5_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_5_\);

\U101|U202|TIMER_i_0_6_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_i_0_6_\ = DFFEA(!\U101|U202|un1_timer_add6_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "5554",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add6_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_i_0_6_\);

\U101|U202|TIMER_i_0_3_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_i_0_3_\ = DFFEA(!\U101|U202|un1_timer_add3_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "5554",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add3_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_i_0_3_\);

\U101|U202|time_down_tim_cnt8lt8_4~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|time_down_tim_cnt8lt8_4\ = !\U101|U202|TIMER_5_\ & \U101|U202|TIMER_i_0_6_\ & \U101|U202|TIMER_i_0_3_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "3000",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	datab => \U101|U202|TIMER_5_\,
	datac => \U101|U202|TIMER_i_0_6_\,
	datad => \U101|U202|TIMER_i_0_3_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|time_down_tim_cnt8lt8_4\);

\U101|U202|TIMER_8_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_8_\ = DFFEA(\U101|U202|un1_timer_add8\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "AAA8",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add8\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_8_\);

\U101|U202|TIMER_7_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_7_\ = DFFEA(\U101|U202|un1_timer_add7_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "AAA8",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add7_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_7_\);

\U101|U202|time_down_tim_cnt8lt8~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|time_down_tim_cnt8lt8\ = \U101|U202|time_down_tim_cnt8lt8_5\ & \U101|U202|time_down_tim_cnt8lt8_4\ & !\U101|U202|TIMER_8_\ & !\U101|U202|TIMER_7_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0008",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|time_down_tim_cnt8lt8_5\,
	datab => \U101|U202|time_down_tim_cnt8lt8_4\,
	datac => \U101|U202|TIMER_8_\,
	datad => \U101|U202|TIMER_7_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|time_down_tim_cnt8lt8\);

\U101|U202|un1_timer_add0_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add0_cry\ = \U101|U202|TIMER_0_\ $ !\U101|U202|time_down_tim_cnt8lt8\
-- \U101|U202|un1_timer_add0_cry~COUT\ = CARRY(\U101|U202|TIMER_0_\ & !\U101|U202|time_down_tim_cnt8lt8\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	packed_mode => "false",
	lut_mask => "9922",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_0_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add0_cry\,
	cout => \U101|U202|un1_timer_add0_cry~COUT\);

\U101|U202|TIMER_0_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_0_\ = DFFEA(\U101|U202|un1_timer_add0_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "AAA8",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add0_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_0_\);

\U101|U202|un1_timer_add1_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add1_cry\ = \U101|U202|TIMER_i_0_1_\ $ \U101|U202|time_down_tim_cnt8lt8\ $ \U101|U202|un1_timer_add0_cry~COUT\
-- \U101|U202|un1_timer_add1_cry~COUT\ = CARRY(\U101|U202|TIMER_i_0_1_\ & !\U101|U202|time_down_tim_cnt8lt8\ & \U101|U202|un1_timer_add0_cry~COUT\ # !\U101|U202|TIMER_i_0_1_\ & (\U101|U202|un1_timer_add0_cry~COUT\ # !\U101|U202|time_down_tim_cnt8lt8\))

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "9671",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_i_0_1_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	cin => \U101|U202|un1_timer_add0_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add1_cry\,
	cout => \U101|U202|un1_timer_add1_cry~COUT\);

\U101|U202|TIMER_i_0_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_i_0_1_\ = DFFEA(!\U101|U202|un1_timer_add1_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "5554",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add1_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_i_0_1_\);

\U101|U202|un1_timer_add2_cry~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|un1_timer_add2_cry\ = \U101|U202|TIMER_2_\ $ \U101|U202|time_down_tim_cnt8lt8\ $ !\U101|U202|un1_timer_add1_cry~COUT\
-- \U101|U202|un1_timer_add2_cry~COUT\ = CARRY(\U101|U202|TIMER_2_\ & (\U101|U202|un1_timer_add1_cry~COUT\ # !\U101|U202|time_down_tim_cnt8lt8\) # !\U101|U202|TIMER_2_\ & !\U101|U202|time_down_tim_cnt8lt8\ & \U101|U202|un1_timer_add1_cry~COUT\)

-- pragma translate_off
GENERIC MAP (
	operation_mode => "arithmetic",
	cin_used => "true",
	packed_mode => "false",
	lut_mask => "69B2",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|TIMER_2_\,
	datab => \U101|U202|time_down_tim_cnt8lt8\,
	cin => \U101|U202|un1_timer_add1_cry~COUT\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U202|un1_timer_add2_cry\,
	cout => \U101|U202|un1_timer_add2_cry~COUT\);

\U101|U202|TIMER_2_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_2_\ = DFFEA(\U101|U202|un1_timer_add2_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "AAA8",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add2_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_2_\);

\U101|U202|TIMER_i_0_4_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U202|TIMER_i_0_4_\ = DFFEA(!\U101|U202|un1_timer_add4_cry\ & (\U101|U201|mds_1_\ # \U101|U201|mds_5_\ # \U101|U201|mds_4_\), GLOBAL(\CLK_T~dataout\), !GLOBAL(\U101|U202|time_down_un2_clr\), , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "5554",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U202|un1_timer_add4_cry\,
	datab => \U101|U201|mds_1_\,
	datac => \U101|U201|mds_5_\,
	datad => \U101|U201|mds_4_\,
	aclr => \U101|U202|time_down_un2_clr\,
	clk => \CLK_T~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U202|TIMER_i_0_4_\);

\U101|U201|Y_0_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|Y_0_\ = DFFEA(\clr~dataout\ & (\U101|U201|mds_4_\ # !\U101|U201|mds_ns_0_0_o2_0_0_\), GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "C0CC",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	datab => \clr~dataout\,
	datac => \U101|U201|mds_4_\,
	datad => \U101|U201|mds_ns_0_0_o2_0_0_\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|Y_0_\);

\U101|U201|Y_0_i_a2_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|Y_0_i_a2_1_\ = !\U101|U201|mds_4_\ & !\U101|U201|mds_0_\ & !\U101|U201|mds_1_\ & !\U101|U201|mds_5_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0001",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_4_\,
	datab => \U101|U201|mds_0_\,
	datac => \U101|U201|mds_1_\,
	datad => \U101|U201|mds_5_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|Y_0_i_a2_1_\);

\U101|U201|Y_1_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|Y_1_\ = DFFEA(\clr~dataout\ & !\U101|U201|Y_0_i_a2_1_\, GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "00F0",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	datac => \clr~dataout\,
	datad => \U101|U201|Y_0_i_a2_1_\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|Y_1_\);

\U101|U201|Y_0_i_a2_2_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|Y_0_i_a2_2_\ = !\U101|U201|mds_2_\ & !\U101|U201|mds_0_\ & !\U101|U201|mds_1_\ & !\U101|U201|mds_3_\

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "0001",
	clock_enable_mode => "false",
	output_mode => "comb_only")
-- pragma translate_on
PORT MAP (
	dataa => \U101|U201|mds_2_\,
	datab => \U101|U201|mds_0_\,
	datac => \U101|U201|mds_1_\,
	datad => \U101|U201|mds_3_\,
	devclrn => devclrn,
	devpor => devpor,
	combout => \U101|U201|Y_0_i_a2_2_\);

\U101|U201|Y_2_~I\ : flex10ke_lcell 
-- Equation(s):
-- \U101|U201|Y_2_\ = DFFEA(\clr~dataout\ & !\U101|U201|Y_0_i_a2_2_\, GLOBAL(\CLK~dataout\), , , , , )

-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	packed_mode => "false",
	lut_mask => "00F0",
	clock_enable_mode => "false",
	output_mode => "reg_only")
-- pragma translate_on
PORT MAP (
	datac => \clr~dataout\,
	datad => \U101|U201|Y_0_i_a2_2_\,
	clk => \CLK~dataout\,
	devclrn => devclrn,
	devpor => devpor,
	regout => \U101|U201|Y_2_\);

\LIMIT[0]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|ALT_INV_LIMIT_i_0_0_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_LIMIT(0));

\LIMIT[1]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|ALT_INV_LIMIT_i_0_1_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_LIMIT(1));

\LIMIT[2]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|ALT_INV_LIMIT_i_0_2_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_LIMIT(2));

\LIMIT[3]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|LIMIT_3_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_LIMIT(3));

\LIMIT[4]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|LIMIT_4_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_LIMIT(4));

\LIMIT[5]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_LIMIT(5));

\OUTPUT~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U201|OUTPUT_assignment_1_0\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_OUTPUT);

\TIMER[0]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|TIMER_0_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(0));

\TIMER[1]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|ALT_INV_TIMER_i_0_1_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(1));

\TIMER[2]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|TIMER_2_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(2));

\TIMER[3]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|ALT_INV_TIMER_i_0_3_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(3));

\TIMER[4]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|ALT_INV_TIMER_i_0_4_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(4));

\TIMER[5]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|TIMER_5_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(5));

\TIMER[6]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|ALT_INV_TIMER_i_0_6_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(6));

\TIMER[7]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|TIMER_7_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(7));

\TIMER[8]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U202|TIMER_8_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(8));

\TIMER[9]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TIMER(9));

\Y[0]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U201|Y_0_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_Y(0));

\Y[1]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U201|Y_1_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_Y(1));

\Y[2]~I\ : flex10ke_io 
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output",
	reg_source_mode => "none",
	feedback_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \U101|U201|Y_2_\,
	devclrn => devclrn,
	devpor => devpor,
	devoe => devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_Y(2));
END structure;


