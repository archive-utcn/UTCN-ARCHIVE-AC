
library ieee;
use ieee.std_logic_1164.all;
library a3200DX;

entity fpga is 
    port(ale, inta, reset, nwrs : in std_logic; code : in 
        std_logic_vector (3 downto 0);  datas : in 
        std_logic_vector (7 downto 0);  acka, busy, ctr, ncs, nrd, 
        nwr : out std_logic; address : out std_logic_vector (4
         downto 0);  port0 : inout std_logic_vector (7 downto 0)
        ;  port1 : inout std_logic_vector (7 downto 0);  port2 : 
        inout std_logic_vector (7 downto 0);  port3 : inout 
        std_logic_vector (7 downto 0)) ;
end fpga;


architecture DEF_ARCH of  fpga is

    component TRIBUFF
        port(PAD : out std_logic;  D, E : in std_logic := 'U') ;
    end component;

    component DL1
        port(D, G : in std_logic := 'U'; Q : out std_logic) ;
    end component;

    component MX4
        port(D0, D1, D2, D3, S0, S1 : in std_logic := 'U'; Y : 
        out std_logic) ;
    end component;

    component AOI1B
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DLMA
        port(A, B, S, G : in std_logic := 'U'; Q : out std_logic
        ) ;
    end component;

    component BIBUF
        port(PAD : inout std_logic := 'U'; D, E : in std_logic := 
        'U'; Y : out std_logic) ;
    end component;

    component DFMB
        port(A, B, S, CLR, CLK : in std_logic := 'U'; Q : out 
        std_logic) ;
    end component;

    component NOR3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component BUFA
        port(A : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OUTBUF
        port(PAD : out std_logic;  D : in std_logic := 'U') ;
    end component;

    component AND3B
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OR3A
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component INBUF
        port(PAD : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AND3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component NOR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component INV
        port(A : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component CLKBUF
        port(PAD : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AND2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OR3B
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DFM6A
        port(D0, D1, D2, D3, S0, S1, CLR, CLK : in std_logic := 
        'U'; Q : out std_logic) ;
    end component;

    component DFC1D
        port(D, CLR, CLK : in std_logic := 'U'; Q : out std_logic
        ) ;
    end component;

    component NAND2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component GND
        port(Y : out std_logic) ;
    end component;

    component AND3A
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DL1B
        port(D, G : in std_logic := 'U'; Q : out std_logic) ;
    end component;

    component OR2A
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DFM3B
        port(A, B, S, CLR, CLK : in std_logic := 'U'; Q : out 
        std_logic) ;
    end component;

    component VCC
        port(Y : out std_logic) ;
    end component;

    component DFC1
        port(CLK, CLR, D : in std_logic := 'U'; Q : out std_logic
        ) ;
    end component;

    component OBDLHS
        port(G : in std_logic := 'U'; PAD : out std_logic;  D : 
        in std_logic := 'U') ;
    end component;

    signal u1_nx45_1_net, u1_nx46_1_net, u1_nx47_1_net, 
        u1_nx48_1_net, u1_nx49_1_net, u1_nx50_1_net, 
        u1_nx51_1_net, u1_nx52_1_net, u2_cnt_0_net, u2_cnt_1_net, 
        u2_cnt_2_net, u1_ix4486_modgen_156_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_156_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_156_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_156_mi_ax_int_r_0_net, 
        u1_ix4486_modgen_157_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_157_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_157_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_157_mi_ax_int_r_0_net, 
        u1_ix4486_modgen_158_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_158_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_158_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_158_mi_ax_int_r_0_net, 
        u1_ix4486_modgen_159_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_159_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_159_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_159_mi_ax_int_r_0_net, 
        u1_ix4486_modgen_160_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_160_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_160_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_160_mi_ax_int_r_0_net, 
        u1_ix4486_modgen_161_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_161_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_161_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_161_mi_ax_int_r_0_net, 
        u1_ix4486_modgen_162_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_162_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_162_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_162_mi_ax_int_r_0_net, 
        u1_ix4486_modgen_163_mi_ax_int_r_3_net, 
        u1_ix4486_modgen_163_mi_ax_int_r_2_net, 
        u1_ix4486_modgen_163_mi_ax_int_r_1_net, 
        u1_ix4486_modgen_163_mi_ax_int_r_0_net, 
        u2_modgen_153_mi_ax_int_r_1_net, 
        u2_modgen_153_mi_ax_int_r_0_net, u2_ix218_sclrbuf_5_net, 
        u2_ix218_c_2_net, u2_ix218_c_1_net, ale_int, inta_int, 
        reset_int, nwrs_int, code_3_int, code_2_int, code_1_int, 
        code_0_int, datas_7_int, datas_6_int, datas_5_int, 
        datas_4_int, datas_3_int, datas_2_int, datas_1_int, 
        datas_0_int, port0_7_int, port0_6_int, port0_5_int, 
        port0_4_int, port0_3_int, port0_2_int, port0_1_int, 
        port0_0_int, port2_7_int, port2_6_int, port3_7_int, 
        port3_6_int, port3_5_int, port3_4_int, port3_1_int, 
        address_dup0_3_net, address_dup0_2_net, 
        address_dup0_1_net, address_dup0_0_net, u1_nx1756, 
        u1_nx1768, u1_nx1780, u1_nx1792, u1_nx1804, u1_nx1816, 
        u1_nx1828, u1_nx1840, u1_nx1846, u2_reg_7_net, 
        u2_reg_6_net, u2_reg_5_net, u2_reg_4_net, u2_reg_3_net, 
        u2_reg_2_net, u2_reg_1_net, u2_reg_0_net, busy_dup0, 
        u1_ix4486_a_15_net, u1_ix4486_a_14_net, 
        u1_ix4486_a_13_net, u1_ix4486_a_12_net, 
        u1_ix4486_a_11_net, u1_ix4486_a_10_net, u1_ix4486_a_9_net, 
        u1_ix4486_a_8_net, u1_ix4486_a_7_net, u1_ix4486_a_6_net, 
        u1_ix4486_a_5_net, u1_ix4486_a_4_net, 
        u1_ix4486_a_3_dup_3499, u1_ix4486_a_2_dup_3500, 
        u1_ix4486_a_1_dup_3501, u1_ix4486_a_0_dup_3502, 
        u1_ix4486_a_15_dup_3514, u1_ix4486_a_14_dup_3515, 
        u1_ix4486_a_13_dup_3516, u1_ix4486_a_12_dup_3517, 
        u1_ix4486_a_11_dup_3518, u1_ix4486_a_10_dup_3519, 
        u1_ix4486_a_9_dup_3520, u1_ix4486_a_8_dup_3521, 
        u1_ix4486_a_7_dup_3522, u1_ix4486_a_6_dup_3523, 
        u1_ix4486_a_5_dup_3524, u1_ix4486_a_4_dup_3525, 
        u1_ix4486_a_3_dup_3526, u1_ix4486_a_2_dup_3527, 
        u1_ix4486_a_1_dup_3528, u1_ix4486_a_0_dup_3529, 
        u1_ix4486_a_15_dup_3541, u1_ix4486_a_14_dup_3542, 
        u1_ix4486_a_13_dup_3543, u1_ix4486_a_12_dup_3544, 
        u1_ix4486_a_11_dup_3545, u1_ix4486_a_10_dup_3546, 
        u1_ix4486_a_9_dup_3547, u1_ix4486_a_8_dup_3548, 
        u1_ix4486_a_7_dup_3549, u1_ix4486_a_6_dup_3550, 
        u1_ix4486_a_5_dup_3551, u1_ix4486_a_4_dup_3552, 
        u1_ix4486_a_3_dup_3553, u1_ix4486_a_2_dup_3554, 
        u1_ix4486_a_1_dup_3555, u1_ix4486_a_0_dup_3556, 
        u1_ix4486_a_15_dup_3568, u1_ix4486_a_14_dup_3569, 
        u1_ix4486_a_13_dup_3570, u1_ix4486_a_12_dup_3571, 
        u1_ix4486_a_11_dup_3572, u1_ix4486_a_10_dup_3573, 
        u1_ix4486_a_9_dup_3574, u1_ix4486_a_8_dup_3575, 
        u1_ix4486_a_7_dup_3576, u1_ix4486_a_6_dup_3577, 
        u1_ix4486_a_5_dup_3578, u1_ix4486_a_4_dup_3579, 
        u1_ix4486_a_3_dup_3580, u1_ix4486_a_2_dup_3581, 
        u1_ix4486_a_1_dup_3582, u1_ix4486_a_0_dup_3583, 
        u1_ix4486_a_15_dup_3595, u1_ix4486_a_14_dup_3596, 
        u1_ix4486_a_13_dup_3597, u1_ix4486_a_12_dup_3598, 
        u1_ix4486_a_11_dup_3599, u1_ix4486_a_10_dup_3600, 
        u1_ix4486_a_9_dup_3601, u1_ix4486_a_8_dup_3602, 
        u1_ix4486_a_7_dup_3603, u1_ix4486_a_6_dup_3604, 
        u1_ix4486_a_5_dup_3605, u1_ix4486_a_4_dup_3606, 
        u1_ix4486_a_3_dup_3607, u1_ix4486_a_2_dup_3608, 
        u1_ix4486_a_1_dup_3609, u1_ix4486_a_0_dup_3610, 
        u1_ix4486_a_15_dup_3622, u1_ix4486_a_14_dup_3623, 
        u1_ix4486_a_13_dup_3624, u1_ix4486_a_12_dup_3625, 
        u1_ix4486_a_11_dup_3626, u1_ix4486_a_10_dup_3627, 
        u1_ix4486_a_9_dup_3628, u1_ix4486_a_8_dup_3629, 
        u1_ix4486_a_7_dup_3630, u1_ix4486_a_6_dup_3631, 
        u1_ix4486_a_5_dup_3632, u1_ix4486_a_4_dup_3633, 
        u1_ix4486_a_3_dup_3634, u1_ix4486_a_2_dup_3635, 
        u1_ix4486_a_1_dup_3636, u1_ix4486_a_0_dup_3637, 
        u1_ix4486_a_15_dup_3649, u1_ix4486_a_14_dup_3650, 
        u1_ix4486_a_13_dup_3651, u1_ix4486_a_12_dup_3652, 
        u1_ix4486_a_11_dup_3653, u1_ix4486_a_10_dup_3654, 
        u1_ix4486_a_9_dup_3655, u1_ix4486_a_8_dup_3656, 
        u1_ix4486_a_7_dup_3657, u1_ix4486_a_6_dup_3658, 
        u1_ix4486_a_5_dup_3659, u1_ix4486_a_4_dup_3660, 
        u1_ix4486_a_3_dup_3661, u1_ix4486_a_2_dup_3662, 
        u1_ix4486_a_1_dup_3663, u1_ix4486_a_0_dup_3664, 
        u1_ix4486_a_15_dup_3676, u1_ix4486_a_14_dup_3677, 
        u1_ix4486_a_13_dup_3678, u1_ix4486_a_12_dup_3679, 
        u1_ix4486_a_11_dup_3680, u1_ix4486_a_10_dup_3681, 
        u1_ix4486_a_9_dup_3682, u1_ix4486_a_8_dup_3683, 
        u1_ix4486_a_7_dup_3684, u1_ix4486_a_6_dup_3685, 
        u1_ix4486_a_5_dup_3686, u1_ix4486_a_4_dup_3687, 
        u1_ix4486_a_3_dup_3688, u1_ix4486_a_2_dup_3689, 
        u1_ix4486_a_1_dup_3690, u1_ix4486_a_0_dup_3691, 
        port3_dup0_0_net, port3_dup0_3_net, address_3_XX0, 
        address_2_XX0, address_1_XX0, address_1_XX1, 
        address_0_XX0, address_0_XX1, u2_PWR_1_net, 
        u2_nx107_1_net, GND0_1_net, u2_nx104_1_net, 
        u2_ix218_aclrb_1_net, nx127, nx128, u1_nx4482_1_net, 
        nx129, nx130, u1_nx1842_1_net, nx131, 
        u2_modgen_154_nx8_1_net, nx132, nx133, 
        u1_ix4486_nx497_1_net, nx134, u1_ix4486_nx501_1_net, 
        nx135, u1_ix4486_nx505_1_net, nx136, 
        u1_ix4486_nx509_1_net, nx137, u1_ix4486_nx513_1_net, 
        u1_ix4486_nx517_1_net, u1_ix4486_nx521_1_net, 
        u1_ix4486_nx525_1_net, u1_ix4486_nx529_1_net, nx138, 
        u1_ix4486_nx533_1_net, u1_ix4486_nx537_1_net, nx139, 
        u1_ix4486_nx541_1_net, u1_ix4486_nx545_1_net, 
        u1_ix4486_nx549_1_net, u1_ix4486_nx553_1_net, 
        u1_ix4486_nx557_1_net, nx140, nx141, u2_nx160_1_net, 
        nx142, nx143, nx144, nx145, nx146, nx147, nx148, nx149, 
        nx150, nx151, nx152, nx153, nx154, nx155, nx156, nx157 : std_logic ;
    begin   

    ix169 : TRIBUFF port map(PAD => port2(3), D => GND0_1_net, 
        E => GND0_1_net);
    u1_ix4486_ix483 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3661);
    u1_ix4486_ix211 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_dup_3550);
    u1_ix4486_ix512 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_dup_3679);
    u1_ix4486_ix170 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3529);
    u1_nx45 : MX4 port map(D0 => 
        u1_ix4486_modgen_156_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_156_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_156_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_156_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx45_1_net);
    u1_ix4486_ix451 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_dup_3653);
    u1_ix4486_ix378 : DL1 port map(D => nx146, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_dup_3624);
    u0_lat_outp_1_1 : DL1 port map(D => nx149, G => ale_int, Q => 
        address_1_XX1);
    u1_ix4486_ix95 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3500);
    u1_ix4486_ix288 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3580);
    u1_nx1842 : AOI1B port map(A => port3_7_int, B => port3_6_int, 
        C => nx130, Y => u1_nx1842_1_net);
    u1_ix1793 : DLMA port map(A => u1_nx48_1_net, B => nx142, 
        S => port3_7_int, G => nx129, Q => u1_nx1792);
    ix183 : BIBUF port map(PAD => port0(1), D => u1_nx1828, E => 
        u1_nx1846, Y => port0_1_int);
    u2_reg_reg_6_inst : DFMB port map(A => datas_6_int, B => 
        u2_reg_6_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_6_net);
    u1_ix4486_nx553 : NOR3 port map(A => address_dup0_3_net, B => 
        address_dup0_2_net, C => nx135, Y => 
        u1_ix4486_nx553_1_net);
    u1_ix4486_ix548 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3688);
    ix231 : BUFA port map(A => port0_4_int, Y => nx142);
    u1_ix4486_modgen_159_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3583, D1 => u1_ix4486_a_1_dup_3582, 
        D2 => u1_ix4486_a_2_dup_3581, D3 => 
        u1_ix4486_a_3_dup_3580, S0 => address_0_XX1, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_159_mi_ax_int_r_0_net);
    u1_ix4486_nx545 : NOR3 port map(A => address_dup0_3_net, B => 
        address_dup0_2_net, C => nx132, Y => 
        u1_ix4486_nx545_1_net);
    u1_ix4486_ix305 : DL1 port map(D => nx144, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_dup_3595);
    ix195 : OUTBUF port map(PAD => nrd, D => port3_7_int);
    u1_ix4486_ix394 : DL1 port map(D => nx146, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_dup_3628);
    u1_ix4486_ix71 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_net);
    u0_lat_outp_2_0 : DL1 port map(D => nx147, G => ale_int, Q => 
        address_2_XX0);
    u1_ix4486_ix455 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_dup_3654);
    u1_ix4486_ix231 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3555);
    ix161 : OUTBUF port map(PAD => port3(3), D => nx128);
    u1_ix4486_nx541 : AND3B port map(A => nx139, B => 
        address_dup0_1_net, C => address_dup0_2_net, Y => 
        u1_ix4486_nx541_1_net);
    u1_ix4486_ix532 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_dup_3684);
    u1_ix4486_ix203 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_dup_3548);
    u1_nx46 : MX4 port map(D0 => 
        u1_ix4486_modgen_157_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_157_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_157_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_157_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx46_1_net);
    u1_ix4486_ix370 : DL1 port map(D => nx146, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_dup_3622);
    u1_ix4486_ix528 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_dup_3683);
    u0_lat_outp_0_inst : DL1 port map(D => nx150, G => ale_int, 
        Q => address_dup0_0_net);
    ix158 : OUTBUF port map(PAD => port3(0), D => nx127);
    u1_ix4486_ix443 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_dup_3651);
    u1_ix4486_nx525 : NOR3 port map(A => address_dup0_1_net, B => 
        nx136, C => nx137, Y => u1_ix4486_nx525_1_net);
    u1_nx4482 : OR3A port map(A => port3_7_int, B => port2_7_int, 
        C => port3_6_int, Y => u1_nx4482_1_net);
    u1_ix4486_modgen_161_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_dup_3629, D1 => u1_ix4486_a_9_dup_3628, 
        D2 => u1_ix4486_a_10_dup_3627, D3 => 
        u1_ix4486_a_11_dup_3626, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_161_mi_ax_int_r_2_net);
    ix205 : INBUF port map(PAD => datas(5), Y => datas_5_int);
    u2_nx107 : AND3 port map(A => u2_cnt_0_net, B => u2_cnt_1_net, 
        C => u2_cnt_2_net, Y => u2_nx107_1_net);
    u1_ix4486_ix406 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_dup_3631);
    u1_ix4486_ix248 : DL1 port map(D => nx142, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_dup_3570);
    u1_ix4486_nx557 : NOR3 port map(A => address_dup0_2_net, B => 
        address_dup0_1_net, C => nx139, Y => 
        u1_ix4486_nx557_1_net);
    u1_ix4486_ix459 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_dup_3655);
    u1_ix4486_nx521 : NOR2 port map(A => nx135, B => nx137, Y => 
        u1_ix4486_nx521_1_net);
    ix232 : BUFA port map(A => port0_4_int, Y => nx143);
    ix219 : INV port map(A => port2_7_int, Y => nx130);
    ix173 : BIBUF port map(PAD => port2(7), D => GND0_1_net, E => 
        GND0_1_net, Y => port2_7_int);
    u1_nx52 : MX4 port map(D0 => 
        u1_ix4486_modgen_163_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_163_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_163_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_163_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx52_1_net);
    ix194 : OUTBUF port map(PAD => nwr, D => port3_6_int);
    u1_ix4486_ix504 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_dup_3677);
    ix159 : BIBUF port map(PAD => port3(1), D => GND0_1_net, E => 
        GND0_1_net, Y => port3_1_int);
    ix182 : BIBUF port map(PAD => port0(0), D => u1_nx1840, E => 
        u1_nx1846, Y => port0_0_int);
    ix190 : OUTBUF port map(PAD => address(0), D => 
        address_dup0_0_net);
    u1_ix4486_modgen_161_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_dup_3625, D1 => u1_ix4486_a_13_dup_3624, 
        D2 => u1_ix4486_a_14_dup_3623, D3 => 
        u1_ix4486_a_15_dup_3622, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_161_mi_ax_int_r_3_net);
    ix187 : BIBUF port map(PAD => port0(5), D => u1_nx1780, E => 
        u1_nx1846, Y => port0_5_int);
    u1_ix4486_ix317 : DL1 port map(D => nx144, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_dup_3598);
    ix201 : INBUF port map(PAD => datas(1), Y => datas_1_int);
    u1_ix4486_ix114 : DL1 port map(D => nx154, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_dup_3515);
    ix234 : BUFA port map(A => port0_3_int, Y => nx145);
    u1_ix4486_modgen_160_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3610, D1 => u1_ix4486_a_1_dup_3609, 
        D2 => u1_ix4486_a_2_dup_3608, D3 => 
        u1_ix4486_a_3_dup_3607, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_160_mi_ax_int_r_0_net);
    u1_ix4486_ix199 : DL1 port map(D => nx156, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_dup_3547);
    ix246 : BUFA port map(A => port0_5_int, Y => nx157);
    u1_ix4486_ix422 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3635);
    ix188 : BIBUF port map(PAD => port0(6), D => u1_nx1768, E => 
        u1_nx1846, Y => port0_6_int);
    u2_reg_reg_2_inst : DFMB port map(A => datas_2_int, B => 
        u2_reg_2_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_2_net);
    u1_ix4486_ix142 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_dup_3522);
    u1_ix4486_modgen_158_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_dup_3548, D1 => u1_ix4486_a_9_dup_3547, 
        D2 => u1_ix4486_a_10_dup_3546, D3 => 
        u1_ix4486_a_11_dup_3545, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_158_mi_ax_int_r_2_net);
    u1_ix4486_ix175 : DL1 port map(D => nx156, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_dup_3541);
    u1_ix4486_ix540 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_dup_3686);
    u1_ix4486_ix463 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_dup_3656);
    u1_ix4486_ix349 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_dup_3606);
    u1_ix4486_ix337 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_dup_3603);
    u1_ix4486_ix134 : DL1 port map(D => nx154, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_dup_3520);
    u1_nx49 : MX4 port map(D0 => 
        u1_ix4486_modgen_160_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_160_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_160_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_160_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx49_1_net);
    ix172 : BIBUF port map(PAD => port2(6), D => GND0_1_net, E => 
        GND0_1_net, Y => port2_6_int);
    u1_ix4486_ix227 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3554);
    ix202 : INBUF port map(PAD => datas(2), Y => datas_2_int);
    u1_ix4486_modgen_162_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_dup_3660, D1 => u1_ix4486_a_5_dup_3659, 
        D2 => u1_ix4486_a_6_dup_3658, D3 => 
        u1_ix4486_a_7_dup_3657, S0 => address_dup0_0_net, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_162_mi_ax_int_r_1_net);
    u1_ix4486_ix268 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_dup_3575);
    u0_lat_outp_3_0 : DL1 port map(D => nx145, G => ale_int, Q => 
        address_3_XX0);
    ix196 : OUTBUF port map(PAD => ncs, D => port2_6_int);
    u1_ix4486_ix122 : DL1 port map(D => nx154, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_dup_3517);
    ix189 : BIBUF port map(PAD => port0(7), D => u1_nx1756, E => 
        u1_nx1846, Y => port0_7_int);
    ix177 : OUTBUF port map(PAD => port1(3), D => code_3_int);
    u1_ix4486_ix487 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3662);
    ix230 : INV port map(A => u2_modgen_153_mi_ax_int_r_1_net, 
        Y => nx141);
    u1_ix4486_ix520 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_dup_3681);
    u1_ix4486_ix296 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3582);
    u0_lat_outp_1_inst : DL1 port map(D => nx148, G => ale_int, 
        Q => address_dup0_1_net);
    u1_ix4486_ix516 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_dup_3680);
    u1_ix4486_ix329 : DL1 port map(D => nx144, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_dup_3601);
    u1_ix4486_ix313 : DL1 port map(D => nx144, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_dup_3597);
    u1_ix4486_ix410 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_dup_3632);
    ix238 : BUFA port map(A => port0_1_int, Y => nx149);
    u1_ix4486_ix398 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_dup_3629);
    ix165 : BIBUF port map(PAD => port3(7), D => GND0_1_net, E => 
        GND0_1_net, Y => port3_7_int);
    u0_lat_outp_2_inst : DL1 port map(D => nx146, G => ale_int, 
        Q => address_dup0_2_net);
    u1_ix4486_ix552 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3689);
    ix229 : INV port map(A => u2_modgen_153_mi_ax_int_r_0_net, 
        Y => nx140);
    ix178 : TRIBUFF port map(PAD => port1(4), D => GND0_1_net, 
        E => GND0_1_net);
    u1_ix4486_ix341 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_dup_3604);
    ix233 : BUFA port map(A => port0_3_int, Y => nx144);
    u1_ix4486_ix471 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_dup_3658);
    ix204 : INBUF port map(PAD => datas(4), Y => datas_4_int);
    u1_ix1829 : DLMA port map(A => u1_nx51_1_net, B => nx148, 
        S => port3_7_int, G => nx129, Q => u1_nx1828);
    u1_ix4486_modgen_158_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_dup_3552, D1 => u1_ix4486_a_5_dup_3551, 
        D2 => u1_ix4486_a_6_dup_3550, D3 => 
        u1_ix4486_a_7_dup_3549, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_158_mi_ax_int_r_1_net);
    u1_ix4486_ix59 : DL1 port map(D => nx152, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_net);
    u1_ix4486_ix536 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_dup_3685);
    ix181 : TRIBUFF port map(PAD => port1(7), D => GND0_1_net, 
        E => GND0_1_net);
    u1_ix4486_ix333 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_dup_3602);
    u1_ix4486_ix430 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3637);
    u1_ix4486_modgen_163_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_dup_3683, D1 => u1_ix4486_a_9_dup_3682, 
        D2 => u1_ix4486_a_10_dup_3681, D3 => 
        u1_ix4486_a_11_dup_3680, S0 => address_dup0_0_net, S1 => 
        address_dup0_1_net, Y => 
        u1_ix4486_modgen_163_mi_ax_int_r_2_net);
    u1_ix4486_ix75 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_net);
    u1_nx50 : MX4 port map(D0 => 
        u1_ix4486_modgen_161_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_161_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_161_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_161_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx50_1_net);
    u1_ix4486_ix447 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_dup_3652);
    u1_ix4486_ix321 : DL1 port map(D => nx144, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_dup_3599);
    u1_ix4486_ix162 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3527);
    ix215 : INBUF port map(PAD => ale, Y => ale_int);
    ix179 : TRIBUFF port map(PAD => port1(5), D => GND0_1_net, 
        E => GND0_1_net);
    u1_ix4486_ix560 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3691);
    u1_ix4486_ix475 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_dup_3659);
    u1_ix4486_ix390 : DL1 port map(D => nx146, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_dup_3627);
    u1_ix4486_nx549 : AND3B port map(A => nx139, B => 
        address_dup0_2_net, C => address_dup0_1_net, Y => 
        u1_ix4486_nx549_1_net);
    ix164 : BIBUF port map(PAD => port3(6), D => GND0_1_net, E => 
        GND0_1_net, Y => port3_6_int);
    u1_nx47 : MX4 port map(D0 => 
        u1_ix4486_modgen_158_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_158_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_158_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_158_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx47_1_net);
    u1_ix4486_ix382 : DL1 port map(D => nx146, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_dup_3625);
    u1_ix4486_ix87 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_net);
    ix200 : INBUF port map(PAD => datas(0), Y => datas_0_int);
    ix160 : OUTBUF port map(PAD => port3(2), D => inta_int);
    u1_ix4486_modgen_163_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_dup_3679, D1 => u1_ix4486_a_13_dup_3678, 
        D2 => u1_ix4486_a_14_dup_3677, D3 => 
        u1_ix4486_a_15_dup_3676, S0 => address_dup0_0_net, S1 => 
        address_dup0_1_net, Y => 
        u1_ix4486_modgen_163_mi_ax_int_r_3_net);
    u1_ix4486_nx529 : AND3B port map(A => nx132, B => 
        address_dup0_3_net, C => address_dup0_2_net, Y => 
        u1_ix4486_nx529_1_net);
    u1_ix4486_modgen_161_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3637, D1 => u1_ix4486_a_1_dup_3636, 
        D2 => u1_ix4486_a_2_dup_3635, D3 => 
        u1_ix4486_a_3_dup_3634, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_161_mi_ax_int_r_0_net);
    u1_ix4486_ix479 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_dup_3660);
    u1_ix4486_ix418 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3634);
    u1_ix4486_ix280 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_dup_3578);
    ix211 : INBUF port map(PAD => code(3), Y => code_3_int);
    ix208 : INBUF port map(PAD => code(0), Y => code_0_int);
    ix171 : TRIBUFF port map(PAD => port2(5), D => GND0_1_net, 
        E => GND0_1_net);
    ix203 : INBUF port map(PAD => datas(3), Y => datas_3_int);
    u1_ix4486_ix63 : DL1 port map(D => nx152, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_net);
    u1_ix4486_ix361 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3609);
    u1_ix4486_ix146 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_dup_3523);
    u1_ix4486_ix357 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3608);
    u1_ix4486_ix154 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_dup_3525);
    u1_ix4486_ix187 : DL1 port map(D => nx156, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_dup_3544);
    u1_ix4486_modgen_156_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_net, D1 => u1_ix4486_a_9_net, D2 => 
        u1_ix4486_a_10_net, D3 => u1_ix4486_a_11_net, S0 => 
        address_0_XX0, S1 => address_1_XX0, Y => 
        u1_ix4486_modgen_156_mi_ax_int_r_2_net);
    u1_ix4486_ix43 : DL1 port map(D => nx152, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_net);
    u1_ix4486_ix284 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_dup_3579);
    u1_ix4486_ix467 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_dup_3657);
    ix212 : CLKBUF port map(PAD => nwrs, Y => nwrs_int);
    ix166 : TRIBUFF port map(PAD => port2(0), D => GND0_1_net, 
        E => GND0_1_net);
    u1_ix4486_ix126 : DL1 port map(D => nx154, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_dup_3518);
    u1_ix4486_ix195 : DL1 port map(D => nx156, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_dup_3546);
    u1_ix4486_ix240 : DL1 port map(D => nx142, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_dup_3568);
    ix237 : BUFA port map(A => port0_1_int, Y => nx148);
    u1_ix4486_modgen_158_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_dup_3544, D1 => u1_ix4486_a_13_dup_3543, 
        D2 => u1_ix4486_a_14_dup_3542, D3 => 
        u1_ix4486_a_15_dup_3541, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_158_mi_ax_int_r_3_net);
    u1_ix1841 : DLMA port map(A => u1_nx52_1_net, B => nx150, 
        S => port3_7_int, G => nx129, Q => u1_nx1840);
    ix225 : OR2 port map(A => u1_nx4482_1_net, B => 
        address_dup0_0_net, Y => nx136);
    u1_ix1817 : DLMA port map(A => u1_nx50_1_net, B => nx146, 
        S => port3_7_int, G => nx129, Q => u1_nx1816);
    u2_modgen_153_mi_ax_ax_1_a0 : MX4 port map(D0 => u2_reg_4_net, 
        D1 => u2_reg_5_net, D2 => u2_reg_6_net, D3 => 
        u2_reg_7_net, S0 => u2_cnt_2_net, S1 => u2_cnt_1_net, 
        Y => u2_modgen_153_mi_ax_int_r_1_net);
    u1_ix4486_ix252 : DL1 port map(D => nx142, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_dup_3571);
    u1_ix4486_modgen_157_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_dup_3521, D1 => u1_ix4486_a_9_dup_3520, 
        D2 => u1_ix4486_a_10_dup_3519, D3 => 
        u1_ix4486_a_11_dup_3518, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_157_mi_ax_int_r_2_net);
    u1_ix4486_ix345 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_dup_3605);
    u2_ix218_l0_l0 : AND2 port map(A => u2_cnt_2_net, B => 
        u2_PWR_1_net, Y => u2_ix218_c_1_net);
    u1_ix4486_ix556 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3690);
    u1_ix4486_ix300 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3583);
    ix185 : BIBUF port map(PAD => port0(3), D => u1_nx1804, E => 
        u1_nx1846, Y => port0_3_int);
    u1_ix4486_ix353 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3607);
    u1_ix4486_ix244 : DL1 port map(D => nx142, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_dup_3569);
    ix214 : INBUF port map(PAD => inta, Y => inta_int);
    ix236 : BUFA port map(A => port0_2_int, Y => nx147);
    u2_reg_reg_0_inst : DFMB port map(A => datas_0_int, B => 
        u2_reg_0_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_0_net);
    u1_ix4486_modgen_156_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_net, D1 => u1_ix4486_a_5_net, D2 => 
        u1_ix4486_a_6_net, D3 => u1_ix4486_a_7_net, S0 => 
        address_0_XX0, S1 => address_1_XX0, Y => 
        u1_ix4486_modgen_156_mi_ax_int_r_1_net);
    u1_ix4486_ix103 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3502);
    u1_ix4486_ix110 : DL1 port map(D => nx154, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_dup_3514);
    u1_ix4486_ix414 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_dup_3633);
    u1_ix4486_ix166 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3528);
    u1_ix4486_ix491 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3663);
    u1_ix4486_ix325 : DL1 port map(D => nx144, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_dup_3600);
    u1_ix4486_ix99 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3501);
    ix221 : OR3B port map(A => address_dup0_1_net, B => 
        address_dup0_0_net, C => u1_nx4482_1_net, Y => nx132);
    u1_ix4486_modgen_159_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_dup_3575, D1 => u1_ix4486_a_9_dup_3574, 
        D2 => u1_ix4486_a_10_dup_3573, D3 => 
        u1_ix4486_a_11_dup_3572, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_159_mi_ax_int_r_2_net);
    u1_ix4486_ix51 : DL1 port map(D => nx152, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_net);
    u1_ix4486_ix118 : DL1 port map(D => nx154, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_dup_3516);
    u1_ix4486_modgen_162_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_dup_3656, D1 => u1_ix4486_a_9_dup_3655, 
        D2 => u1_ix4486_a_10_dup_3654, D3 => 
        u1_ix4486_a_11_dup_3653, S0 => address_dup0_0_net, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_162_mi_ax_int_r_2_net);
    u1_ix4486_ix223 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3553);
    u2_cnt_0_inst : DFM6A port map(D0 => GND0_1_net, D1 => 
        u2_ix218_sclrbuf_5_net, D2 => u2_ix218_sclrbuf_5_net, 
        D3 => GND0_1_net, S0 => u2_ix218_c_2_net, S1 => 
        u2_cnt_0_net, CLR => u2_ix218_aclrb_1_net, CLK => 
        u2_nx104_1_net, Q => u2_cnt_0_net);
    u2_cnt_2_inst : DFM6A port map(D0 => GND0_1_net, D1 => 
        u2_ix218_sclrbuf_5_net, D2 => u2_ix218_sclrbuf_5_net, 
        D3 => GND0_1_net, S0 => u2_PWR_1_net, S1 => u2_cnt_2_net, 
        CLR => u2_ix218_aclrb_1_net, CLK => u2_nx104_1_net, Q => 
        u2_cnt_2_net);
    ix207 : INBUF port map(PAD => datas(7), Y => datas_7_int);
    ix184 : BIBUF port map(PAD => port0(2), D => u1_nx1816, E => 
        u1_nx1846, Y => port0_2_int);
    u1_ix4486_ix544 : DL1 port map(D => nx151, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_dup_3687);
    u1_ix4486_ix130 : DL1 port map(D => nx154, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_dup_3519);
    ix210 : INBUF port map(PAD => code(2), Y => code_2_int);
    u1_ix4486_ix495 : DL1 port map(D => nx149, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3664);
    u1_ix4486_ix260 : DL1 port map(D => nx142, G => 
        u1_ix4486_nx517_1_net, Q => u1_ix4486_a_10_dup_3573);
    u1_ix4486_modgen_157_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_dup_3525, D1 => u1_ix4486_a_5_dup_3524, 
        D2 => u1_ix4486_a_6_dup_3523, D3 => 
        u1_ix4486_a_7_dup_3522, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_157_mi_ax_int_r_1_net);
    u1_ix4486_ix426 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx553_1_net, Q => u1_ix4486_a_1_dup_3636);
    ix175 : OUTBUF port map(PAD => port1(1), D => code_1_int);
    u1_ix4486_modgen_163_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3691, D1 => u1_ix4486_a_1_dup_3690, 
        D2 => u1_ix4486_a_2_dup_3689, D3 => 
        u1_ix4486_a_3_dup_3688, S0 => address_dup0_0_net, S1 => 
        address_dup0_1_net, Y => 
        u1_ix4486_modgen_163_mi_ax_int_r_0_net);
    ix180 : TRIBUFF port map(PAD => port1(6), D => GND0_1_net, 
        E => GND0_1_net);
    u2_reg_busy_int : DFC1D port map(D => u2_modgen_154_nx8_1_net, 
        CLR => u2_ix218_aclrb_1_net, CLK => port3_1_int, Q => 
        busy_dup0);
    u1_nx48 : MX4 port map(D0 => 
        u1_ix4486_modgen_159_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_159_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_159_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_159_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx48_1_net);
    u2_ix218_l0_0_l0 : NAND2 port map(A => u2_PWR_1_net, B => 
        u2_nx107_1_net, Y => u2_ix218_sclrbuf_5_net);
    ix218 : INV port map(A => u1_nx4482_1_net, Y => nx129);
    u1_ix4486_modgen_162_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_dup_3652, D1 => u1_ix4486_a_13_dup_3651, 
        D2 => u1_ix4486_a_14_dup_3650, D3 => 
        u1_ix4486_a_15_dup_3649, S0 => address_dup0_0_net, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_162_mi_ax_int_r_3_net);
    u1_ix4486_modgen_160_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_dup_3606, D1 => u1_ix4486_a_5_dup_3605, 
        D2 => u1_ix4486_a_6_dup_3604, D3 => 
        u1_ix4486_a_7_dup_3603, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_160_mi_ax_int_r_1_net);
    ix222 : NAND2 port map(A => address_dup0_3_net, B => 
        address_dup0_2_net, Y => nx133);
    u1_ix4486_ix138 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx525_1_net, Q => u1_ix4486_a_8_dup_3521);
    ix193 : OUTBUF port map(PAD => address(3), D => 
        address_dup0_3_net);
    u1_ix4486_ix524 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_dup_3682);
    GND0 : GND port map(Y => GND0_1_net);
    ix213 : INBUF port map(PAD => reset, Y => reset_int);
    u1_ix4486_ix365 : DL1 port map(D => nx145, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3610);
    u1_ix4486_ix508 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_dup_3678);
    ix206 : INBUF port map(PAD => datas(6), Y => datas_6_int);
    u1_ix4486_ix264 : DL1 port map(D => nx142, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_dup_3574);
    u1_ix4486_nx505 : NOR2 port map(A => nx135, B => nx133, Y => 
        u1_ix4486_nx505_1_net);
    u1_ix4486_modgen_159_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_dup_3579, D1 => u1_ix4486_a_5_dup_3578, 
        D2 => u1_ix4486_a_6_dup_3577, D3 => 
        u1_ix4486_a_7_dup_3576, S0 => address_0_XX1, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_159_mi_ax_int_r_1_net);
    u1_ix4486_nx501 : AND3A port map(A => nx133, B => nx134, C => 
        address_dup0_1_net, Y => u1_ix4486_nx501_1_net);
    ix174 : OUTBUF port map(PAD => port1(0), D => code_0_int);
    ix224 : OR3A port map(A => address_dup0_0_net, B => 
        u1_nx4482_1_net, C => address_dup0_1_net, Y => nx135);
    ix170 : TRIBUFF port map(PAD => port2(4), D => GND0_1_net, 
        E => GND0_1_net);
    ix186 : BIBUF port map(PAD => port0(4), D => u1_nx1792, E => 
        u1_nx1846, Y => port0_4_int);
    ix245 : BUFA port map(A => port0_5_int, Y => nx156);
    u1_ix4486_modgen_156_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_net, D1 => u1_ix4486_a_13_net, D2 => 
        u1_ix4486_a_14_net, D3 => u1_ix4486_a_15_net, S0 => 
        address_0_XX0, S1 => address_1_XX0, Y => 
        u1_ix4486_modgen_156_mi_ax_int_r_3_net);
    u1_ix1847 : DL1B port map(D => u1_nx1842_1_net, G => nx129, 
        Q => u1_nx1846);
    u2_modgen_153_mi_ax_ax_0_a0 : MX4 port map(D0 => u2_reg_0_net, 
        D1 => u2_reg_1_net, D2 => u2_reg_2_net, D3 => 
        u2_reg_3_net, S0 => u2_cnt_2_net, S1 => u2_cnt_1_net, 
        Y => u2_modgen_153_mi_ax_int_r_0_net);
    u0_lat_outp_1_0 : DL1 port map(D => nx149, G => ale_int, Q => 
        address_1_XX0);
    ix192 : OUTBUF port map(PAD => address(2), D => address_2_XX0);
    u2_reg_reg_7_inst : DFMB port map(A => datas_7_int, B => 
        u2_reg_7_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_7_net);
    u1_ix4486_modgen_158_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3556, D1 => u1_ix4486_a_1_dup_3555, 
        D2 => u1_ix4486_a_2_dup_3554, D3 => 
        u1_ix4486_a_3_dup_3553, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_158_mi_ax_int_r_0_net);
    u1_ix4486_ix402 : DL1 port map(D => nx147, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_dup_3630);
    ix197 : OUTBUF port map(PAD => ctr, D => port3_4_int);
    u2_nx160 : OR2 port map(A => busy_dup0, B => reset_int, Y => 
        u2_nx160_1_net);
    ix220 : INV port map(A => u2_cnt_0_net, Y => nx131);
    u2_cnt_1_inst : DFM6A port map(D0 => GND0_1_net, D1 => 
        u2_ix218_sclrbuf_5_net, D2 => u2_ix218_sclrbuf_5_net, 
        D3 => GND0_1_net, S0 => u2_ix218_c_1_net, S1 => 
        u2_cnt_1_net, CLR => u2_ix218_aclrb_1_net, CLK => 
        u2_nx104_1_net, Q => u2_cnt_1_net);
    ix241 : BUFA port map(A => port0_7_int, Y => nx152);
    u0_lat_outp_3_inst : DL1 port map(D => nx144, G => ale_int, 
        Q => address_dup0_3_net);
    u1_ix4486_modgen_157_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_dup_3517, D1 => u1_ix4486_a_13_dup_3516, 
        D2 => u1_ix4486_a_14_dup_3515, D3 => 
        u1_ix4486_a_15_dup_3514, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_157_mi_ax_int_r_3_net);
    u1_ix4486_ix256 : DL1 port map(D => nx142, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_dup_3572);
    u1_ix4486_nx497 : NOR2 port map(A => nx132, B => nx133, Y => 
        u1_ix4486_nx497_1_net);
    u1_ix4486_ix272 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_dup_3576);
    ix176 : OUTBUF port map(PAD => port1(2), D => code_2_int);
    ix228 : OR2A port map(A => nx134, B => address_dup0_3_net, 
        Y => nx139);
    u1_ix4486_ix207 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx529_1_net, Q => u1_ix4486_a_7_dup_3549);
    ix198 : OUTBUF port map(PAD => busy, D => busy_dup0);
    u1_ix4486_ix215 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_dup_3551);
    u1_ix4486_ix150 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_dup_3524);
    ix223 : NOR2 port map(A => u1_nx4482_1_net, B => 
        address_dup0_0_net, Y => nx134);
    u2_reg_txd : DFM3B port map(A => nx140, B => nx141, S => 
        u2_cnt_0_net, CLR => u2_ix218_aclrb_1_net, CLK => 
        port3_1_int, Q => port3_dup0_0_net);
    u0_lat_outp_0_0 : DL1 port map(D => nx151, G => ale_int, Q => 
        address_0_XX0);
    u1_ix4486_ix500 : DL1 port map(D => nx150, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_dup_3676);
    u1_ix4486_ix309 : DL1 port map(D => nx144, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_dup_3596);
    u1_ix4486_modgen_161_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_dup_3633, D1 => u1_ix4486_a_5_dup_3632, 
        D2 => u1_ix4486_a_6_dup_3631, D3 => 
        u1_ix4486_a_7_dup_3630, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_161_mi_ax_int_r_1_net);
    u1_ix4486_ix91 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3499);
    ix217 : INV port map(A => port3_dup0_3_net, Y => nx128);
    u2_reg_reg_3_inst : DFMB port map(A => datas_3_int, B => 
        u2_reg_3_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_3_net);
    u1_ix4486_ix219 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx541_1_net, Q => u1_ix4486_a_4_dup_3552);
    ix239 : BUFA port map(A => port0_0_int, Y => nx150);
    ix242 : BUFA port map(A => port0_7_int, Y => nx153);
    u1_ix4486_modgen_159_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_dup_3571, D1 => u1_ix4486_a_13_dup_3570, 
        D2 => u1_ix4486_a_14_dup_3569, D3 => 
        u1_ix4486_a_15_dup_3568, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_159_mi_ax_int_r_3_net);
    u1_ix4486_ix55 : DL1 port map(D => nx152, G => 
        u1_ix4486_nx509_1_net, Q => u1_ix4486_a_12_net);
    u1_ix4486_ix158 : DL1 port map(D => nx155, G => 
        u1_ix4486_nx545_1_net, Q => u1_ix4486_a_3_dup_3526);
    u2_reg_reg_5_inst : DFMB port map(A => datas_5_int, B => 
        u2_reg_5_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_5_net);
    ix199 : OUTBUF port map(PAD => acka, D => port3_5_int);
    u1_ix4486_nx513 : NOR2 port map(A => nx132, B => nx137, Y => 
        u1_ix4486_nx513_1_net);
    u2_ix218_l1_l0 : AND3 port map(A => u2_cnt_1_net, B => 
        u2_cnt_2_net, C => u2_PWR_1_net, Y => u2_ix218_c_2_net);
    ix163 : BIBUF port map(PAD => port3(5), D => GND0_1_net, E => 
        GND0_1_net, Y => port3_5_int);
    u1_ix4486_modgen_162_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3664, D1 => u1_ix4486_a_1_dup_3663, 
        D2 => u1_ix4486_a_2_dup_3662, D3 => 
        u1_ix4486_a_3_dup_3661, S0 => address_dup0_0_net, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_162_mi_ax_int_r_0_net);
    u1_ix4486_ix235 : DL1 port map(D => nx157, G => 
        u1_ix4486_nx557_1_net, Q => u1_ix4486_a_0_dup_3556);
    u1_ix4486_ix79 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_net);
    u1_ix4486_ix374 : DL1 port map(D => nx146, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_dup_3623);
    u1_ix1805 : DLMA port map(A => u1_nx49_1_net, B => nx144, 
        S => port3_7_int, G => nx129, Q => u1_nx1804);
    u1_ix1757 : DLMA port map(A => u1_nx45_1_net, B => nx152, 
        S => port3_7_int, G => nx129, Q => u1_nx1756);
    ix216 : INV port map(A => port3_dup0_0_net, Y => nx127);
    u2_PWR : VCC port map(Y => u2_PWR_1_net);
    ix244 : BUFA port map(A => port0_6_int, Y => nx155);
    u1_ix4486_nx533 : AND3 port map(A => nx138, B => 
        address_dup0_2_net, C => address_dup0_1_net, Y => 
        u1_ix4486_nx533_1_net);
    u1_ix4486_ix67 : DL1 port map(D => nx152, G => 
        u1_ix4486_nx521_1_net, Q => u1_ix4486_a_9_net);
    u2_modgen_154_nx8 : OR3B port map(A => u2_cnt_1_net, B => 
        u2_cnt_2_net, C => nx131, Y => u2_modgen_154_nx8_1_net);
    u1_ix4486_nx517 : AND3A port map(A => nx137, B => nx134, C => 
        address_dup0_1_net, Y => u1_ix4486_nx517_1_net);
    ix191 : OUTBUF port map(PAD => address(1), D => 
        address_dup0_1_net);
    u1_ix4486_ix183 : DL1 port map(D => nx156, G => 
        u1_ix4486_nx505_1_net, Q => u1_ix4486_a_13_dup_3543);
    u1_nx51 : MX4 port map(D0 => 
        u1_ix4486_modgen_162_mi_ax_int_r_0_net, D1 => 
        u1_ix4486_modgen_162_mi_ax_int_r_1_net, D2 => 
        u1_ix4486_modgen_162_mi_ax_int_r_2_net, D3 => 
        u1_ix4486_modgen_162_mi_ax_int_r_3_net, S0 => 
        address_2_XX0, S1 => address_3_XX0, Y => u1_nx51_1_net);
    u1_ix4486_ix435 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx497_1_net, Q => u1_ix4486_a_15_dup_3649);
    u1_ix4486_ix47 : DL1 port map(D => nx152, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_net);
    u1_ix1769 : DLMA port map(A => u1_nx46_1_net, B => nx154, 
        S => port3_7_int, G => nx129, Q => u1_nx1768);
    u2_reg_int : DFC1 port map(CLK => nwrs_int, CLR => 
        u2_nx160_1_net, D => u2_PWR_1_net, Q => port3_dup0_3_net);
    u1_ix4486_ix83 : DL1 port map(D => nx153, G => 
        u1_ix4486_nx537_1_net, Q => u1_ix4486_a_5_net);
    u1_ix4486_nx509 : NOR3 port map(A => address_dup0_1_net, B => 
        nx136, C => nx133, Y => u1_ix4486_nx509_1_net);
    ix209 : INBUF port map(PAD => code(1), Y => code_1_int);
    ix162 : BIBUF port map(PAD => port3(4), D => GND0_1_net, E => 
        GND0_1_net, Y => port3_4_int);
    u1_ix4486_nx537 : AND3B port map(A => nx135, B => 
        address_dup0_3_net, C => address_dup0_2_net, Y => 
        u1_ix4486_nx537_1_net);
    u1_ix4486_ix439 : DL1 port map(D => nx148, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_dup_3650);
    u1_ix4486_modgen_160_mi_ax_ax_2_a0 : MX4 port map(D0 => 
        u1_ix4486_a_8_dup_3602, D1 => u1_ix4486_a_9_dup_3601, 
        D2 => u1_ix4486_a_10_dup_3600, D3 => 
        u1_ix4486_a_11_dup_3599, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_160_mi_ax_int_r_2_net);
    ix240 : BUFA port map(A => port0_0_int, Y => nx151);
    ix167 : TRIBUFF port map(PAD => port2(1), D => GND0_1_net, 
        E => GND0_1_net);
    u1_ix4486_modgen_156_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3502, D1 => u1_ix4486_a_1_dup_3501, 
        D2 => u1_ix4486_a_2_dup_3500, D3 => 
        u1_ix4486_a_3_dup_3499, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_156_mi_ax_int_r_0_net);
    ix227 : NOR2 port map(A => address_dup0_3_net, B => nx136, 
        Y => nx138);
    u1_ix4486_ix179 : DL1 port map(D => nx156, G => 
        u1_ix4486_nx501_1_net, Q => u1_ix4486_a_14_dup_3542);
    u0_lat_outp_0_1 : DL1 port map(D => nx151, G => ale_int, Q => 
        address_0_XX1);
    u2_ix218_aclrb : INV port map(A => reset_int, Y => 
        u2_ix218_aclrb_1_net);
    u0_lat_outp_4_inst : OBDLHS port map(G => ale_int, PAD => 
        address(4), D => nx142);
    ix243 : BUFA port map(A => port0_6_int, Y => nx154);
    u2_reg_reg_4_inst : DFMB port map(A => datas_4_int, B => 
        u2_reg_4_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_4_net);
    u2_nx104 : INV port map(A => port3_1_int, Y => u2_nx104_1_net);
    u1_ix1781 : DLMA port map(A => u1_nx47_1_net, B => nx156, 
        S => port3_7_int, G => nx129, Q => u1_nx1780);
    ix168 : TRIBUFF port map(PAD => port2(2), D => GND0_1_net, 
        E => GND0_1_net);
    u1_ix4486_modgen_160_mi_ax_ax_3_a0 : MX4 port map(D0 => 
        u1_ix4486_a_12_dup_3598, D1 => u1_ix4486_a_13_dup_3597, 
        D2 => u1_ix4486_a_14_dup_3596, D3 => 
        u1_ix4486_a_15_dup_3595, S0 => address_0_XX1, S1 => 
        address_1_XX1, Y => 
        u1_ix4486_modgen_160_mi_ax_int_r_3_net);
    u2_reg_reg_1_inst : DFMB port map(A => datas_1_int, B => 
        u2_reg_1_net, S => busy_dup0, CLR => u2_ix218_aclrb_1_net, 
        CLK => nwrs_int, Q => u2_reg_1_net);
    u1_ix4486_ix191 : DL1 port map(D => nx156, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_dup_3545);
    u1_ix4486_ix292 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx549_1_net, Q => u1_ix4486_a_2_dup_3581);
    ix226 : OR2A port map(A => address_dup0_3_net, B => 
        address_dup0_2_net, Y => nx137);
    u1_ix4486_ix386 : DL1 port map(D => nx146, G => 
        u1_ix4486_nx513_1_net, Q => u1_ix4486_a_11_dup_3626);
    ix235 : BUFA port map(A => port0_2_int, Y => nx146);
    u1_ix4486_modgen_163_mi_ax_ax_1_a0 : MX4 port map(D0 => 
        u1_ix4486_a_4_dup_3687, D1 => u1_ix4486_a_5_dup_3686, 
        D2 => u1_ix4486_a_6_dup_3685, D3 => 
        u1_ix4486_a_7_dup_3684, S0 => address_dup0_0_net, S1 => 
        address_dup0_1_net, Y => 
        u1_ix4486_modgen_163_mi_ax_int_r_1_net);
    u1_ix4486_modgen_157_mi_ax_ax_0_a0 : MX4 port map(D0 => 
        u1_ix4486_a_0_dup_3529, D1 => u1_ix4486_a_1_dup_3528, 
        D2 => u1_ix4486_a_2_dup_3527, D3 => 
        u1_ix4486_a_3_dup_3526, S0 => address_0_XX0, S1 => 
        address_1_XX0, Y => 
        u1_ix4486_modgen_157_mi_ax_int_r_0_net);
    u1_ix4486_ix276 : DL1 port map(D => nx143, G => 
        u1_ix4486_nx533_1_net, Q => u1_ix4486_a_6_dup_3577);
end DEF_ARCH;
