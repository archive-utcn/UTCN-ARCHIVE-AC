DESCRIPTION:       
	Project FILTER is a sample implementation of a digital low pass filter.
	TOP-LEVEL - filter.bde schematic.

DESING TYPE: 
	XILINX  (library VIRTEX)

CONTROLS (Inputs):
        NI[3:0] - input of a digitized 4-bit signal.
        CLK - clock input, the active edge is the falling edge.
        RESET - asynchronous reset, active in HIGH.

OUTPUTS:
        NO[3:0] - output of a processed 4-bit signal.

DESCRIPTION:
        The design is based upon two programmable frequency dividers and one
        reversible counter. A digitized 4-bit signal is passed to the NI input,
        which controls the first frequency divider (H1). Thus, the frequency of
        the output signal from the H1 divider is a linear function of the NI
        value. The signal is passed to the count-up input of the reversible
        counter H3 which operates as an integrator. The counter output (NO)
        controls the other programmable frequency divider (H2). The output of
        the H2 divider is connected to the count-down input of the reversible
        counter, thus forming a feedback loop. Both frequency dividers are fed
        with clock pulses of the same frequency but of different phases. This
        inhibits coincidence of impulses occurring on the inputs of the
        reversible counter. The output value NO is described by the following
        Laplace transform:

          NO(s) = NI/(1+sT)

        where:

          T = 2n/fi
          fi = frequency of the clock signal fed to both programmable frequency
               dividers.

        With the input driven by the finite jump NI*1(t), the output response
        is as follows:

          NO = NI (1-e-t/T).

TIMINGS:
		Filter_f.awf - functional simulation results
		PFDIV.awf  - test vectors for functional simulation of PFDIV macro

