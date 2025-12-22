////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2006 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: I.31
//  \   \         Application: netgen
//  /   /         Filename: project_synthesis.v
// /___/   /\     Timestamp: Wed May 15 11:00:15 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim project.ngc project_synthesis.v 
// Device	: xc3s100e-4-tq144
// Input file	: project.ngc
// Output file	: C:\Users\Platon\Documents\University\an2_sem2\CA\laboratory\work\MIPS16\netgen\synthesis\project_synthesis.v
// # of Modules	: 1
// Design Name	: project
// Xilinx        : C:\Xilinx
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23
//     Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module project (
  clk, dp, btn, sw, an, cat, led
);
  input clk;
  output dp;
  input [3 : 0] btn;
  input [7 : 0] sw;
  output [3 : 0] an;
  output [6 : 0] cat;
  output [7 : 0] led;
  wire clk_BUFGP_0;
  wire dp_OBUF_1;
  wire zero;
  wire an_3_OBUF_2;
  wire an_2_OBUF_3;
  wire an_1_OBUF_4;
  wire an_0_OBUF_5;
  wire btn_3_IBUF_6;
  wire sw_2_IBUF_7;
  wire sw_1_IBUF_8;
  wire sw_0_IBUF_9;
  wire N2;
  wire N3;
  wire N4;
  wire N5;
  wire N6;
  wire N7;
  wire N8;
  wire N9;
  wire N10;
  wire N12;
  wire cat_0_OBUF_10;
  wire cat_1_OBUF_11;
  wire cat_2_OBUF_12;
  wire cat_3_OBUF_13;
  wire cat_4_OBUF_14;
  wire cat_5_OBUF_15;
  wire cat_6_OBUF_16;
  wire \disp/d<3>1 ;
  wire \disp/d<2>1 ;
  wire \disp/d<1>1 ;
  wire N1;
  wire N212;
  wire \sw<1>_f5_17 ;
  wire N31;
  wire N41;
  wire \sw<1>_f51 ;
  wire \sw<2>_f6_18 ;
  wire N51;
  wire N61;
  wire \sw<1>_f52 ;
  wire N71;
  wire N81;
  wire \sw<1>_f53 ;
  wire \sw<1>2 ;
  wire N91;
  wire N101;
  wire N111;
  wire \sw<1>_f54 ;
  wire \sw<1>3 ;
  wire N1211;
  wire \disp/cnt<14>_f5_19 ;
  wire N131;
  wire N141;
  wire \sw<1>_f55 ;
  wire \sw<1>4 ;
  wire N151;
  wire N161;
  wire N171;
  wire \sw<1>_f56 ;
  wire \sw<1>5 ;
  wire N181;
  wire \disp/cnt<14>_f51 ;
  wire N191;
  wire N201;
  wire \sw<1>_f57 ;
  wire \sw<1>6 ;
  wire N211;
  wire N22;
  wire N23;
  wire \sw<1>_f58 ;
  wire \sw<1>7 ;
  wire N24;
  wire \disp/cnt<14>_f52 ;
  wire N25;
  wire N26;
  wire \sw<1>_f59 ;
  wire \sw<1>8 ;
  wire N27;
  wire N28;
  wire N29;
  wire \sw<1>_f510 ;
  wire \sw<1>9 ;
  wire N30;
  wire \disp/cnt<14>_f53 ;
  wire N311;
  wire N32;
  wire \sw<1>_f511 ;
  wire \sw<1>10 ;
  wire N33;
  wire N34;
  wire N35;
  wire \sw<1>_f512 ;
  wire \sw<1>111_20 ;
  wire N36;
  wire \disp/cnt<14>_f54 ;
  wire N37;
  wire N38;
  wire \sw<1>_f513 ;
  wire \sw<1>12 ;
  wire N39;
  wire N40;
  wire N411;
  wire \sw<1>_f514 ;
  wire \sw<1>13 ;
  wire N42;
  wire \disp/cnt<14>_f55 ;
  wire N43;
  wire N44;
  wire \sw<1>_f515 ;
  wire \sw<1>14 ;
  wire N45;
  wire N46;
  wire N47;
  wire \sw<1>_f516 ;
  wire \sw<1>15_21 ;
  wire N48;
  wire \disp/cnt<14>_f56 ;
  wire \instruction/N6 ;
  wire \instruction/N7 ;
  wire \instruction/N8 ;
  wire \instruction/N21 ;
  wire \instruction/N71 ;
  wire \arith_logic/N5 ;
  wire \arith_logic/N6 ;
  wire \arith_logic/N7 ;
  wire \arith_logic/N8 ;
  wire \arith_logic/N9 ;
  wire \arith_logic/N10 ;
  wire \arith_logic/N11 ;
  wire \arith_logic/N12 ;
  wire \arith_logic/N13 ;
  wire \arith_logic/N14 ;
  wire \arith_logic/N15 ;
  wire \arith_logic/N16 ;
  wire \monopulse/_cmp_eq0000 ;
  wire \disp/cnt<15>_map263 ;
  wire \disp/cnt<15>_map265 ;
  wire \monopulse/_cmp_eq0000_map276 ;
  wire \monopulse/_cmp_eq0000_map279 ;
  wire \monopulse/_cmp_eq0000_map283 ;
  wire \monopulse/_cmp_eq0000_map286 ;
  wire \disp/cnt_1_rt_22 ;
  wire \disp/cnt_2_rt_23 ;
  wire \disp/cnt_3_rt_24 ;
  wire \disp/cnt_4_rt_25 ;
  wire \disp/cnt_5_rt_26 ;
  wire \disp/cnt_6_rt_27 ;
  wire \disp/cnt_7_rt_28 ;
  wire \disp/cnt_8_rt_29 ;
  wire \disp/cnt_9_rt_30 ;
  wire \disp/cnt_10_rt_31 ;
  wire \disp/cnt_11_rt_32 ;
  wire \disp/cnt_12_rt_33 ;
  wire \disp/cnt_13_rt_34 ;
  wire \disp/cnt_14_rt_35 ;
  wire N336;
  wire N337;
  wire N338;
  wire \monopulse/cnt1_1_rt_36 ;
  wire \monopulse/cnt1_2_rt_37 ;
  wire \monopulse/cnt1_3_rt_38 ;
  wire \monopulse/cnt1_4_rt_39 ;
  wire \monopulse/cnt1_5_rt_40 ;
  wire \monopulse/cnt1_6_rt_41 ;
  wire \monopulse/cnt1_7_rt_42 ;
  wire \monopulse/cnt1_8_rt_43 ;
  wire \monopulse/cnt1_9_rt_44 ;
  wire \monopulse/cnt1_10_rt_45 ;
  wire \monopulse/cnt1_11_rt_46 ;
  wire \monopulse/cnt1_12_rt_47 ;
  wire \monopulse/cnt1_13_rt_48 ;
  wire \monopulse/cnt1_14_rt_49 ;
  wire \disp/cnt_15_rt_50 ;
  wire N339;
  wire \monopulse/cnt1_15_rt_51 ;
  wire N340;
  wire N342;
  wire N344;
  wire N346;
  wire N348;
  wire N350;
  wire N352;
  wire N354;
  wire N356;
  wire N358;
  wire N360;
  wire N362;
  wire N364;
  wire N366;
  wire N368;
  wire \rd1<4>_rt_52 ;
  wire \rd1<5>_rt_53 ;
  wire \rd1<6>_rt_54 ;
  wire \rd1<7>_rt_55 ;
  wire \rd1<8>_rt_56 ;
  wire \rd1<9>_rt_57 ;
  wire \rd1<10>_rt_58 ;
  wire \rd1<11>_rt_59 ;
  wire \rd1<12>_rt_60 ;
  wire \rd1<13>_rt_61 ;
  wire \rd1<14>_rt_62 ;
  wire \rd1<15>_rt_63 ;
  wire \arith_logic/Mmux_rez_f5_8_64 ;
  wire \arith_logic/Mmux_rez_f5_7_65 ;
  wire \arith_logic/Mmux_rez_f5_6_66 ;
  wire N434;
  wire N435;
  wire N436;
  wire N437;
  wire N438;
  wire N439;
  wire N440;
  wire N441;
  wire N442;
  wire N443;
  wire N444;
  wire N445;
  wire N446;
  wire N447;
  wire N448;
  wire N449;
  wire N450;
  wire N451;
  wire \step<3>1 ;
  wire N452;
  wire N453;
  wire N454;
  wire N455;
  wire N456;
  wire N457;
  wire N458;
  wire N459;
  wire N460;
  wire N461;
  wire N462;
  wire N463;
  wire N464;
  wire N465;
  wire N466;
  wire N467;
  wire N468;
  wire N469;
  wire N470;
  wire N471;
  wire N472;
  wire N473;
  wire N474;
  wire N475;
  wire N476;
  wire N477;
  wire N478;
  wire N479;
  wire N480;
  wire N481;
  wire N482;
  wire N483;
  wire N484;
  wire N485;
  wire N486;
  wire N487;
  wire N488;
  wire N489;
  wire N490;
  wire N491;
  wire N492;
  wire N493;
  wire N494;
  wire N495;
  wire N496;
  wire NLW_inst_Mram_mem48_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem110_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem210_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem51_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem310_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem49_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem61_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem71_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem81_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem91_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem121_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem101_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem111_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem131_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem141_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem151_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem161_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem191_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem171_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem181_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem201_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem211_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem221_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem231_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem261_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem241_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem251_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem271_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem281_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem291_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem301_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem311_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem331_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem321_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem341_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem351_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem361_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem371_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem401_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem381_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem391_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem411_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem421_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem431_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem441_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem471_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem451_SPO_UNCONNECTED;
  wire NLW_inst_Mram_mem461_SPO_UNCONNECTED;
  wire \NLW_instruction/Mrom__rom000011_DOP<1>_UNCONNECTED ;
  wire \NLW_instruction/Mrom__rom000011_DOP<0>_UNCONNECTED ;
  wire [15 : 0] instr;
  wire [3 : 3] step;
  wire [15 : 0] rez;
  wire [15 : 0] rd2;
  wire [15 : 0] rd1;
  wire [15 : 0] wd;
  wire [3 : 0] \register_file/aux ;
  wire [15 : 0] \memo_ram/do ;
  wire [15 : 0] \disp/cnt ;
  wire [0 : 0] \disp/d ;
  wire [15 : 0] Result;
  wire [14 : 0] \disp/Mcount_cnt_cy ;
  wire [7 : 0] \instruction/brpc ;
  wire [7 : 1] \instruction/_add0000 ;
  wire [7 : 0] \instruction/nextcount ;
  wire [7 : 0] \instruction/count ;
  wire [6 : 0] \instruction/Madd_brpc_cy ;
  wire [0 : 0] \arith_logic/Bfinal ;
  wire [15 : 1] \arith_logic/_addsub0000 ;
  wire [6 : 0] \arith_logic/Mcompar__cmp_eq0000_cy ;
  wire [14 : 0] \arith_logic/Maddsub__addsub0000_cy ;
  wire [3 : 3] \monopulse/q2 ;
  wire [3 : 3] \monopulse/q3 ;
  wire [15 : 0] \monopulse/cnt1 ;
  wire [3 : 3] \monopulse/q1 ;
  wire [15 : 0] \monopulse/Result ;
  wire [14 : 0] \monopulse/Mcount_cnt1_cy ;
  GND XST_GND (
    .G(dp_OBUF_1)
  );
  VCC XST_VCC (
    .P(N2)
  );
  defparam \controler/Mrom_ctrlvec1 .INIT = 16'h0080;
  LUT4 \controler/Mrom_ctrlvec1  (
    .I0(instr[12]),
    .I1(instr[13]),
    .I2(instr[14]),
    .I3(instr[15]),
    .O(N3)
  );
  defparam \controler/Mrom_ctrlvec2 .INIT = 16'h8000;
  LUT4 \controler/Mrom_ctrlvec2  (
    .I0(instr[12]),
    .I1(instr[13]),
    .I2(instr[14]),
    .I3(instr[15]),
    .O(N4)
  );
  defparam \controler/Mrom_ctrlvec3 .INIT = 16'hEFFF;
  LUT4 \controler/Mrom_ctrlvec3  (
    .I0(instr[15]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(instr[14]),
    .O(N5)
  );
  defparam \controler/Mrom_ctrlvec4 .INIT = 16'h0080;
  LUT4 \controler/Mrom_ctrlvec4  (
    .I0(instr[15]),
    .I1(instr[13]),
    .I2(instr[14]),
    .I3(instr[12]),
    .O(N6)
  );
  defparam \controler/Mrom_ctrlvec5 .INIT = 8'h2A;
  LUT3 \controler/Mrom_ctrlvec5  (
    .I0(instr[15]),
    .I1(instr[13]),
    .I2(instr[14]),
    .O(N7)
  );
  defparam \controler/Mrom_ctrlvec6 .INIT = 16'h1FFF;
  LUT4 \controler/Mrom_ctrlvec6  (
    .I0(instr[15]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(instr[14]),
    .O(N8)
  );
  defparam \controler/Mrom_ctrlvec7 .INIT = 16'h2AEA;
  LUT4 \controler/Mrom_ctrlvec7  (
    .I0(instr[15]),
    .I1(instr[14]),
    .I2(instr[13]),
    .I3(instr[12]),
    .O(N9)
  );
  defparam \controler/Mrom_ctrlvec8 .INIT = 16'h6A2A;
  LUT4 \controler/Mrom_ctrlvec8  (
    .I0(instr[12]),
    .I1(instr[13]),
    .I2(instr[14]),
    .I3(instr[15]),
    .O(N10)
  );
  defparam \controler/Mrom_ctrlvec10 .INIT = 8'h2A;
  LUT3 \controler/Mrom_ctrlvec10  (
    .I0(instr[14]),
    .I1(instr[12]),
    .I2(instr[13]),
    .O(N12)
  );
  defparam inst_Mram_mem48.INIT = 16'h002A;
  RAM16X1D inst_Mram_mem48 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[0]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem48_SPO_UNCONNECTED),
    .DPO(rd1[0])
  );
  defparam inst_Mram_mem110.INIT = 16'h004C;
  RAM16X1D inst_Mram_mem110 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[1]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem110_SPO_UNCONNECTED),
    .DPO(rd1[1])
  );
  defparam inst_Mram_mem210.INIT = 16'h0070;
  RAM16X1D inst_Mram_mem210 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[2]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem210_SPO_UNCONNECTED),
    .DPO(rd1[2])
  );
  defparam inst_Mram_mem51.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem51 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[5]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem51_SPO_UNCONNECTED),
    .DPO(rd1[5])
  );
  defparam inst_Mram_mem310.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem310 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[3]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem310_SPO_UNCONNECTED),
    .DPO(rd1[3])
  );
  defparam inst_Mram_mem49.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem49 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[4]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem49_SPO_UNCONNECTED),
    .DPO(rd1[4])
  );
  defparam inst_Mram_mem61.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem61 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[6]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem61_SPO_UNCONNECTED),
    .DPO(rd1[6])
  );
  defparam inst_Mram_mem71.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem71 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[7]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem71_SPO_UNCONNECTED),
    .DPO(rd1[7])
  );
  defparam inst_Mram_mem81.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem81 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[8]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem81_SPO_UNCONNECTED),
    .DPO(rd1[8])
  );
  defparam inst_Mram_mem91.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem91 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[9]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem91_SPO_UNCONNECTED),
    .DPO(rd1[9])
  );
  defparam inst_Mram_mem121.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem121 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[12]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem121_SPO_UNCONNECTED),
    .DPO(rd1[12])
  );
  defparam inst_Mram_mem101.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem101 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[10]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem101_SPO_UNCONNECTED),
    .DPO(rd1[10])
  );
  defparam inst_Mram_mem111.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem111 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[11]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem111_SPO_UNCONNECTED),
    .DPO(rd1[11])
  );
  defparam inst_Mram_mem131.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem131 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[13]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem131_SPO_UNCONNECTED),
    .DPO(rd1[13])
  );
  defparam inst_Mram_mem141.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem141 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[14]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem141_SPO_UNCONNECTED),
    .DPO(rd1[14])
  );
  defparam inst_Mram_mem151.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem151 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[15]),
    .DPRA0(instr[8]),
    .DPRA1(instr[9]),
    .DPRA2(instr[10]),
    .DPRA3(instr[11]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem151_SPO_UNCONNECTED),
    .DPO(rd1[15])
  );
  defparam inst_Mram_mem161.INIT = 16'h002A;
  RAM16X1D inst_Mram_mem161 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[0]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem161_SPO_UNCONNECTED),
    .DPO(rd2[0])
  );
  defparam inst_Mram_mem191.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem191 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[3]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem191_SPO_UNCONNECTED),
    .DPO(rd2[3])
  );
  defparam inst_Mram_mem171.INIT = 16'h004C;
  RAM16X1D inst_Mram_mem171 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[1]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem171_SPO_UNCONNECTED),
    .DPO(rd2[1])
  );
  defparam inst_Mram_mem181.INIT = 16'h0070;
  RAM16X1D inst_Mram_mem181 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[2]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem181_SPO_UNCONNECTED),
    .DPO(rd2[2])
  );
  defparam inst_Mram_mem201.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem201 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[4]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem201_SPO_UNCONNECTED),
    .DPO(rd2[4])
  );
  defparam inst_Mram_mem211.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem211 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[5]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem211_SPO_UNCONNECTED),
    .DPO(rd2[5])
  );
  defparam inst_Mram_mem221.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem221 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[6]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem221_SPO_UNCONNECTED),
    .DPO(rd2[6])
  );
  defparam inst_Mram_mem231.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem231 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[7]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem231_SPO_UNCONNECTED),
    .DPO(rd2[7])
  );
  defparam inst_Mram_mem261.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem261 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[10]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem261_SPO_UNCONNECTED),
    .DPO(rd2[10])
  );
  defparam inst_Mram_mem241.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem241 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[8]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem241_SPO_UNCONNECTED),
    .DPO(rd2[8])
  );
  defparam inst_Mram_mem251.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem251 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[9]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem251_SPO_UNCONNECTED),
    .DPO(rd2[9])
  );
  defparam inst_Mram_mem271.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem271 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[11]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem271_SPO_UNCONNECTED),
    .DPO(rd2[11])
  );
  defparam inst_Mram_mem281.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem281 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[12]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem281_SPO_UNCONNECTED),
    .DPO(rd2[12])
  );
  defparam inst_Mram_mem291.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem291 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[13]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem291_SPO_UNCONNECTED),
    .DPO(rd2[13])
  );
  defparam inst_Mram_mem301.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem301 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[14]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem301_SPO_UNCONNECTED),
    .DPO(rd2[14])
  );
  defparam inst_Mram_mem311.INIT = 16'h0000;
  RAM16X1D inst_Mram_mem311 (
    .A0(\register_file/aux [0]),
    .A1(\register_file/aux [1]),
    .A2(\register_file/aux [2]),
    .A3(\register_file/aux [3]),
    .D(wd[15]),
    .DPRA0(instr[4]),
    .DPRA1(instr[5]),
    .DPRA2(instr[6]),
    .DPRA3(instr[7]),
    .WCLK(step[3]),
    .WE(N7),
    .SPO(NLW_inst_Mram_mem311_SPO_UNCONNECTED),
    .DPO(rd2[15])
  );
  RAM16X1D inst_Mram_mem331 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[1]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem331_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [1])
  );
  RAM16X1D inst_Mram_mem321 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[0]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem321_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [0])
  );
  RAM16X1D inst_Mram_mem341 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[2]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem341_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [2])
  );
  RAM16X1D inst_Mram_mem351 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[3]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem351_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [3])
  );
  RAM16X1D inst_Mram_mem361 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[4]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem361_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [4])
  );
  RAM16X1D inst_Mram_mem371 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[5]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem371_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [5])
  );
  RAM16X1D inst_Mram_mem401 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[8]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem401_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [8])
  );
  RAM16X1D inst_Mram_mem381 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[6]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem381_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [6])
  );
  RAM16X1D inst_Mram_mem391 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[7]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem391_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [7])
  );
  RAM16X1D inst_Mram_mem411 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[9]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem411_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [9])
  );
  RAM16X1D inst_Mram_mem421 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[10]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem421_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [10])
  );
  RAM16X1D inst_Mram_mem431 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[11]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem431_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [11])
  );
  RAM16X1D inst_Mram_mem441 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[12]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem441_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [12])
  );
  RAM16X1D inst_Mram_mem471 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[15]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem471_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [15])
  );
  RAM16X1D inst_Mram_mem451 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[13]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem451_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [13])
  );
  RAM16X1D inst_Mram_mem461 (
    .A0(rez[0]),
    .A1(rez[1]),
    .A2(rez[2]),
    .A3(rez[3]),
    .D(rd2[14]),
    .DPRA0(rez[0]),
    .DPRA1(\arith_logic/Mmux_rez_f5_6_66 ),
    .DPRA2(\arith_logic/Mmux_rez_f5_7_65 ),
    .DPRA3(\arith_logic/Mmux_rez_f5_8_64 ),
    .WCLK(step[3]),
    .WE(N9),
    .SPO(NLW_inst_Mram_mem461_SPO_UNCONNECTED),
    .DPO(\memo_ram/do [14])
  );
  FD \disp/cnt_0  (
    .D(Result[0]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [0])
  );
  FD \disp/cnt_1  (
    .D(Result[1]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [1])
  );
  FD \disp/cnt_2  (
    .D(Result[2]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [2])
  );
  FD \disp/cnt_3  (
    .D(Result[3]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [3])
  );
  FD \disp/cnt_4  (
    .D(Result[4]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [4])
  );
  FD \disp/cnt_5  (
    .D(Result[5]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [5])
  );
  FD \disp/cnt_6  (
    .D(Result[6]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [6])
  );
  FD \disp/cnt_7  (
    .D(Result[7]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [7])
  );
  FD \disp/cnt_8  (
    .D(Result[8]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [8])
  );
  FD \disp/cnt_9  (
    .D(Result[9]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [9])
  );
  FD \disp/cnt_10  (
    .D(Result[10]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [10])
  );
  FD \disp/cnt_11  (
    .D(Result[11]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [11])
  );
  FD \disp/cnt_12  (
    .D(Result[12]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [12])
  );
  FD \disp/cnt_13  (
    .D(Result[13]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [13])
  );
  FD \disp/cnt_14  (
    .D(Result[14]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [14])
  );
  FD \disp/cnt_15  (
    .D(Result[15]),
    .C(clk_BUFGP_0),
    .Q(\disp/cnt [15])
  );
  MUXCY \disp/Mcount_cnt_cy<0>  (
    .CI(dp_OBUF_1),
    .DI(N2),
    .S(Result[0]),
    .O(\disp/Mcount_cnt_cy [0])
  );
  MUXCY \disp/Mcount_cnt_cy<1>  (
    .CI(\disp/Mcount_cnt_cy [0]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_1_rt_22 ),
    .O(\disp/Mcount_cnt_cy [1])
  );
  XORCY \disp/Mcount_cnt_xor<1>  (
    .CI(\disp/Mcount_cnt_cy [0]),
    .LI(\disp/cnt_1_rt_22 ),
    .O(Result[1])
  );
  MUXCY \disp/Mcount_cnt_cy<2>  (
    .CI(\disp/Mcount_cnt_cy [1]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_2_rt_23 ),
    .O(\disp/Mcount_cnt_cy [2])
  );
  XORCY \disp/Mcount_cnt_xor<2>  (
    .CI(\disp/Mcount_cnt_cy [1]),
    .LI(\disp/cnt_2_rt_23 ),
    .O(Result[2])
  );
  MUXCY \disp/Mcount_cnt_cy<3>  (
    .CI(\disp/Mcount_cnt_cy [2]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_3_rt_24 ),
    .O(\disp/Mcount_cnt_cy [3])
  );
  XORCY \disp/Mcount_cnt_xor<3>  (
    .CI(\disp/Mcount_cnt_cy [2]),
    .LI(\disp/cnt_3_rt_24 ),
    .O(Result[3])
  );
  MUXCY \disp/Mcount_cnt_cy<4>  (
    .CI(\disp/Mcount_cnt_cy [3]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_4_rt_25 ),
    .O(\disp/Mcount_cnt_cy [4])
  );
  XORCY \disp/Mcount_cnt_xor<4>  (
    .CI(\disp/Mcount_cnt_cy [3]),
    .LI(\disp/cnt_4_rt_25 ),
    .O(Result[4])
  );
  MUXCY \disp/Mcount_cnt_cy<5>  (
    .CI(\disp/Mcount_cnt_cy [4]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_5_rt_26 ),
    .O(\disp/Mcount_cnt_cy [5])
  );
  XORCY \disp/Mcount_cnt_xor<5>  (
    .CI(\disp/Mcount_cnt_cy [4]),
    .LI(\disp/cnt_5_rt_26 ),
    .O(Result[5])
  );
  MUXCY \disp/Mcount_cnt_cy<6>  (
    .CI(\disp/Mcount_cnt_cy [5]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_6_rt_27 ),
    .O(\disp/Mcount_cnt_cy [6])
  );
  XORCY \disp/Mcount_cnt_xor<6>  (
    .CI(\disp/Mcount_cnt_cy [5]),
    .LI(\disp/cnt_6_rt_27 ),
    .O(Result[6])
  );
  MUXCY \disp/Mcount_cnt_cy<7>  (
    .CI(\disp/Mcount_cnt_cy [6]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_7_rt_28 ),
    .O(\disp/Mcount_cnt_cy [7])
  );
  XORCY \disp/Mcount_cnt_xor<7>  (
    .CI(\disp/Mcount_cnt_cy [6]),
    .LI(\disp/cnt_7_rt_28 ),
    .O(Result[7])
  );
  MUXCY \disp/Mcount_cnt_cy<8>  (
    .CI(\disp/Mcount_cnt_cy [7]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_8_rt_29 ),
    .O(\disp/Mcount_cnt_cy [8])
  );
  XORCY \disp/Mcount_cnt_xor<8>  (
    .CI(\disp/Mcount_cnt_cy [7]),
    .LI(\disp/cnt_8_rt_29 ),
    .O(Result[8])
  );
  MUXCY \disp/Mcount_cnt_cy<9>  (
    .CI(\disp/Mcount_cnt_cy [8]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_9_rt_30 ),
    .O(\disp/Mcount_cnt_cy [9])
  );
  XORCY \disp/Mcount_cnt_xor<9>  (
    .CI(\disp/Mcount_cnt_cy [8]),
    .LI(\disp/cnt_9_rt_30 ),
    .O(Result[9])
  );
  MUXCY \disp/Mcount_cnt_cy<10>  (
    .CI(\disp/Mcount_cnt_cy [9]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_10_rt_31 ),
    .O(\disp/Mcount_cnt_cy [10])
  );
  XORCY \disp/Mcount_cnt_xor<10>  (
    .CI(\disp/Mcount_cnt_cy [9]),
    .LI(\disp/cnt_10_rt_31 ),
    .O(Result[10])
  );
  MUXCY \disp/Mcount_cnt_cy<11>  (
    .CI(\disp/Mcount_cnt_cy [10]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_11_rt_32 ),
    .O(\disp/Mcount_cnt_cy [11])
  );
  XORCY \disp/Mcount_cnt_xor<11>  (
    .CI(\disp/Mcount_cnt_cy [10]),
    .LI(\disp/cnt_11_rt_32 ),
    .O(Result[11])
  );
  MUXCY \disp/Mcount_cnt_cy<12>  (
    .CI(\disp/Mcount_cnt_cy [11]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_12_rt_33 ),
    .O(\disp/Mcount_cnt_cy [12])
  );
  XORCY \disp/Mcount_cnt_xor<12>  (
    .CI(\disp/Mcount_cnt_cy [11]),
    .LI(\disp/cnt_12_rt_33 ),
    .O(Result[12])
  );
  MUXCY \disp/Mcount_cnt_cy<13>  (
    .CI(\disp/Mcount_cnt_cy [12]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_13_rt_34 ),
    .O(\disp/Mcount_cnt_cy [13])
  );
  XORCY \disp/Mcount_cnt_xor<13>  (
    .CI(\disp/Mcount_cnt_cy [12]),
    .LI(\disp/cnt_13_rt_34 ),
    .O(Result[13])
  );
  MUXCY \disp/Mcount_cnt_cy<14>  (
    .CI(\disp/Mcount_cnt_cy [13]),
    .DI(dp_OBUF_1),
    .S(\disp/cnt_14_rt_35 ),
    .O(\disp/Mcount_cnt_cy [14])
  );
  XORCY \disp/Mcount_cnt_xor<14>  (
    .CI(\disp/Mcount_cnt_cy [13]),
    .LI(\disp/cnt_14_rt_35 ),
    .O(Result[14])
  );
  XORCY \disp/Mcount_cnt_xor<15>  (
    .CI(\disp/Mcount_cnt_cy [14]),
    .LI(\disp/cnt_15_rt_50 ),
    .O(Result[15])
  );
  defparam \sw<0> .INIT = 4'hD;
  LUT2 \sw<0>  (
    .I0(zero),
    .I1(sw_0_IBUF_9),
    .O(N1)
  );
  defparam \sw<0>1 .INIT = 8'h1B;
  LUT3 \sw<0>1  (
    .I0(sw_0_IBUF_9),
    .I1(rez[0]),
    .I2(N12),
    .O(N212)
  );
  MUXF5 \sw<1>_f5  (
    .I0(N212),
    .I1(N1),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f5_17 )
  );
  defparam \sw<0>2 .INIT = 8'h1B;
  LUT3 \sw<0>2  (
    .I0(sw_0_IBUF_9),
    .I1(rd2[0]),
    .I2(instr[0]),
    .O(N31)
  );
  defparam \sw<0>3 .INIT = 8'h1B;
  LUT3 \sw<0>3  (
    .I0(sw_0_IBUF_9),
    .I1(instr[0]),
    .I2(rd1[0]),
    .O(N41)
  );
  MUXF5 \sw<1>_f5_0  (
    .I0(N41),
    .I1(N31),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f51 )
  );
  MUXF6 \sw<2>_f6  (
    .I0(\sw<1>_f51 ),
    .I1(\sw<1>_f5_17 ),
    .S(sw_2_IBUF_7),
    .O(\sw<2>_f6_18 )
  );
  defparam \sw<0>4 .INIT = 4'hD;
  LUT2 \sw<0>4  (
    .I0(rd2[4]),
    .I1(sw_0_IBUF_9),
    .O(N51)
  );
  defparam \sw<0>5 .INIT = 8'h1B;
  LUT3 \sw<0>5  (
    .I0(sw_0_IBUF_9),
    .I1(instr[4]),
    .I2(rd1[4]),
    .O(N61)
  );
  MUXF5 \sw<1>_f5_1  (
    .I0(N61),
    .I1(N51),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f52 )
  );
  defparam \sw<0>6 .INIT = 4'hD;
  LUT2 \sw<0>6  (
    .I0(rd2[12]),
    .I1(sw_0_IBUF_9),
    .O(N71)
  );
  defparam \sw<0>7 .INIT = 8'h1B;
  LUT3 \sw<0>7  (
    .I0(sw_0_IBUF_9),
    .I1(instr[12]),
    .I2(rd1[12]),
    .O(N81)
  );
  MUXF5 \sw<1>_f5_2  (
    .I0(N81),
    .I1(N71),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f53 )
  );
  defparam \sw<2>1 .INIT = 8'hE4;
  LUT3 \sw<2>1  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f53 ),
    .I2(\sw<1>2 ),
    .O(N91)
  );
  defparam \sw<0>8 .INIT = 4'hD;
  LUT2 \sw<0>8  (
    .I0(rd2[8]),
    .I1(sw_0_IBUF_9),
    .O(N101)
  );
  defparam \sw<0>9 .INIT = 8'h1B;
  LUT3 \sw<0>9  (
    .I0(sw_0_IBUF_9),
    .I1(instr[8]),
    .I2(rd1[8]),
    .O(N111)
  );
  MUXF5 \sw<1>_f5_3  (
    .I0(N111),
    .I1(N101),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f54 )
  );
  defparam \sw<2>2 .INIT = 8'hE4;
  LUT3 \sw<2>2  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f54 ),
    .I2(\sw<1>3 ),
    .O(N1211)
  );
  MUXF5 \disp/cnt<14>_f5  (
    .I0(N1211),
    .I1(N91),
    .S(\disp/cnt [14]),
    .O(\disp/cnt<14>_f5_19 )
  );
  defparam \sw<0>10 .INIT = 4'hD;
  LUT2 \sw<0>10  (
    .I0(rd2[13]),
    .I1(sw_0_IBUF_9),
    .O(N131)
  );
  defparam \sw<0>11 .INIT = 8'h1B;
  LUT3 \sw<0>11  (
    .I0(sw_0_IBUF_9),
    .I1(instr[13]),
    .I2(rd1[13]),
    .O(N141)
  );
  MUXF5 \sw<1>_f5_4  (
    .I0(N141),
    .I1(N131),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f55 )
  );
  defparam \sw<2>3 .INIT = 8'hE4;
  LUT3 \sw<2>3  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f55 ),
    .I2(\sw<1>4 ),
    .O(N151)
  );
  defparam \sw<0>12 .INIT = 4'hD;
  LUT2 \sw<0>12  (
    .I0(rd2[9]),
    .I1(sw_0_IBUF_9),
    .O(N161)
  );
  defparam \sw<0>13 .INIT = 8'h1B;
  LUT3 \sw<0>13  (
    .I0(sw_0_IBUF_9),
    .I1(instr[9]),
    .I2(rd1[9]),
    .O(N171)
  );
  MUXF5 \sw<1>_f5_5  (
    .I0(N171),
    .I1(N161),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f56 )
  );
  defparam \sw<2>4 .INIT = 8'hE4;
  LUT3 \sw<2>4  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f56 ),
    .I2(\sw<1>5 ),
    .O(N181)
  );
  MUXF5 \disp/cnt<14>_f5_0  (
    .I0(N181),
    .I1(N151),
    .S(\disp/cnt [14]),
    .O(\disp/cnt<14>_f51 )
  );
  defparam \sw<0>14 .INIT = 4'hD;
  LUT2 \sw<0>14  (
    .I0(rd2[5]),
    .I1(sw_0_IBUF_9),
    .O(N191)
  );
  defparam \sw<0>15 .INIT = 8'h1B;
  LUT3 \sw<0>15  (
    .I0(sw_0_IBUF_9),
    .I1(instr[5]),
    .I2(rd1[5]),
    .O(N201)
  );
  MUXF5 \sw<1>_f5_6  (
    .I0(N201),
    .I1(N191),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f57 )
  );
  defparam \sw<2>5 .INIT = 8'hE4;
  LUT3 \sw<2>5  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f57 ),
    .I2(\sw<1>6 ),
    .O(N211)
  );
  defparam \sw<0>16 .INIT = 8'h1B;
  LUT3 \sw<0>16  (
    .I0(sw_0_IBUF_9),
    .I1(rd2[1]),
    .I2(instr[1]),
    .O(N22)
  );
  defparam \sw<0>17 .INIT = 8'h1B;
  LUT3 \sw<0>17  (
    .I0(sw_0_IBUF_9),
    .I1(instr[1]),
    .I2(rd1[1]),
    .O(N23)
  );
  MUXF5 \sw<1>_f5_7  (
    .I0(N23),
    .I1(N22),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f58 )
  );
  defparam \sw<2>6 .INIT = 8'hE4;
  LUT3 \sw<2>6  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f58 ),
    .I2(\sw<1>7 ),
    .O(N24)
  );
  MUXF5 \disp/cnt<14>_f5_1  (
    .I0(N24),
    .I1(N211),
    .S(\disp/cnt [14]),
    .O(\disp/cnt<14>_f52 )
  );
  MUXF6 \disp/Mmux_d_f6  (
    .I0(\disp/cnt<14>_f52 ),
    .I1(\disp/cnt<14>_f51 ),
    .S(\disp/cnt [15]),
    .O(\disp/d<1>1 )
  );
  defparam \sw<0>18 .INIT = 4'hD;
  LUT2 \sw<0>18  (
    .I0(rd2[14]),
    .I1(sw_0_IBUF_9),
    .O(N25)
  );
  defparam \sw<0>19 .INIT = 8'h1B;
  LUT3 \sw<0>19  (
    .I0(sw_0_IBUF_9),
    .I1(instr[14]),
    .I2(rd1[14]),
    .O(N26)
  );
  MUXF5 \sw<1>_f5_8  (
    .I0(N26),
    .I1(N25),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f59 )
  );
  defparam \sw<2>7 .INIT = 8'hE4;
  LUT3 \sw<2>7  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f59 ),
    .I2(\sw<1>8 ),
    .O(N27)
  );
  defparam \sw<0>20 .INIT = 4'hD;
  LUT2 \sw<0>20  (
    .I0(rd2[10]),
    .I1(sw_0_IBUF_9),
    .O(N28)
  );
  defparam \sw<0>21 .INIT = 8'h1B;
  LUT3 \sw<0>21  (
    .I0(sw_0_IBUF_9),
    .I1(instr[10]),
    .I2(rd1[10]),
    .O(N29)
  );
  MUXF5 \sw<1>_f5_9  (
    .I0(N29),
    .I1(N28),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f510 )
  );
  defparam \sw<2>8 .INIT = 8'hE4;
  LUT3 \sw<2>8  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f510 ),
    .I2(\sw<1>9 ),
    .O(N30)
  );
  MUXF5 \disp/cnt<14>_f5_2  (
    .I0(N30),
    .I1(N27),
    .S(\disp/cnt [14]),
    .O(\disp/cnt<14>_f53 )
  );
  defparam \sw<0>22 .INIT = 4'hD;
  LUT2 \sw<0>22  (
    .I0(rd2[6]),
    .I1(sw_0_IBUF_9),
    .O(N311)
  );
  defparam \sw<0>23 .INIT = 8'h1B;
  LUT3 \sw<0>23  (
    .I0(sw_0_IBUF_9),
    .I1(instr[6]),
    .I2(rd1[6]),
    .O(N32)
  );
  MUXF5 \sw<1>_f5_10  (
    .I0(N32),
    .I1(N311),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f511 )
  );
  defparam \sw<2>9 .INIT = 8'hE4;
  LUT3 \sw<2>9  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f511 ),
    .I2(\sw<1>10 ),
    .O(N33)
  );
  defparam \sw<0>24 .INIT = 8'h1B;
  LUT3 \sw<0>24  (
    .I0(sw_0_IBUF_9),
    .I1(rd2[2]),
    .I2(instr[2]),
    .O(N34)
  );
  defparam \sw<0>25 .INIT = 8'h1B;
  LUT3 \sw<0>25  (
    .I0(sw_0_IBUF_9),
    .I1(instr[2]),
    .I2(rd1[2]),
    .O(N35)
  );
  MUXF5 \sw<1>_f5_11  (
    .I0(N35),
    .I1(N34),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f512 )
  );
  defparam \sw<2>10 .INIT = 8'hE4;
  LUT3 \sw<2>10  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f512 ),
    .I2(\sw<1>111_20 ),
    .O(N36)
  );
  MUXF5 \disp/cnt<14>_f5_3  (
    .I0(N36),
    .I1(N33),
    .S(\disp/cnt [14]),
    .O(\disp/cnt<14>_f54 )
  );
  MUXF6 \disp/Mmux_d_f6_0  (
    .I0(\disp/cnt<14>_f54 ),
    .I1(\disp/cnt<14>_f53 ),
    .S(\disp/cnt [15]),
    .O(\disp/d<2>1 )
  );
  defparam \sw<0>26 .INIT = 4'hD;
  LUT2 \sw<0>26  (
    .I0(rd2[15]),
    .I1(sw_0_IBUF_9),
    .O(N37)
  );
  defparam \sw<0>27 .INIT = 8'h1B;
  LUT3 \sw<0>27  (
    .I0(sw_0_IBUF_9),
    .I1(instr[15]),
    .I2(rd1[15]),
    .O(N38)
  );
  MUXF5 \sw<1>_f5_12  (
    .I0(N38),
    .I1(N37),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f513 )
  );
  defparam \sw<2>11 .INIT = 8'hE4;
  LUT3 \sw<2>11  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f513 ),
    .I2(\sw<1>12 ),
    .O(N39)
  );
  defparam \sw<0>28 .INIT = 4'hD;
  LUT2 \sw<0>28  (
    .I0(rd2[11]),
    .I1(sw_0_IBUF_9),
    .O(N40)
  );
  defparam \sw<0>29 .INIT = 8'h1B;
  LUT3 \sw<0>29  (
    .I0(sw_0_IBUF_9),
    .I1(instr[11]),
    .I2(rd1[11]),
    .O(N411)
  );
  MUXF5 \sw<1>_f5_13  (
    .I0(N411),
    .I1(N40),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f514 )
  );
  defparam \sw<2>12 .INIT = 8'hE4;
  LUT3 \sw<2>12  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f514 ),
    .I2(\sw<1>13 ),
    .O(N42)
  );
  MUXF5 \disp/cnt<14>_f5_4  (
    .I0(N42),
    .I1(N39),
    .S(\disp/cnt [14]),
    .O(\disp/cnt<14>_f55 )
  );
  defparam \sw<0>30 .INIT = 4'hD;
  LUT2 \sw<0>30  (
    .I0(rd2[7]),
    .I1(sw_0_IBUF_9),
    .O(N43)
  );
  defparam \sw<0>31 .INIT = 8'h1B;
  LUT3 \sw<0>31  (
    .I0(sw_0_IBUF_9),
    .I1(instr[7]),
    .I2(rd1[7]),
    .O(N44)
  );
  MUXF5 \sw<1>_f5_14  (
    .I0(N44),
    .I1(N43),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f515 )
  );
  defparam \sw<2>13 .INIT = 8'hE4;
  LUT3 \sw<2>13  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f515 ),
    .I2(\sw<1>14 ),
    .O(N45)
  );
  defparam \sw<0>32 .INIT = 8'h1B;
  LUT3 \sw<0>32  (
    .I0(sw_0_IBUF_9),
    .I1(rd2[3]),
    .I2(instr[3]),
    .O(N46)
  );
  defparam \sw<0>33 .INIT = 8'h1B;
  LUT3 \sw<0>33  (
    .I0(sw_0_IBUF_9),
    .I1(instr[3]),
    .I2(rd1[3]),
    .O(N47)
  );
  MUXF5 \sw<1>_f5_15  (
    .I0(N47),
    .I1(N46),
    .S(sw_1_IBUF_8),
    .O(\sw<1>_f516 )
  );
  defparam \sw<2>14 .INIT = 8'hE4;
  LUT3 \sw<2>14  (
    .I0(sw_2_IBUF_7),
    .I1(\sw<1>_f516 ),
    .I2(\sw<1>15_21 ),
    .O(N48)
  );
  MUXF5 \disp/cnt<14>_f5_5  (
    .I0(N48),
    .I1(N45),
    .S(\disp/cnt [14]),
    .O(\disp/cnt<14>_f56 )
  );
  MUXF6 \disp/Mmux_d_f6_1  (
    .I0(\disp/cnt<14>_f56 ),
    .I1(\disp/cnt<14>_f55 ),
    .S(\disp/cnt [15]),
    .O(\disp/d<3>1 )
  );
  FD \instruction/count_0  (
    .D(\instruction/nextcount [0]),
    .C(step[3]),
    .Q(\instruction/count [0])
  );
  FD \instruction/count_1  (
    .D(\instruction/nextcount [1]),
    .C(step[3]),
    .Q(\instruction/count [1])
  );
  FD \instruction/count_2  (
    .D(\instruction/nextcount [2]),
    .C(step[3]),
    .Q(\instruction/count [2])
  );
  FD \instruction/count_3  (
    .D(\instruction/nextcount [3]),
    .C(step[3]),
    .Q(\instruction/count [3])
  );
  FD \instruction/count_4  (
    .D(\instruction/nextcount [4]),
    .C(step[3]),
    .Q(\instruction/count [4])
  );
  FD \instruction/count_5  (
    .D(\instruction/nextcount [5]),
    .C(step[3]),
    .Q(\instruction/count [5])
  );
  FD \instruction/count_6  (
    .D(\instruction/nextcount [6]),
    .C(step[3]),
    .Q(\instruction/count [6])
  );
  FD \instruction/count_7  (
    .D(\instruction/nextcount [7]),
    .C(step[3]),
    .Q(\instruction/count [7])
  );
  defparam \instruction/Mrom__rom000011 .WRITE_MODE = "WRITE_FIRST";
  defparam \instruction/Mrom__rom000011 .INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_00 = 256'h7230D207C207B207A20792008202611051104110223031202110110000000000;
  defparam \instruction/Mrom__rom000011 .INIT_01 = 256'h00000000000000000000000000000000000000000111F0007230E2116103F000;
  defparam \instruction/Mrom__rom000011 .INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam \instruction/Mrom__rom000011 .INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  RAMB16_S18 \instruction/Mrom__rom000011  (
    .CLK(step[3]),
    .EN(N2),
    .SSR(dp_OBUF_1),
    .WE(dp_OBUF_1),
    .ADDR({dp_OBUF_1, dp_OBUF_1, \instruction/nextcount [7], \instruction/nextcount [6], \instruction/nextcount [5], \instruction/nextcount [4], 
\instruction/nextcount [3], \instruction/nextcount [2], \instruction/nextcount [1], \instruction/nextcount [0]}),
    .DI({dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1
, dp_OBUF_1, dp_OBUF_1, dp_OBUF_1}),
    .DIP({dp_OBUF_1, dp_OBUF_1}),
    .DO({instr[15], instr[14], instr[13], instr[12], instr[11], instr[10], instr[9], instr[8], instr[7], instr[6], instr[5], instr[4], instr[3], 
instr[2], instr[1], instr[0]}),
    .DOP({\NLW_instruction/Mrom__rom000011_DOP<1>_UNCONNECTED , \NLW_instruction/Mrom__rom000011_DOP<0>_UNCONNECTED })
  );
  MUXCY \instruction/Madd_brpc_cy<0>  (
    .CI(dp_OBUF_1),
    .DI(instr[0]),
    .S(\instruction/brpc [0]),
    .O(\instruction/Madd_brpc_cy [0])
  );
  MUXCY \instruction/Madd_brpc_cy<1>  (
    .CI(\instruction/Madd_brpc_cy [0]),
    .DI(instr[1]),
    .S(\instruction/N6 ),
    .O(\instruction/Madd_brpc_cy [1])
  );
  XORCY \instruction/Madd_brpc_xor<1>  (
    .CI(\instruction/Madd_brpc_cy [0]),
    .LI(\instruction/N6 ),
    .O(\instruction/brpc [1])
  );
  MUXCY \instruction/Madd_brpc_cy<2>  (
    .CI(\instruction/Madd_brpc_cy [1]),
    .DI(instr[2]),
    .S(\instruction/N7 ),
    .O(\instruction/Madd_brpc_cy [2])
  );
  XORCY \instruction/Madd_brpc_xor<2>  (
    .CI(\instruction/Madd_brpc_cy [1]),
    .LI(\instruction/N7 ),
    .O(\instruction/brpc [2])
  );
  defparam \instruction/Madd_brpc_lut<3> .INIT = 4'h6;
  LUT2 \instruction/Madd_brpc_lut<3>  (
    .I0(instr[3]),
    .I1(\instruction/_add0000 [3]),
    .O(\instruction/N8 )
  );
  MUXCY \instruction/Madd_brpc_cy<3>  (
    .CI(\instruction/Madd_brpc_cy [2]),
    .DI(instr[3]),
    .S(\instruction/N8 ),
    .O(\instruction/Madd_brpc_cy [3])
  );
  XORCY \instruction/Madd_brpc_xor<3>  (
    .CI(\instruction/Madd_brpc_cy [2]),
    .LI(\instruction/N8 ),
    .O(\instruction/brpc [3])
  );
  MUXCY \instruction/Madd_brpc_cy<4>  (
    .CI(\instruction/Madd_brpc_cy [3]),
    .DI(dp_OBUF_1),
    .S(N336),
    .O(\instruction/Madd_brpc_cy [4])
  );
  XORCY \instruction/Madd_brpc_xor<4>  (
    .CI(\instruction/Madd_brpc_cy [3]),
    .LI(N336),
    .O(\instruction/brpc [4])
  );
  MUXCY \instruction/Madd_brpc_cy<5>  (
    .CI(\instruction/Madd_brpc_cy [4]),
    .DI(dp_OBUF_1),
    .S(N337),
    .O(\instruction/Madd_brpc_cy [5])
  );
  XORCY \instruction/Madd_brpc_xor<5>  (
    .CI(\instruction/Madd_brpc_cy [4]),
    .LI(N337),
    .O(\instruction/brpc [5])
  );
  MUXCY \instruction/Madd_brpc_cy<6>  (
    .CI(\instruction/Madd_brpc_cy [5]),
    .DI(dp_OBUF_1),
    .S(N338),
    .O(\instruction/Madd_brpc_cy [6])
  );
  XORCY \instruction/Madd_brpc_xor<6>  (
    .CI(\instruction/Madd_brpc_cy [5]),
    .LI(N338),
    .O(\instruction/brpc [6])
  );
  XORCY \instruction/Madd_brpc_xor<7>  (
    .CI(\instruction/Madd_brpc_cy [6]),
    .LI(N339),
    .O(\instruction/brpc [7])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<0> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<0>  (
    .I0(rd1[0]),
    .I1(rd2[0]),
    .I2(rd1[1]),
    .I3(rd2[1]),
    .O(\arith_logic/N5 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<0>  (
    .CI(N2),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N5 ),
    .O(\arith_logic/Mcompar__cmp_eq0000_cy [0])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<1> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<1>  (
    .I0(rd1[2]),
    .I1(rd2[2]),
    .I2(rd1[3]),
    .I3(rd2[3]),
    .O(\arith_logic/N6 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<1>  (
    .CI(\arith_logic/Mcompar__cmp_eq0000_cy [0]),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N6 ),
    .O(\arith_logic/Mcompar__cmp_eq0000_cy [1])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<2> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<2>  (
    .I0(rd1[4]),
    .I1(rd2[4]),
    .I2(rd1[5]),
    .I3(rd2[5]),
    .O(\arith_logic/N7 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<2>  (
    .CI(\arith_logic/Mcompar__cmp_eq0000_cy [1]),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N7 ),
    .O(\arith_logic/Mcompar__cmp_eq0000_cy [2])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<3> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<3>  (
    .I0(rd1[6]),
    .I1(rd2[6]),
    .I2(rd1[7]),
    .I3(rd2[7]),
    .O(\arith_logic/N8 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<3>  (
    .CI(\arith_logic/Mcompar__cmp_eq0000_cy [2]),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N8 ),
    .O(\arith_logic/Mcompar__cmp_eq0000_cy [3])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<4> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<4>  (
    .I0(rd1[8]),
    .I1(rd2[8]),
    .I2(rd1[9]),
    .I3(rd2[9]),
    .O(\arith_logic/N9 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<4>  (
    .CI(\arith_logic/Mcompar__cmp_eq0000_cy [3]),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N9 ),
    .O(\arith_logic/Mcompar__cmp_eq0000_cy [4])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<5> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<5>  (
    .I0(rd1[10]),
    .I1(rd2[10]),
    .I2(rd1[11]),
    .I3(rd2[11]),
    .O(\arith_logic/N10 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<5>  (
    .CI(\arith_logic/Mcompar__cmp_eq0000_cy [4]),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N10 ),
    .O(\arith_logic/Mcompar__cmp_eq0000_cy [5])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<6> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<6>  (
    .I0(rd1[12]),
    .I1(rd2[12]),
    .I2(rd1[13]),
    .I3(rd2[13]),
    .O(\arith_logic/N11 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<6>  (
    .CI(\arith_logic/Mcompar__cmp_eq0000_cy [5]),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N11 ),
    .O(\arith_logic/Mcompar__cmp_eq0000_cy [6])
  );
  defparam \arith_logic/Mcompar__cmp_eq0000_lut<7> .INIT = 16'h9009;
  LUT4 \arith_logic/Mcompar__cmp_eq0000_lut<7>  (
    .I0(rd1[14]),
    .I1(rd2[14]),
    .I2(rd1[15]),
    .I3(rd2[15]),
    .O(\arith_logic/N12 )
  );
  MUXCY \arith_logic/Mcompar__cmp_eq0000_cy<7>  (
    .CI(\arith_logic/Mcompar__cmp_eq0000_cy [6]),
    .DI(dp_OBUF_1),
    .S(\arith_logic/N12 ),
    .O(zero)
  );
  defparam \arith_logic/Maddsub__addsub0000_lut<0> .INIT = 8'h96;
  LUT3 \arith_logic/Maddsub__addsub0000_lut<0>  (
    .I0(dp_OBUF_1),
    .I1(instr[0]),
    .I2(rd1[0]),
    .O(\arith_logic/N13 )
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<0>  (
    .CI(dp_OBUF_1),
    .DI(rd1[0]),
    .S(\arith_logic/N13 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [0])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<1>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [0]),
    .DI(rd1[1]),
    .S(\arith_logic/N14 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [1])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<1>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [0]),
    .LI(\arith_logic/N14 ),
    .O(\arith_logic/_addsub0000 [1])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<2>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [1]),
    .DI(rd1[2]),
    .S(\arith_logic/N15 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [2])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<2>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [1]),
    .LI(\arith_logic/N15 ),
    .O(\arith_logic/_addsub0000 [2])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<3>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [2]),
    .DI(rd1[3]),
    .S(\arith_logic/N16 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [3])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<3>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [2]),
    .LI(\arith_logic/N16 ),
    .O(\arith_logic/_addsub0000 [3])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<4>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [3]),
    .DI(dp_OBUF_1),
    .S(\rd1<4>_rt_52 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [4])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<4>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [3]),
    .LI(\rd1<4>_rt_52 ),
    .O(\arith_logic/_addsub0000 [4])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<5>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [4]),
    .DI(dp_OBUF_1),
    .S(\rd1<5>_rt_53 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [5])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<5>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [4]),
    .LI(\rd1<5>_rt_53 ),
    .O(\arith_logic/_addsub0000 [5])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<6>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [5]),
    .DI(dp_OBUF_1),
    .S(\rd1<6>_rt_54 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [6])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<6>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [5]),
    .LI(\rd1<6>_rt_54 ),
    .O(\arith_logic/_addsub0000 [6])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<7>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [6]),
    .DI(dp_OBUF_1),
    .S(\rd1<7>_rt_55 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [7])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<7>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [6]),
    .LI(\rd1<7>_rt_55 ),
    .O(\arith_logic/_addsub0000 [7])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<8>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [7]),
    .DI(dp_OBUF_1),
    .S(\rd1<8>_rt_56 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [8])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<8>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [7]),
    .LI(\rd1<8>_rt_56 ),
    .O(\arith_logic/_addsub0000 [8])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<9>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [8]),
    .DI(dp_OBUF_1),
    .S(\rd1<9>_rt_57 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [9])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<9>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [8]),
    .LI(\rd1<9>_rt_57 ),
    .O(\arith_logic/_addsub0000 [9])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<10>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [9]),
    .DI(dp_OBUF_1),
    .S(\rd1<10>_rt_58 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [10])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<10>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [9]),
    .LI(\rd1<10>_rt_58 ),
    .O(\arith_logic/_addsub0000 [10])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<11>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [10]),
    .DI(dp_OBUF_1),
    .S(\rd1<11>_rt_59 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [11])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<11>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [10]),
    .LI(\rd1<11>_rt_59 ),
    .O(\arith_logic/_addsub0000 [11])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<12>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [11]),
    .DI(dp_OBUF_1),
    .S(\rd1<12>_rt_60 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [12])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<12>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [11]),
    .LI(\rd1<12>_rt_60 ),
    .O(\arith_logic/_addsub0000 [12])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<13>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [12]),
    .DI(dp_OBUF_1),
    .S(\rd1<13>_rt_61 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [13])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<13>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [12]),
    .LI(\rd1<13>_rt_61 ),
    .O(\arith_logic/_addsub0000 [13])
  );
  MUXCY \arith_logic/Maddsub__addsub0000_cy<14>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [13]),
    .DI(dp_OBUF_1),
    .S(\rd1<14>_rt_62 ),
    .O(\arith_logic/Maddsub__addsub0000_cy [14])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<14>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [13]),
    .LI(\rd1<14>_rt_62 ),
    .O(\arith_logic/_addsub0000 [14])
  );
  XORCY \arith_logic/Maddsub__addsub0000_xor<15>  (
    .CI(\arith_logic/Maddsub__addsub0000_cy [14]),
    .LI(\rd1<15>_rt_63 ),
    .O(\arith_logic/_addsub0000 [15])
  );
  FDE \monopulse/q1_3  (
    .D(btn_3_IBUF_6),
    .CE(\monopulse/_cmp_eq0000 ),
    .C(clk_BUFGP_0),
    .Q(\monopulse/q1 [3])
  );
  FD \monopulse/q2_3  (
    .D(\monopulse/q1 [3]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/q2 [3])
  );
  FD \monopulse/q3_3  (
    .D(\monopulse/q2 [3]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/q3 [3])
  );
  FD \monopulse/cnt1_0  (
    .D(\monopulse/Result [0]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [0])
  );
  FD \monopulse/cnt1_1  (
    .D(\monopulse/Result [1]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [1])
  );
  FD \monopulse/cnt1_2  (
    .D(\monopulse/Result [2]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [2])
  );
  FD \monopulse/cnt1_3  (
    .D(\monopulse/Result [3]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [3])
  );
  FD \monopulse/cnt1_4  (
    .D(\monopulse/Result [4]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [4])
  );
  FD \monopulse/cnt1_5  (
    .D(\monopulse/Result [5]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [5])
  );
  FD \monopulse/cnt1_6  (
    .D(\monopulse/Result [6]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [6])
  );
  FD \monopulse/cnt1_7  (
    .D(\monopulse/Result [7]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [7])
  );
  FD \monopulse/cnt1_8  (
    .D(\monopulse/Result [8]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [8])
  );
  FD \monopulse/cnt1_9  (
    .D(\monopulse/Result [9]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [9])
  );
  FD \monopulse/cnt1_10  (
    .D(\monopulse/Result [10]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [10])
  );
  FD \monopulse/cnt1_11  (
    .D(\monopulse/Result [11]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [11])
  );
  FD \monopulse/cnt1_12  (
    .D(\monopulse/Result [12]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [12])
  );
  FD \monopulse/cnt1_13  (
    .D(\monopulse/Result [13]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [13])
  );
  FD \monopulse/cnt1_14  (
    .D(\monopulse/Result [14]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [14])
  );
  FD \monopulse/cnt1_15  (
    .D(\monopulse/Result [15]),
    .C(clk_BUFGP_0),
    .Q(\monopulse/cnt1 [15])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<0>  (
    .CI(dp_OBUF_1),
    .DI(N2),
    .S(\monopulse/Result [0]),
    .O(\monopulse/Mcount_cnt1_cy [0])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<1>  (
    .CI(\monopulse/Mcount_cnt1_cy [0]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_1_rt_36 ),
    .O(\monopulse/Mcount_cnt1_cy [1])
  );
  XORCY \monopulse/Mcount_cnt1_xor<1>  (
    .CI(\monopulse/Mcount_cnt1_cy [0]),
    .LI(\monopulse/cnt1_1_rt_36 ),
    .O(\monopulse/Result [1])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<2>  (
    .CI(\monopulse/Mcount_cnt1_cy [1]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_2_rt_37 ),
    .O(\monopulse/Mcount_cnt1_cy [2])
  );
  XORCY \monopulse/Mcount_cnt1_xor<2>  (
    .CI(\monopulse/Mcount_cnt1_cy [1]),
    .LI(\monopulse/cnt1_2_rt_37 ),
    .O(\monopulse/Result [2])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<3>  (
    .CI(\monopulse/Mcount_cnt1_cy [2]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_3_rt_38 ),
    .O(\monopulse/Mcount_cnt1_cy [3])
  );
  XORCY \monopulse/Mcount_cnt1_xor<3>  (
    .CI(\monopulse/Mcount_cnt1_cy [2]),
    .LI(\monopulse/cnt1_3_rt_38 ),
    .O(\monopulse/Result [3])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<4>  (
    .CI(\monopulse/Mcount_cnt1_cy [3]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_4_rt_39 ),
    .O(\monopulse/Mcount_cnt1_cy [4])
  );
  XORCY \monopulse/Mcount_cnt1_xor<4>  (
    .CI(\monopulse/Mcount_cnt1_cy [3]),
    .LI(\monopulse/cnt1_4_rt_39 ),
    .O(\monopulse/Result [4])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<5>  (
    .CI(\monopulse/Mcount_cnt1_cy [4]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_5_rt_40 ),
    .O(\monopulse/Mcount_cnt1_cy [5])
  );
  XORCY \monopulse/Mcount_cnt1_xor<5>  (
    .CI(\monopulse/Mcount_cnt1_cy [4]),
    .LI(\monopulse/cnt1_5_rt_40 ),
    .O(\monopulse/Result [5])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<6>  (
    .CI(\monopulse/Mcount_cnt1_cy [5]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_6_rt_41 ),
    .O(\monopulse/Mcount_cnt1_cy [6])
  );
  XORCY \monopulse/Mcount_cnt1_xor<6>  (
    .CI(\monopulse/Mcount_cnt1_cy [5]),
    .LI(\monopulse/cnt1_6_rt_41 ),
    .O(\monopulse/Result [6])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<7>  (
    .CI(\monopulse/Mcount_cnt1_cy [6]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_7_rt_42 ),
    .O(\monopulse/Mcount_cnt1_cy [7])
  );
  XORCY \monopulse/Mcount_cnt1_xor<7>  (
    .CI(\monopulse/Mcount_cnt1_cy [6]),
    .LI(\monopulse/cnt1_7_rt_42 ),
    .O(\monopulse/Result [7])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<8>  (
    .CI(\monopulse/Mcount_cnt1_cy [7]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_8_rt_43 ),
    .O(\monopulse/Mcount_cnt1_cy [8])
  );
  XORCY \monopulse/Mcount_cnt1_xor<8>  (
    .CI(\monopulse/Mcount_cnt1_cy [7]),
    .LI(\monopulse/cnt1_8_rt_43 ),
    .O(\monopulse/Result [8])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<9>  (
    .CI(\monopulse/Mcount_cnt1_cy [8]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_9_rt_44 ),
    .O(\monopulse/Mcount_cnt1_cy [9])
  );
  XORCY \monopulse/Mcount_cnt1_xor<9>  (
    .CI(\monopulse/Mcount_cnt1_cy [8]),
    .LI(\monopulse/cnt1_9_rt_44 ),
    .O(\monopulse/Result [9])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<10>  (
    .CI(\monopulse/Mcount_cnt1_cy [9]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_10_rt_45 ),
    .O(\monopulse/Mcount_cnt1_cy [10])
  );
  XORCY \monopulse/Mcount_cnt1_xor<10>  (
    .CI(\monopulse/Mcount_cnt1_cy [9]),
    .LI(\monopulse/cnt1_10_rt_45 ),
    .O(\monopulse/Result [10])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<11>  (
    .CI(\monopulse/Mcount_cnt1_cy [10]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_11_rt_46 ),
    .O(\monopulse/Mcount_cnt1_cy [11])
  );
  XORCY \monopulse/Mcount_cnt1_xor<11>  (
    .CI(\monopulse/Mcount_cnt1_cy [10]),
    .LI(\monopulse/cnt1_11_rt_46 ),
    .O(\monopulse/Result [11])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<12>  (
    .CI(\monopulse/Mcount_cnt1_cy [11]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_12_rt_47 ),
    .O(\monopulse/Mcount_cnt1_cy [12])
  );
  XORCY \monopulse/Mcount_cnt1_xor<12>  (
    .CI(\monopulse/Mcount_cnt1_cy [11]),
    .LI(\monopulse/cnt1_12_rt_47 ),
    .O(\monopulse/Result [12])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<13>  (
    .CI(\monopulse/Mcount_cnt1_cy [12]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_13_rt_48 ),
    .O(\monopulse/Mcount_cnt1_cy [13])
  );
  XORCY \monopulse/Mcount_cnt1_xor<13>  (
    .CI(\monopulse/Mcount_cnt1_cy [12]),
    .LI(\monopulse/cnt1_13_rt_48 ),
    .O(\monopulse/Result [13])
  );
  MUXCY \monopulse/Mcount_cnt1_cy<14>  (
    .CI(\monopulse/Mcount_cnt1_cy [13]),
    .DI(dp_OBUF_1),
    .S(\monopulse/cnt1_14_rt_49 ),
    .O(\monopulse/Mcount_cnt1_cy [14])
  );
  XORCY \monopulse/Mcount_cnt1_xor<14>  (
    .CI(\monopulse/Mcount_cnt1_cy [13]),
    .LI(\monopulse/cnt1_14_rt_49 ),
    .O(\monopulse/Result [14])
  );
  XORCY \monopulse/Mcount_cnt1_xor<15>  (
    .CI(\monopulse/Mcount_cnt1_cy [14]),
    .LI(\monopulse/cnt1_15_rt_51 ),
    .O(\monopulse/Result [15])
  );
  defparam \disp/Mdecod_an_Mshift_Result_Result<0>1 .INIT = 4'hE;
  LUT2 \disp/Mdecod_an_Mshift_Result_Result<0>1  (
    .I0(\disp/cnt [14]),
    .I1(\disp/cnt [15]),
    .O(an_0_OBUF_5)
  );
  defparam \disp/Mdecod_an_Mshift_Result_Result<1>1 .INIT = 4'hD;
  LUT2 \disp/Mdecod_an_Mshift_Result_Result<1>1  (
    .I0(\disp/cnt [14]),
    .I1(\disp/cnt [15]),
    .O(an_1_OBUF_4)
  );
  defparam \disp/Mdecod_an_Mshift_Result_Result<2>1 .INIT = 4'hD;
  LUT2 \disp/Mdecod_an_Mshift_Result_Result<2>1  (
    .I0(\disp/cnt [15]),
    .I1(\disp/cnt [14]),
    .O(an_2_OBUF_3)
  );
  defparam \disp/Mdecod_an_Mshift_Result_Result<3>1 .INIT = 4'h7;
  LUT2 \disp/Mdecod_an_Mshift_Result_Result<3>1  (
    .I0(\disp/cnt [15]),
    .I1(\disp/cnt [14]),
    .O(an_3_OBUF_2)
  );
  defparam \monopulse/step<3>1 .INIT = 4'h2;
  LUT2 \monopulse/step<3>1  (
    .I0(\monopulse/q2 [3]),
    .I1(\monopulse/q3 [3]),
    .O(\step<3>1 )
  );
  defparam \sw<1>15 .INIT = 8'hFB;
  LUT3 \sw<1>15  (
    .I0(sw_1_IBUF_8),
    .I1(rez[12]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>2 )
  );
  defparam \sw<1>21 .INIT = 8'hFB;
  LUT3 \sw<1>21  (
    .I0(sw_1_IBUF_8),
    .I1(rez[8]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>3 )
  );
  defparam \sw<1>41 .INIT = 8'hFB;
  LUT3 \sw<1>41  (
    .I0(sw_1_IBUF_8),
    .I1(rez[9]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>5 )
  );
  defparam \sw<1>51 .INIT = 8'hFB;
  LUT3 \sw<1>51  (
    .I0(sw_1_IBUF_8),
    .I1(rez[5]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>6 )
  );
  defparam \sw<1>31 .INIT = 8'hFB;
  LUT3 \sw<1>31  (
    .I0(sw_1_IBUF_8),
    .I1(rez[13]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>4 )
  );
  defparam \sw<1>61 .INIT = 8'hFB;
  LUT3 \sw<1>61  (
    .I0(sw_1_IBUF_8),
    .I1(rez[1]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>7 )
  );
  defparam \sw<1>71 .INIT = 8'hFB;
  LUT3 \sw<1>71  (
    .I0(sw_1_IBUF_8),
    .I1(rez[14]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>8 )
  );
  defparam \sw<1>81 .INIT = 8'hFB;
  LUT3 \sw<1>81  (
    .I0(sw_1_IBUF_8),
    .I1(rez[10]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>9 )
  );
  defparam \sw<1>91 .INIT = 8'hFB;
  LUT3 \sw<1>91  (
    .I0(sw_1_IBUF_8),
    .I1(rez[6]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>10 )
  );
  defparam \sw<1>101 .INIT = 8'hFB;
  LUT3 \sw<1>101  (
    .I0(sw_1_IBUF_8),
    .I1(rez[2]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>111_20 )
  );
  defparam \sw<1>121 .INIT = 8'hFB;
  LUT3 \sw<1>121  (
    .I0(sw_1_IBUF_8),
    .I1(rez[11]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>13 )
  );
  defparam \sw<1>111 .INIT = 8'hFB;
  LUT3 \sw<1>111  (
    .I0(sw_1_IBUF_8),
    .I1(rez[15]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>12 )
  );
  defparam \sw<1>131 .INIT = 8'hFB;
  LUT3 \sw<1>131  (
    .I0(sw_1_IBUF_8),
    .I1(rez[7]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>14 )
  );
  defparam \sw<1>141 .INIT = 8'hFB;
  LUT3 \sw<1>141  (
    .I0(sw_1_IBUF_8),
    .I1(rez[3]),
    .I2(sw_0_IBUF_9),
    .O(\sw<1>15_21 )
  );
  defparam \register_file/aux<3>1 .INIT = 8'hE4;
  LUT3 \register_file/aux<3>1  (
    .I0(N6),
    .I1(instr[3]),
    .I2(instr[7]),
    .O(\register_file/aux [3])
  );
  defparam \register_file/aux<2>1 .INIT = 8'hE4;
  LUT3 \register_file/aux<2>1  (
    .I0(N6),
    .I1(instr[2]),
    .I2(instr[6]),
    .O(\register_file/aux [2])
  );
  defparam \register_file/aux<0>1 .INIT = 8'hE4;
  LUT3 \register_file/aux<0>1  (
    .I0(N6),
    .I1(instr[0]),
    .I2(instr[4]),
    .O(\register_file/aux [0])
  );
  defparam \register_file/aux<1>1 .INIT = 8'hE4;
  LUT3 \register_file/aux<1>1  (
    .I0(N6),
    .I1(instr[1]),
    .I2(instr[5]),
    .O(\register_file/aux [1])
  );
  defparam \disp/cnt<15>18 .INIT = 16'h10FF;
  LUT4 \disp/cnt<15>18  (
    .I0(sw_1_IBUF_8),
    .I1(sw_0_IBUF_9),
    .I2(rez[4]),
    .I3(sw_2_IBUF_7),
    .O(\disp/cnt<15>_map263 )
  );
  defparam \disp/cnt<15>21 .INIT = 4'hD;
  LUT2 \disp/cnt<15>21  (
    .I0(\sw<1>_f52 ),
    .I1(sw_2_IBUF_7),
    .O(\disp/cnt<15>_map265 )
  );
  defparam \monopulse/_cmp_eq00004 .INIT = 16'h8000;
  LUT4 \monopulse/_cmp_eq00004  (
    .I0(\monopulse/cnt1 [7]),
    .I1(\monopulse/cnt1 [6]),
    .I2(\monopulse/cnt1 [5]),
    .I3(\monopulse/cnt1 [4]),
    .O(\monopulse/_cmp_eq0000_map276 )
  );
  defparam \monopulse/_cmp_eq00009 .INIT = 16'h8000;
  LUT4 \monopulse/_cmp_eq00009  (
    .I0(\monopulse/cnt1 [3]),
    .I1(\monopulse/cnt1 [2]),
    .I2(\monopulse/cnt1 [1]),
    .I3(\monopulse/cnt1 [0]),
    .O(\monopulse/_cmp_eq0000_map279 )
  );
  defparam \monopulse/_cmp_eq000021 .INIT = 16'h8000;
  LUT4 \monopulse/_cmp_eq000021  (
    .I0(\monopulse/cnt1 [15]),
    .I1(\monopulse/cnt1 [14]),
    .I2(\monopulse/cnt1 [13]),
    .I3(\monopulse/cnt1 [12]),
    .O(\monopulse/_cmp_eq0000_map283 )
  );
  defparam \monopulse/_cmp_eq000026 .INIT = 16'h8000;
  LUT4 \monopulse/_cmp_eq000026  (
    .I0(\monopulse/cnt1 [11]),
    .I1(\monopulse/cnt1 [10]),
    .I2(\monopulse/cnt1 [9]),
    .I3(\monopulse/cnt1 [8]),
    .O(\monopulse/_cmp_eq0000_map286 )
  );
  defparam \monopulse/_cmp_eq000036 .INIT = 16'h8000;
  LUT4 \monopulse/_cmp_eq000036  (
    .I0(\monopulse/_cmp_eq0000_map276 ),
    .I1(\monopulse/_cmp_eq0000_map279 ),
    .I2(\monopulse/_cmp_eq0000_map283 ),
    .I3(\monopulse/_cmp_eq0000_map286 ),
    .O(\monopulse/_cmp_eq0000 )
  );
  defparam \instruction/Madd__add0000_xor<5>11 .INIT = 8'hA6;
  LUT3 \instruction/Madd__add0000_xor<5>11  (
    .I0(\instruction/count [5]),
    .I1(\instruction/count [4]),
    .I2(\instruction/N71 ),
    .O(\instruction/_add0000 [5])
  );
  defparam \instruction/Madd__add0000_xor<4>12 .INIT = 4'h9;
  LUT2 \instruction/Madd__add0000_xor<4>12  (
    .I0(\instruction/count [4]),
    .I1(\instruction/N71 ),
    .O(\instruction/_add0000 [4])
  );
  defparam \instruction/Madd__add0000_xor<7>11 .INIT = 8'hA6;
  LUT3 \instruction/Madd__add0000_xor<7>11  (
    .I0(\instruction/count [7]),
    .I1(\instruction/count [6]),
    .I2(\instruction/N21 ),
    .O(\instruction/_add0000 [7])
  );
  defparam \instruction/Madd__add0000_xor<3>11 .INIT = 16'h6AAA;
  LUT4 \instruction/Madd__add0000_xor<3>11  (
    .I0(\instruction/count [3]),
    .I1(\instruction/count [1]),
    .I2(\instruction/count [0]),
    .I3(\instruction/count [2]),
    .O(\instruction/_add0000 [3])
  );
  defparam \instruction/Madd__add0000_xor<2>11 .INIT = 8'h6A;
  LUT3 \instruction/Madd__add0000_xor<2>11  (
    .I0(\instruction/count [2]),
    .I1(\instruction/count [0]),
    .I2(\instruction/count [1]),
    .O(\instruction/_add0000 [2])
  );
  defparam \instruction/Madd__add0000_xor<1>11 .INIT = 4'h6;
  LUT2 \instruction/Madd__add0000_xor<1>11  (
    .I0(\instruction/count [1]),
    .I1(\instruction/count [0]),
    .O(\instruction/_add0000 [1])
  );
  defparam \instruction/Madd__add0000_xor<6>111 .INIT = 8'hDF;
  LUT3 \instruction/Madd__add0000_xor<6>111  (
    .I0(\instruction/count [4]),
    .I1(N484),
    .I2(\instruction/count [5]),
    .O(\instruction/N21 )
  );
  defparam \memo_ram/wd<14>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<14>1  (
    .I0(N10),
    .I1(\memo_ram/do [14]),
    .I2(N486),
    .O(wd[14])
  );
  defparam \memo_ram/wd<13>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<13>1  (
    .I0(N10),
    .I1(\memo_ram/do [13]),
    .I2(N487),
    .O(wd[13])
  );
  defparam \memo_ram/wd<12>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<12>1  (
    .I0(N10),
    .I1(\memo_ram/do [12]),
    .I2(N488),
    .O(wd[12])
  );
  defparam \memo_ram/wd<11>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<11>1  (
    .I0(N10),
    .I1(\memo_ram/do [11]),
    .I2(N489),
    .O(wd[11])
  );
  defparam \memo_ram/wd<10>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<10>1  (
    .I0(N10),
    .I1(\memo_ram/do [10]),
    .I2(N490),
    .O(wd[10])
  );
  defparam \memo_ram/wd<9>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<9>1  (
    .I0(N10),
    .I1(\memo_ram/do [9]),
    .I2(N491),
    .O(wd[9])
  );
  defparam \memo_ram/wd<8>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<8>1  (
    .I0(N10),
    .I1(\memo_ram/do [8]),
    .I2(N492),
    .O(wd[8])
  );
  defparam \memo_ram/wd<7>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<7>1  (
    .I0(N10),
    .I1(\memo_ram/do [7]),
    .I2(N493),
    .O(wd[7])
  );
  defparam \memo_ram/wd<6>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<6>1  (
    .I0(N10),
    .I1(\memo_ram/do [6]),
    .I2(N494),
    .O(wd[6])
  );
  defparam \memo_ram/wd<5>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<5>1  (
    .I0(N10),
    .I1(\memo_ram/do [5]),
    .I2(N495),
    .O(wd[5])
  );
  defparam \memo_ram/wd<4>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<4>1  (
    .I0(N10),
    .I1(\memo_ram/do [4]),
    .I2(N496),
    .O(wd[4])
  );
  defparam \memo_ram/wd<2>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<2>1  (
    .I0(N10),
    .I1(\memo_ram/do [2]),
    .I2(rez[2]),
    .O(wd[2])
  );
  defparam \memo_ram/wd<3>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<3>1  (
    .I0(N10),
    .I1(\memo_ram/do [3]),
    .I2(rez[3]),
    .O(wd[3])
  );
  defparam \memo_ram/wd<1>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<1>1  (
    .I0(N10),
    .I1(\memo_ram/do [1]),
    .I2(rez[1]),
    .O(wd[1])
  );
  defparam \memo_ram/wd<0>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<0>1  (
    .I0(N10),
    .I1(\memo_ram/do [0]),
    .I2(rez[0]),
    .O(wd[0])
  );
  defparam \memo_ram/wd<15>1 .INIT = 8'hE4;
  LUT3 \memo_ram/wd<15>1  (
    .I0(N10),
    .I1(\memo_ram/do [15]),
    .I2(N485),
    .O(wd[15])
  );
  defparam \arith_logic/Bfinal<0>1 .INIT = 8'hE4;
  LUT3 \arith_logic/Bfinal<0>1  (
    .I0(N8),
    .I1(rd2[0]),
    .I2(instr[0]),
    .O(\arith_logic/Bfinal [0])
  );
  BUFGP clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_0)
  );
  IBUF btn_3_IBUF (
    .I(btn[3]),
    .O(btn_3_IBUF_6)
  );
  IBUF sw_2_IBUF (
    .I(sw[2]),
    .O(sw_2_IBUF_7)
  );
  IBUF sw_1_IBUF (
    .I(sw[1]),
    .O(sw_1_IBUF_8)
  );
  IBUF sw_0_IBUF (
    .I(sw[0]),
    .O(sw_0_IBUF_9)
  );
  OBUF dp_OBUF (
    .I(dp_OBUF_1),
    .O(dp)
  );
  OBUF an_3_OBUF (
    .I(an_3_OBUF_2),
    .O(an[3])
  );
  OBUF an_2_OBUF (
    .I(an_2_OBUF_3),
    .O(an[2])
  );
  OBUF an_1_OBUF (
    .I(an_1_OBUF_4),
    .O(an[1])
  );
  OBUF an_0_OBUF (
    .I(an_0_OBUF_5),
    .O(an[0])
  );
  OBUF cat_6_OBUF (
    .I(cat_6_OBUF_16),
    .O(cat[6])
  );
  OBUF cat_5_OBUF (
    .I(cat_5_OBUF_15),
    .O(cat[5])
  );
  OBUF cat_4_OBUF (
    .I(cat_4_OBUF_14),
    .O(cat[4])
  );
  OBUF cat_3_OBUF (
    .I(cat_3_OBUF_13),
    .O(cat[3])
  );
  OBUF cat_2_OBUF (
    .I(cat_2_OBUF_12),
    .O(cat[2])
  );
  OBUF cat_1_OBUF (
    .I(cat_1_OBUF_11),
    .O(cat[1])
  );
  OBUF cat_0_OBUF (
    .I(cat_0_OBUF_10),
    .O(cat[0])
  );
  OBUF led_7_OBUF (
    .I(dp_OBUF_1),
    .O(led[7])
  );
  OBUF led_6_OBUF (
    .I(dp_OBUF_1),
    .O(led[6])
  );
  OBUF led_5_OBUF (
    .I(dp_OBUF_1),
    .O(led[5])
  );
  OBUF led_4_OBUF (
    .I(dp_OBUF_1),
    .O(led[4])
  );
  OBUF led_3_OBUF (
    .I(dp_OBUF_1),
    .O(led[3])
  );
  OBUF led_2_OBUF (
    .I(dp_OBUF_1),
    .O(led[2])
  );
  OBUF led_1_OBUF (
    .I(dp_OBUF_1),
    .O(led[1])
  );
  OBUF led_0_OBUF (
    .I(dp_OBUF_1),
    .O(led[0])
  );
  defparam \disp/cnt_1_rt .INIT = 4'h2;
  LUT1 \disp/cnt_1_rt  (
    .I0(\disp/cnt [1]),
    .O(\disp/cnt_1_rt_22 )
  );
  defparam \disp/cnt_2_rt .INIT = 4'h2;
  LUT1 \disp/cnt_2_rt  (
    .I0(\disp/cnt [2]),
    .O(\disp/cnt_2_rt_23 )
  );
  defparam \disp/cnt_3_rt .INIT = 4'h2;
  LUT1 \disp/cnt_3_rt  (
    .I0(\disp/cnt [3]),
    .O(\disp/cnt_3_rt_24 )
  );
  defparam \disp/cnt_4_rt .INIT = 4'h2;
  LUT1 \disp/cnt_4_rt  (
    .I0(\disp/cnt [4]),
    .O(\disp/cnt_4_rt_25 )
  );
  defparam \disp/cnt_5_rt .INIT = 4'h2;
  LUT1 \disp/cnt_5_rt  (
    .I0(\disp/cnt [5]),
    .O(\disp/cnt_5_rt_26 )
  );
  defparam \disp/cnt_6_rt .INIT = 4'h2;
  LUT1 \disp/cnt_6_rt  (
    .I0(\disp/cnt [6]),
    .O(\disp/cnt_6_rt_27 )
  );
  defparam \disp/cnt_7_rt .INIT = 4'h2;
  LUT1 \disp/cnt_7_rt  (
    .I0(\disp/cnt [7]),
    .O(\disp/cnt_7_rt_28 )
  );
  defparam \disp/cnt_8_rt .INIT = 4'h2;
  LUT1 \disp/cnt_8_rt  (
    .I0(\disp/cnt [8]),
    .O(\disp/cnt_8_rt_29 )
  );
  defparam \disp/cnt_9_rt .INIT = 4'h2;
  LUT1 \disp/cnt_9_rt  (
    .I0(\disp/cnt [9]),
    .O(\disp/cnt_9_rt_30 )
  );
  defparam \disp/cnt_10_rt .INIT = 4'h2;
  LUT1 \disp/cnt_10_rt  (
    .I0(\disp/cnt [10]),
    .O(\disp/cnt_10_rt_31 )
  );
  defparam \disp/cnt_11_rt .INIT = 4'h2;
  LUT1 \disp/cnt_11_rt  (
    .I0(\disp/cnt [11]),
    .O(\disp/cnt_11_rt_32 )
  );
  defparam \disp/cnt_12_rt .INIT = 4'h2;
  LUT1 \disp/cnt_12_rt  (
    .I0(\disp/cnt [12]),
    .O(\disp/cnt_12_rt_33 )
  );
  defparam \disp/cnt_13_rt .INIT = 4'h2;
  LUT1 \disp/cnt_13_rt  (
    .I0(\disp/cnt [13]),
    .O(\disp/cnt_13_rt_34 )
  );
  defparam \disp/cnt_14_rt .INIT = 4'h2;
  LUT1 \disp/cnt_14_rt  (
    .I0(\disp/cnt [14]),
    .O(\disp/cnt_14_rt_35 )
  );
  defparam \instruction/Madd__add0000_xor<4>121 .INIT = 4'h9;
  LUT2 \instruction/Madd__add0000_xor<4>121  (
    .I0(\instruction/count [4]),
    .I1(\instruction/N71 ),
    .O(N336)
  );
  defparam \instruction/Madd__add0000_xor<5>111 .INIT = 8'hA6;
  LUT3 \instruction/Madd__add0000_xor<5>111  (
    .I0(\instruction/count [5]),
    .I1(\instruction/count [4]),
    .I2(\instruction/N71 ),
    .O(N337)
  );
  defparam \monopulse/cnt1_1_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_1_rt  (
    .I0(\monopulse/cnt1 [1]),
    .O(\monopulse/cnt1_1_rt_36 )
  );
  defparam \monopulse/cnt1_2_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_2_rt  (
    .I0(\monopulse/cnt1 [2]),
    .O(\monopulse/cnt1_2_rt_37 )
  );
  defparam \monopulse/cnt1_3_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_3_rt  (
    .I0(\monopulse/cnt1 [3]),
    .O(\monopulse/cnt1_3_rt_38 )
  );
  defparam \monopulse/cnt1_4_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_4_rt  (
    .I0(\monopulse/cnt1 [4]),
    .O(\monopulse/cnt1_4_rt_39 )
  );
  defparam \monopulse/cnt1_5_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_5_rt  (
    .I0(\monopulse/cnt1 [5]),
    .O(\monopulse/cnt1_5_rt_40 )
  );
  defparam \monopulse/cnt1_6_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_6_rt  (
    .I0(\monopulse/cnt1 [6]),
    .O(\monopulse/cnt1_6_rt_41 )
  );
  defparam \monopulse/cnt1_7_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_7_rt  (
    .I0(\monopulse/cnt1 [7]),
    .O(\monopulse/cnt1_7_rt_42 )
  );
  defparam \monopulse/cnt1_8_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_8_rt  (
    .I0(\monopulse/cnt1 [8]),
    .O(\monopulse/cnt1_8_rt_43 )
  );
  defparam \monopulse/cnt1_9_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_9_rt  (
    .I0(\monopulse/cnt1 [9]),
    .O(\monopulse/cnt1_9_rt_44 )
  );
  defparam \monopulse/cnt1_10_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_10_rt  (
    .I0(\monopulse/cnt1 [10]),
    .O(\monopulse/cnt1_10_rt_45 )
  );
  defparam \monopulse/cnt1_11_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_11_rt  (
    .I0(\monopulse/cnt1 [11]),
    .O(\monopulse/cnt1_11_rt_46 )
  );
  defparam \monopulse/cnt1_12_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_12_rt  (
    .I0(\monopulse/cnt1 [12]),
    .O(\monopulse/cnt1_12_rt_47 )
  );
  defparam \monopulse/cnt1_13_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_13_rt  (
    .I0(\monopulse/cnt1 [13]),
    .O(\monopulse/cnt1_13_rt_48 )
  );
  defparam \monopulse/cnt1_14_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_14_rt  (
    .I0(\monopulse/cnt1 [14]),
    .O(\monopulse/cnt1_14_rt_49 )
  );
  defparam \disp/cnt_15_rt .INIT = 4'h2;
  LUT1 \disp/cnt_15_rt  (
    .I0(\disp/cnt [15]),
    .O(\disp/cnt_15_rt_50 )
  );
  defparam \instruction/Madd__add0000_xor<7>111 .INIT = 8'hA6;
  LUT3 \instruction/Madd__add0000_xor<7>111  (
    .I0(\instruction/count [7]),
    .I1(\instruction/count [6]),
    .I2(\instruction/N21 ),
    .O(N339)
  );
  defparam \monopulse/cnt1_15_rt .INIT = 4'h2;
  LUT1 \monopulse/cnt1_15_rt  (
    .I0(\monopulse/cnt1 [15]),
    .O(\monopulse/cnt1_15_rt_51 )
  );
  defparam \arith_logic/Mmux_rez_f5_8 .INIT = 8'hB1;
  LUT3 \arith_logic/Mmux_rez_f5_8  (
    .I0(N4),
    .I1(N364),
    .I2(\arith_logic/_addsub0000 [3]),
    .O(rez[3])
  );
  defparam \arith_logic/Mmux_rez_f5_7 .INIT = 8'hB1;
  LUT3 \arith_logic/Mmux_rez_f5_7  (
    .I0(N4),
    .I1(N366),
    .I2(\arith_logic/_addsub0000 [2]),
    .O(rez[2])
  );
  defparam \arith_logic/Mmux_rez_f5_6 .INIT = 8'hB1;
  LUT3 \arith_logic/Mmux_rez_f5_6  (
    .I0(N4),
    .I1(N368),
    .I2(\arith_logic/_addsub0000 [1]),
    .O(rez[1])
  );
  defparam \instruction/Madd__add0000_xor<6>121 .INIT = 16'hA6AA;
  LUT4 \instruction/Madd__add0000_xor<6>121  (
    .I0(\instruction/count [6]),
    .I1(\instruction/count [4]),
    .I2(\instruction/N71 ),
    .I3(\instruction/count [5]),
    .O(N338)
  );
  defparam \instruction/Madd_brpc_lut<0> .INIT = 4'h9;
  LUT2 \instruction/Madd_brpc_lut<0>  (
    .I0(\instruction/count [0]),
    .I1(instr[0]),
    .O(\instruction/brpc [0])
  );
  defparam \instruction/Madd__add0000_xor<6>12 .INIT = 16'hA6AA;
  LUT4 \instruction/Madd__add0000_xor<6>12  (
    .I0(\instruction/count [6]),
    .I1(\instruction/count [4]),
    .I2(\instruction/N71 ),
    .I3(\instruction/count [5]),
    .O(\instruction/_add0000 [6])
  );
  defparam \instruction/Madd_brpc_lut<1> .INIT = 8'h96;
  LUT3 \instruction/Madd_brpc_lut<1>  (
    .I0(\instruction/count [1]),
    .I1(\instruction/count [0]),
    .I2(instr[1]),
    .O(\instruction/N6 )
  );
  defparam \instruction/Madd_brpc_lut<2> .INIT = 16'h963C;
  LUT4 \instruction/Madd_brpc_lut<2>  (
    .I0(\instruction/count [0]),
    .I1(\instruction/count [2]),
    .I2(instr[2]),
    .I3(\instruction/count [1]),
    .O(\instruction/N7 )
  );
  defparam \disp/Mrom_cat1 .INIT = 16'h8248;
  LUT4 \disp/Mrom_cat1  (
    .I0(\disp/d [0]),
    .I1(\disp/d<1>1 ),
    .I2(\disp/d<3>1 ),
    .I3(\disp/d<2>1 ),
    .O(cat_0_OBUF_10)
  );
  defparam \disp/Mrom_cat2 .INIT = 16'h0927;
  LUT4 \disp/Mrom_cat2  (
    .I0(\disp/d [0]),
    .I1(\disp/d<3>1 ),
    .I2(\disp/d<2>1 ),
    .I3(\disp/d<1>1 ),
    .O(cat_1_OBUF_11)
  );
  defparam \disp/Mrom_cat3 .INIT = 16'h0119;
  LUT4 \disp/Mrom_cat3  (
    .I0(\disp/d<2>1 ),
    .I1(\disp/d<3>1 ),
    .I2(\disp/d<1>1 ),
    .I3(\disp/d [0]),
    .O(cat_2_OBUF_12)
  );
  defparam \disp/Mrom_cat4 .INIT = 16'h8612;
  LUT4 \disp/Mrom_cat4  (
    .I0(\disp/d [0]),
    .I1(\disp/d<1>1 ),
    .I2(\disp/d<2>1 ),
    .I3(\disp/d<3>1 ),
    .O(cat_3_OBUF_13)
  );
  defparam \disp/Mrom_cat5 .INIT = 16'hF820;
  LUT4 \disp/Mrom_cat5  (
    .I0(\disp/d<1>1 ),
    .I1(\disp/d<2>1 ),
    .I2(\disp/d<3>1 ),
    .I3(\disp/d [0]),
    .O(cat_4_OBUF_14)
  );
  defparam \disp/Mrom_cat6 .INIT = 16'h90C8;
  LUT4 \disp/Mrom_cat6  (
    .I0(\disp/d<2>1 ),
    .I1(\disp/d<3>1 ),
    .I2(\disp/d [0]),
    .I3(\disp/d<1>1 ),
    .O(cat_5_OBUF_15)
  );
  defparam \disp/Mrom_cat7 .INIT = 16'hC204;
  LUT4 \disp/Mrom_cat7  (
    .I0(\disp/d [0]),
    .I1(\disp/d<1>1 ),
    .I2(\disp/d<2>1 ),
    .I3(\disp/d<3>1 ),
    .O(cat_6_OBUF_16)
  );
  defparam \arith_logic/Maddsub__addsub0000_lut<1>1 .INIT = 4'h6;
  LUT2 \arith_logic/Maddsub__addsub0000_lut<1>1  (
    .I0(instr[1]),
    .I1(rd1[1]),
    .O(\arith_logic/N14 )
  );
  defparam \arith_logic/Maddsub__addsub0000_lut<2>1 .INIT = 4'h6;
  LUT2 \arith_logic/Maddsub__addsub0000_lut<2>1  (
    .I0(instr[2]),
    .I1(rd1[2]),
    .O(\arith_logic/N15 )
  );
  defparam \arith_logic/Maddsub__addsub0000_lut<3>1 .INIT = 4'h6;
  LUT2 \arith_logic/Maddsub__addsub0000_lut<3>1  (
    .I0(instr[3]),
    .I1(rd1[3]),
    .O(\arith_logic/N16 )
  );
  defparam \rd1<4>_rt .INIT = 4'h2;
  LUT1 \rd1<4>_rt  (
    .I0(rd1[4]),
    .O(\rd1<4>_rt_52 )
  );
  defparam \rd1<5>_rt .INIT = 4'h2;
  LUT1 \rd1<5>_rt  (
    .I0(rd1[5]),
    .O(\rd1<5>_rt_53 )
  );
  defparam \rd1<6>_rt .INIT = 4'h2;
  LUT1 \rd1<6>_rt  (
    .I0(rd1[6]),
    .O(\rd1<6>_rt_54 )
  );
  defparam \rd1<7>_rt .INIT = 4'h2;
  LUT1 \rd1<7>_rt  (
    .I0(rd1[7]),
    .O(\rd1<7>_rt_55 )
  );
  defparam \rd1<8>_rt .INIT = 4'h2;
  LUT1 \rd1<8>_rt  (
    .I0(rd1[8]),
    .O(\rd1<8>_rt_56 )
  );
  defparam \rd1<9>_rt .INIT = 4'h2;
  LUT1 \rd1<9>_rt  (
    .I0(rd1[9]),
    .O(\rd1<9>_rt_57 )
  );
  defparam \rd1<10>_rt .INIT = 4'h2;
  LUT1 \rd1<10>_rt  (
    .I0(rd1[10]),
    .O(\rd1<10>_rt_58 )
  );
  defparam \rd1<11>_rt .INIT = 4'h2;
  LUT1 \rd1<11>_rt  (
    .I0(rd1[11]),
    .O(\rd1<11>_rt_59 )
  );
  defparam \rd1<12>_rt .INIT = 4'h2;
  LUT1 \rd1<12>_rt  (
    .I0(rd1[12]),
    .O(\rd1<12>_rt_60 )
  );
  defparam \rd1<13>_rt .INIT = 4'h2;
  LUT1 \rd1<13>_rt  (
    .I0(rd1[13]),
    .O(\rd1<13>_rt_61 )
  );
  defparam \rd1<14>_rt .INIT = 4'h2;
  LUT1 \rd1<14>_rt  (
    .I0(rd1[14]),
    .O(\rd1<14>_rt_62 )
  );
  defparam \rd1<15>_rt .INIT = 4'h2;
  LUT1 \rd1<15>_rt  (
    .I0(rd1[15]),
    .O(\rd1<15>_rt_63 )
  );
  defparam \arith_logic/Mmux_rez_f5_8_1 .INIT = 8'hB1;
  LUT3 \arith_logic/Mmux_rez_f5_8_1  (
    .I0(N4),
    .I1(N364),
    .I2(\arith_logic/_addsub0000 [3]),
    .O(\arith_logic/Mmux_rez_f5_8_64 )
  );
  defparam \arith_logic/Mmux_rez_f5_7_1 .INIT = 8'hB1;
  LUT3 \arith_logic/Mmux_rez_f5_7_1  (
    .I0(N4),
    .I1(N366),
    .I2(\arith_logic/_addsub0000 [2]),
    .O(\arith_logic/Mmux_rez_f5_7_65 )
  );
  defparam \arith_logic/Mmux_rez_f5_6_1 .INIT = 8'hB1;
  LUT3 \arith_logic/Mmux_rez_f5_6_1  (
    .I0(N4),
    .I1(N368),
    .I2(\arith_logic/_addsub0000 [1]),
    .O(\arith_logic/Mmux_rez_f5_6_66 )
  );
  MUXF5 \arith_logic/Mmux_rez_f5  (
    .I0(N434),
    .I1(N435),
    .S(N4),
    .O(rez[0])
  );
  defparam \arith_logic/Mmux_rez_f5_F .INIT = 16'h49E8;
  LUT4 \arith_logic/Mmux_rez_f5_F  (
    .I0(\arith_logic/Bfinal [0]),
    .I1(N3),
    .I2(rd1[0]),
    .I3(N5),
    .O(N434)
  );
  defparam \arith_logic/Mmux_rez_f5_G .INIT = 4'h6;
  LUT2 \arith_logic/Mmux_rez_f5_G  (
    .I0(rd1[0]),
    .I1(instr[0]),
    .O(N435)
  );
  MUXF5 \instruction/nextcount<0>  (
    .I0(N436),
    .I1(N437),
    .S(instr[14]),
    .O(\instruction/nextcount [0])
  );
  defparam \instruction/nextcount<0>_F .INIT = 16'h9555;
  LUT4 \instruction/nextcount<0>_F  (
    .I0(\instruction/count [0]),
    .I1(zero),
    .I2(instr[13]),
    .I3(instr[0]),
    .O(N436)
  );
  defparam \instruction/nextcount<0>_G .INIT = 16'h2AEA;
  LUT4 \instruction/nextcount<0>_G  (
    .I0(instr[0]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/count [0]),
    .O(N437)
  );
  MUXF5 \instruction/nextcount<7>27  (
    .I0(N438),
    .I1(N439),
    .S(instr[14]),
    .O(\instruction/nextcount [7])
  );
  defparam \instruction/nextcount<7>27_F .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<7>27_F  (
    .I0(\instruction/_add0000 [7]),
    .I1(instr[13]),
    .I2(zero),
    .I3(\instruction/brpc [7]),
    .O(N438)
  );
  defparam \instruction/nextcount<7>27_G .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<7>27_G  (
    .I0(instr[7]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/_add0000 [7]),
    .O(N439)
  );
  MUXF5 \instruction/nextcount<1>  (
    .I0(N440),
    .I1(N441),
    .S(instr[14]),
    .O(\instruction/nextcount [1])
  );
  defparam \instruction/nextcount<1>_F .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<1>_F  (
    .I0(\instruction/_add0000 [1]),
    .I1(zero),
    .I2(instr[13]),
    .I3(\instruction/brpc [1]),
    .O(N440)
  );
  defparam \instruction/nextcount<1>_G .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<1>_G  (
    .I0(instr[1]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/_add0000 [1]),
    .O(N441)
  );
  MUXF5 \instruction/nextcount<6>27  (
    .I0(N442),
    .I1(N443),
    .S(instr[14]),
    .O(\instruction/nextcount [6])
  );
  defparam \instruction/nextcount<6>27_F .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<6>27_F  (
    .I0(\instruction/_add0000 [6]),
    .I1(instr[13]),
    .I2(zero),
    .I3(\instruction/brpc [6]),
    .O(N442)
  );
  defparam \instruction/nextcount<6>27_G .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<6>27_G  (
    .I0(instr[6]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/_add0000 [6]),
    .O(N443)
  );
  MUXF5 \instruction/nextcount<5>27  (
    .I0(N444),
    .I1(N445),
    .S(instr[14]),
    .O(\instruction/nextcount [5])
  );
  defparam \instruction/nextcount<5>27_F .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<5>27_F  (
    .I0(\instruction/_add0000 [5]),
    .I1(instr[13]),
    .I2(zero),
    .I3(\instruction/brpc [5]),
    .O(N444)
  );
  defparam \instruction/nextcount<5>27_G .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<5>27_G  (
    .I0(instr[5]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/_add0000 [5]),
    .O(N445)
  );
  MUXF5 \instruction/nextcount<4>27  (
    .I0(N446),
    .I1(N447),
    .S(instr[14]),
    .O(\instruction/nextcount [4])
  );
  defparam \instruction/nextcount<4>27_F .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<4>27_F  (
    .I0(\instruction/_add0000 [4]),
    .I1(instr[13]),
    .I2(zero),
    .I3(\instruction/brpc [4]),
    .O(N446)
  );
  defparam \instruction/nextcount<4>27_G .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<4>27_G  (
    .I0(instr[4]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/_add0000 [4]),
    .O(N447)
  );
  MUXF5 \instruction/nextcount<3>27  (
    .I0(N448),
    .I1(N449),
    .S(instr[14]),
    .O(\instruction/nextcount [3])
  );
  defparam \instruction/nextcount<3>27_F .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<3>27_F  (
    .I0(\instruction/_add0000 [3]),
    .I1(instr[13]),
    .I2(zero),
    .I3(\instruction/brpc [3]),
    .O(N448)
  );
  defparam \instruction/nextcount<3>27_G .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<3>27_G  (
    .I0(instr[3]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/_add0000 [3]),
    .O(N449)
  );
  MUXF5 \instruction/nextcount<2>27  (
    .I0(N450),
    .I1(N451),
    .S(instr[14]),
    .O(\instruction/nextcount [2])
  );
  defparam \instruction/nextcount<2>27_F .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<2>27_F  (
    .I0(\instruction/_add0000 [2]),
    .I1(instr[13]),
    .I2(zero),
    .I3(\instruction/brpc [2]),
    .O(N450)
  );
  defparam \instruction/nextcount<2>27_G .INIT = 16'hEA2A;
  LUT4 \instruction/nextcount<2>27_G  (
    .I0(instr[2]),
    .I1(instr[12]),
    .I2(instr[13]),
    .I3(\instruction/_add0000 [2]),
    .O(N451)
  );
  BUFG \step<3>_BUFG  (
    .I(\step<3>1 ),
    .O(step[3])
  );
  INV \disp/Mcount_cnt_lut<0>_INV_0  (
    .I(\disp/cnt [0]),
    .O(Result[0])
  );
  INV \monopulse/Mcount_cnt1_lut<0>_INV_0  (
    .I(\monopulse/cnt1 [0]),
    .O(\monopulse/Result [0])
  );
  defparam \arith_logic/Mmux_rez_f5_8_SW01 .INIT = 16'hB617;
  LUT4 \arith_logic/Mmux_rez_f5_8_SW01  (
    .I0(instr[3]),
    .I1(N3),
    .I2(rd1[3]),
    .I3(N5),
    .O(N452)
  );
  defparam \arith_logic/Mmux_rez_f5_8_SW02 .INIT = 16'hB617;
  LUT4 \arith_logic/Mmux_rez_f5_8_SW02  (
    .I0(rd2[3]),
    .I1(N3),
    .I2(rd1[3]),
    .I3(N5),
    .O(N453)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_8_SW0_f5  (
    .I0(N453),
    .I1(N452),
    .S(N8),
    .O(N364)
  );
  defparam \arith_logic/Mmux_rez_f5_7_SW01 .INIT = 16'hB617;
  LUT4 \arith_logic/Mmux_rez_f5_7_SW01  (
    .I0(instr[2]),
    .I1(N3),
    .I2(rd1[2]),
    .I3(N5),
    .O(N454)
  );
  defparam \arith_logic/Mmux_rez_f5_7_SW02 .INIT = 16'hB617;
  LUT4 \arith_logic/Mmux_rez_f5_7_SW02  (
    .I0(rd2[2]),
    .I1(N3),
    .I2(rd1[2]),
    .I3(N5),
    .O(N455)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_7_SW0_f5  (
    .I0(N455),
    .I1(N454),
    .S(N8),
    .O(N366)
  );
  defparam \arith_logic/Mmux_rez_f5_6_SW01 .INIT = 16'hB617;
  LUT4 \arith_logic/Mmux_rez_f5_6_SW01  (
    .I0(instr[1]),
    .I1(N3),
    .I2(rd1[1]),
    .I3(N5),
    .O(N456)
  );
  defparam \arith_logic/Mmux_rez_f5_6_SW02 .INIT = 16'hB617;
  LUT4 \arith_logic/Mmux_rez_f5_6_SW02  (
    .I0(rd2[1]),
    .I1(N3),
    .I2(rd1[1]),
    .I3(N5),
    .O(N457)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_6_SW0_f5  (
    .I0(N457),
    .I1(N456),
    .S(N8),
    .O(N368)
  );
  defparam \arith_logic/Mmux_rez_f5_5_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_5_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[15]),
    .O(N458)
  );
  defparam \arith_logic/Mmux_rez_f5_5_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_5_SW02  (
    .I0(rd1[15]),
    .I1(N3),
    .I2(N5),
    .O(N459)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_5_SW0_f5  (
    .I0(N459),
    .I1(N458),
    .S(rd2[15]),
    .O(N340)
  );
  defparam \arith_logic/Mmux_rez_f5_4_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_4_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[14]),
    .O(N460)
  );
  defparam \arith_logic/Mmux_rez_f5_4_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_4_SW02  (
    .I0(rd1[14]),
    .I1(N3),
    .I2(N5),
    .O(N461)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_4_SW0_f5  (
    .I0(N461),
    .I1(N460),
    .S(rd2[14]),
    .O(N342)
  );
  defparam \arith_logic/Mmux_rez_f5_3_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_3_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[13]),
    .O(N462)
  );
  defparam \arith_logic/Mmux_rez_f5_3_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_3_SW02  (
    .I0(rd1[13]),
    .I1(N3),
    .I2(N5),
    .O(N463)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_3_SW0_f5  (
    .I0(N463),
    .I1(N462),
    .S(rd2[13]),
    .O(N344)
  );
  defparam \arith_logic/Mmux_rez_f5_2_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_2_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[12]),
    .O(N464)
  );
  defparam \arith_logic/Mmux_rez_f5_2_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_2_SW02  (
    .I0(rd1[12]),
    .I1(N3),
    .I2(N5),
    .O(N465)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_2_SW0_f5  (
    .I0(N465),
    .I1(N464),
    .S(rd2[12]),
    .O(N346)
  );
  defparam \arith_logic/Mmux_rez_f5_1_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_1_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[11]),
    .O(N466)
  );
  defparam \arith_logic/Mmux_rez_f5_1_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_1_SW02  (
    .I0(rd1[11]),
    .I1(N3),
    .I2(N5),
    .O(N467)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_1_SW0_f5  (
    .I0(N467),
    .I1(N466),
    .S(rd2[11]),
    .O(N348)
  );
  defparam \arith_logic/Mmux_rez_f5_0_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_0_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[10]),
    .O(N468)
  );
  defparam \arith_logic/Mmux_rez_f5_0_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_0_SW02  (
    .I0(rd1[10]),
    .I1(N3),
    .I2(N5),
    .O(N469)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_0_SW0_f5  (
    .I0(N469),
    .I1(N468),
    .S(rd2[10]),
    .O(N350)
  );
  defparam \arith_logic/Mmux_rez_f5_14_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_14_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[9]),
    .O(N470)
  );
  defparam \arith_logic/Mmux_rez_f5_14_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_14_SW02  (
    .I0(rd1[9]),
    .I1(N3),
    .I2(N5),
    .O(N471)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_14_SW0_f5  (
    .I0(N471),
    .I1(N470),
    .S(rd2[9]),
    .O(N352)
  );
  defparam \arith_logic/Mmux_rez_f5_13_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_13_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[8]),
    .O(N472)
  );
  defparam \arith_logic/Mmux_rez_f5_13_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_13_SW02  (
    .I0(rd1[8]),
    .I1(N3),
    .I2(N5),
    .O(N473)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_13_SW0_f5  (
    .I0(N473),
    .I1(N472),
    .S(rd2[8]),
    .O(N354)
  );
  defparam \arith_logic/Mmux_rez_f5_12_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_12_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[7]),
    .O(N474)
  );
  defparam \arith_logic/Mmux_rez_f5_12_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_12_SW02  (
    .I0(rd1[7]),
    .I1(N3),
    .I2(N5),
    .O(N475)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_12_SW0_f5  (
    .I0(N475),
    .I1(N474),
    .S(rd2[7]),
    .O(N356)
  );
  defparam \arith_logic/Mmux_rez_f5_11_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_11_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[6]),
    .O(N476)
  );
  defparam \arith_logic/Mmux_rez_f5_11_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_11_SW02  (
    .I0(rd1[6]),
    .I1(N3),
    .I2(N5),
    .O(N477)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_11_SW0_f5  (
    .I0(N477),
    .I1(N476),
    .S(rd2[6]),
    .O(N358)
  );
  defparam \arith_logic/Mmux_rez_f5_10_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_10_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[5]),
    .O(N478)
  );
  defparam \arith_logic/Mmux_rez_f5_10_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_10_SW02  (
    .I0(rd1[5]),
    .I1(N3),
    .I2(N5),
    .O(N479)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_10_SW0_f5  (
    .I0(N479),
    .I1(N478),
    .S(rd2[5]),
    .O(N360)
  );
  defparam \arith_logic/Mmux_rez_f5_9_SW01 .INIT = 16'h3AD3;
  LUT4 \arith_logic/Mmux_rez_f5_9_SW01  (
    .I0(N5),
    .I1(N3),
    .I2(N8),
    .I3(rd1[4]),
    .O(N480)
  );
  defparam \arith_logic/Mmux_rez_f5_9_SW02 .INIT = 8'h67;
  LUT3 \arith_logic/Mmux_rez_f5_9_SW02  (
    .I0(rd1[4]),
    .I1(N3),
    .I2(N5),
    .O(N481)
  );
  MUXF5 \arith_logic/Mmux_rez_f5_9_SW0_f5  (
    .I0(N481),
    .I1(N480),
    .S(rd2[4]),
    .O(N362)
  );
  defparam \disp/cnt<15>782 .INIT = 16'h80D5;
  LUT4 \disp/cnt<15>782  (
    .I0(\disp/cnt [14]),
    .I1(\disp/cnt<15>_map265 ),
    .I2(\disp/cnt<15>_map263 ),
    .I3(\sw<2>_f6_18 ),
    .O(N483)
  );
  MUXF5 \disp/cnt<15>78_f5  (
    .I0(N483),
    .I1(N482),
    .S(\disp/cnt [15]),
    .O(\disp/d [0])
  );
  defparam \instruction/Madd__add0000_xor<4>111 .INIT = 16'h7FFF;
  LUT4_D \instruction/Madd__add0000_xor<4>111  (
    .I0(\instruction/count [3]),
    .I1(\instruction/count [2]),
    .I2(\instruction/count [1]),
    .I3(\instruction/count [0]),
    .LO(N484),
    .O(\instruction/N71 )
  );
  defparam \arith_logic/Mmux_rez_f5_5 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_5  (
    .I0(N4),
    .I1(N340),
    .I2(\arith_logic/_addsub0000 [15]),
    .LO(N485),
    .O(rez[15])
  );
  defparam \arith_logic/Mmux_rez_f5_4 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_4  (
    .I0(N4),
    .I1(N342),
    .I2(\arith_logic/_addsub0000 [14]),
    .LO(N486),
    .O(rez[14])
  );
  defparam \arith_logic/Mmux_rez_f5_3 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_3  (
    .I0(N4),
    .I1(N344),
    .I2(\arith_logic/_addsub0000 [13]),
    .LO(N487),
    .O(rez[13])
  );
  defparam \arith_logic/Mmux_rez_f5_2 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_2  (
    .I0(N4),
    .I1(N346),
    .I2(\arith_logic/_addsub0000 [12]),
    .LO(N488),
    .O(rez[12])
  );
  defparam \arith_logic/Mmux_rez_f5_1 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_1  (
    .I0(N4),
    .I1(N348),
    .I2(\arith_logic/_addsub0000 [11]),
    .LO(N489),
    .O(rez[11])
  );
  defparam \arith_logic/Mmux_rez_f5_0 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_0  (
    .I0(N4),
    .I1(N350),
    .I2(\arith_logic/_addsub0000 [10]),
    .LO(N490),
    .O(rez[10])
  );
  defparam \arith_logic/Mmux_rez_f5_14 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_14  (
    .I0(N4),
    .I1(N352),
    .I2(\arith_logic/_addsub0000 [9]),
    .LO(N491),
    .O(rez[9])
  );
  defparam \arith_logic/Mmux_rez_f5_13 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_13  (
    .I0(N4),
    .I1(N354),
    .I2(\arith_logic/_addsub0000 [8]),
    .LO(N492),
    .O(rez[8])
  );
  defparam \arith_logic/Mmux_rez_f5_12 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_12  (
    .I0(N4),
    .I1(N356),
    .I2(\arith_logic/_addsub0000 [7]),
    .LO(N493),
    .O(rez[7])
  );
  defparam \arith_logic/Mmux_rez_f5_11 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_11  (
    .I0(N4),
    .I1(N358),
    .I2(\arith_logic/_addsub0000 [6]),
    .LO(N494),
    .O(rez[6])
  );
  defparam \arith_logic/Mmux_rez_f5_10 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_10  (
    .I0(N4),
    .I1(N360),
    .I2(\arith_logic/_addsub0000 [5]),
    .LO(N495),
    .O(rez[5])
  );
  defparam \arith_logic/Mmux_rez_f5_9 .INIT = 8'hB1;
  LUT3_D \arith_logic/Mmux_rez_f5_9  (
    .I0(N4),
    .I1(N362),
    .I2(\arith_logic/_addsub0000 [4]),
    .LO(N496),
    .O(rez[4])
  );
  INV \disp/cnt<15>781_INV_0  (
    .I(\disp/cnt<14>_f5_19 ),
    .O(N482)
  );
endmodule


`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

