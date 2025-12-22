/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "F:/project-darabok/automat_bancar/test2.vhd";
extern char *IEEE_P_3620187407;



static void work_a_2968898858_3028989367_p_0(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 3552);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 6654);
    t6 = (4U != 4U);
    if (t6 == 1)
        goto LAB2;

LAB3:    t3 = (t0 + 3680);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 4U);
    xsi_driver_first_trans_delta(t3, 16U, 4U, 0LL);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 6658);
    t6 = (4U != 4U);
    if (t6 == 1)
        goto LAB4;

LAB5:    t3 = (t0 + 3680);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 4U);
    xsi_driver_first_trans_delta(t3, 12U, 4U, 0LL);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 6662);
    t6 = (4U != 4U);
    if (t6 == 1)
        goto LAB6;

LAB7:    t3 = (t0 + 3680);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 4U);
    xsi_driver_first_trans_delta(t3, 8U, 4U, 0LL);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 6666);
    t6 = (4U != 4U);
    if (t6 == 1)
        goto LAB8;

LAB9:    t3 = (t0 + 3680);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 4U);
    xsi_driver_first_trans_delta(t3, 4U, 4U, 0LL);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 6670);
    t6 = (4U != 4U);
    if (t6 == 1)
        goto LAB10;

LAB11:    t3 = (t0 + 3680);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 4U);
    xsi_driver_first_trans_delta(t3, 0U, 4U, 0LL);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 6674);
    t6 = (3U != 3U);
    if (t6 == 1)
        goto LAB12;

LAB13:    t3 = (t0 + 3744);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 3U);
    xsi_driver_first_trans_delta(t3, 12U, 3U, 0LL);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 6677);
    t6 = (3U != 3U);
    if (t6 == 1)
        goto LAB14;

LAB15:    t3 = (t0 + 3744);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 3U);
    xsi_driver_first_trans_delta(t3, 9U, 3U, 0LL);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 6680);
    t6 = (3U != 3U);
    if (t6 == 1)
        goto LAB16;

LAB17:    t3 = (t0 + 3744);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 3U);
    xsi_driver_first_trans_delta(t3, 6U, 3U, 0LL);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 6683);
    t6 = (3U != 3U);
    if (t6 == 1)
        goto LAB18;

LAB19:    t3 = (t0 + 3744);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 3U);
    xsi_driver_first_trans_delta(t3, 3U, 3U, 0LL);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 6686);
    t6 = (3U != 3U);
    if (t6 == 1)
        goto LAB20;

LAB21:    t3 = (t0 + 3744);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 3U);
    xsi_driver_first_trans_delta(t3, 0U, 3U, 0LL);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6524U);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t9 = (0 - 4);
    t10 = (t9 * -1);
    t11 = (4U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 3;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 3);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB22;

LAB24:
LAB23:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6524U);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t9 = (1 - 4);
    t10 = (t9 * -1);
    t11 = (4U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 3;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 3);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB28;

LAB30:
LAB29:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6524U);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t9 = (2 - 4);
    t10 = (t9 * -1);
    t11 = (4U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 3;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 3);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB34;

LAB36:
LAB35:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6524U);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t9 = (3 - 4);
    t10 = (t9 * -1);
    t11 = (4U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 3;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 3);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB40;

LAB42:
LAB41:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6524U);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t9 = (4 - 4);
    t10 = (t9 * -1);
    t11 = (4U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 3;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 3);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB46;

LAB48:
LAB47:    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB3;

LAB4:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB5;

LAB6:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB7;

LAB8:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB9;

LAB10:    xsi_size_not_matching(4U, 4U, 0);
    goto LAB11;

LAB12:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB13;

LAB14:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB15;

LAB16:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB19;

LAB20:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB21;

LAB22:    xsi_set_current_line(72, ng0);
    t7 = (t0 + 3616);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6508U);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t9 = (0 - 4);
    t10 = (t9 * -1);
    t11 = (3U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 2;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 2);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB25;

LAB27:
LAB26:    goto LAB23;

LAB25:    xsi_set_current_line(74, ng0);
    t7 = (t0 + 3552);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 3808);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 0;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB26;

LAB28:    xsi_set_current_line(80, ng0);
    t7 = (t0 + 3616);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6508U);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t9 = (1 - 4);
    t10 = (t9 * -1);
    t11 = (3U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 2;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 2);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB31;

LAB33:
LAB32:    goto LAB29;

LAB31:    xsi_set_current_line(82, ng0);
    t7 = (t0 + 3552);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(83, ng0);
    t1 = (t0 + 3808);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 1;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB32;

LAB34:    xsi_set_current_line(88, ng0);
    t7 = (t0 + 3616);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6508U);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t9 = (2 - 4);
    t10 = (t9 * -1);
    t11 = (3U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 2;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 2);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB37;

LAB39:
LAB38:    goto LAB35;

LAB37:    xsi_set_current_line(90, ng0);
    t7 = (t0 + 3552);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 3808);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB38;

LAB40:    xsi_set_current_line(96, ng0);
    t7 = (t0 + 3616);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6508U);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t9 = (3 - 4);
    t10 = (t9 * -1);
    t11 = (3U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 2;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 2);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB43;

LAB45:
LAB44:    goto LAB41;

LAB43:    xsi_set_current_line(98, ng0);
    t7 = (t0 + 3552);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 3808);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB44;

LAB46:    xsi_set_current_line(104, ng0);
    t7 = (t0 + 3616);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6508U);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t9 = (4 - 4);
    t10 = (t9 * -1);
    t11 = (3U * t10);
    t12 = (0 + t11);
    t3 = (t4 + t12);
    t5 = (t13 + 0U);
    t7 = (t5 + 0U);
    *((int *)t7) = 2;
    t7 = (t5 + 4U);
    *((int *)t7) = 0;
    t7 = (t5 + 8U);
    *((int *)t7) = -1;
    t14 = (0 - 2);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t7 = (t5 + 12U);
    *((unsigned int *)t7) = t15;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t13);
    if (t6 != 0)
        goto LAB49;

LAB51:
LAB50:    goto LAB47;

LAB49:    xsi_set_current_line(106, ng0);
    t7 = (t0 + 3552);
    t8 = (t7 + 56U);
    t16 = *((char **)t8);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 3808);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 4;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB50;

}


extern void work_a_2968898858_3028989367_init()
{
	static char *pe[] = {(void *)work_a_2968898858_3028989367_p_0};
	xsi_register_didat("work_a_2968898858_3028989367", "isim/main_isim_beh.exe.sim/work/a_2968898858_3028989367.didat");
	xsi_register_executes(pe);
}
