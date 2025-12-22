library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;

package DEFAULTS is
   CONSTANT DefPropDelay01	: VitalDelayType01	:= (0 ns, 0 ns);
   CONSTANT DefGlitchMode	: VitalGlitchKindType	:= OnEvent;
   CONSTANT DefGlitchMsgOn	: BOOLEAN	:= TRUE;
   CONSTANT DefGlitchXOn	: BOOLEAN	:= FALSE;
end DEFAULTS;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
use work.DEFAULTS.all;

entity AND3 is
   generic(
      TimingChecksOn: Boolean := True;
      XGenerationOn: Boolean := False;
      MsgOn: Boolean := DefGlitchMsgOn;
      XOn: Boolean := DefGlitchXOn;
      InstancePath: STRING := "*";
      tpd_IN1_Y                      :	VitalDelayType01 := DefPropDelay01;
      tpd_IN2_Y                      :	VitalDelayType01 := DefPropDelay01;
      tpd_IN3_Y                      :	VitalDelayType01 := DefPropDelay01;
      tipd_IN1                       :	VitalDelayType01 := DefPropDelay01;
      tipd_IN2                       :	VitalDelayType01 := DefPropDelay01;
      tipd_IN3                       :	VitalDelayType01 := DefPropDelay01);

   port(
      Y                              :	out   STD_LOGIC;
      IN1                            :	in    STD_LOGIC;
      IN2                            :	in    STD_LOGIC;
      IN3                            :	in    STD_LOGIC);
   attribute VITAL_LEVEL0 of AND3 : entity is TRUE;
end AND3;



architecture AND3VITAL of AND3 is
   attribute VITAL_LEVEL1 of AND3VITAL : architecture is TRUE;

   SIGNAL IN1_ipd	 : STD_ULOGIC := 'U';
   SIGNAL IN2_ipd	 : STD_ULOGIC := 'U';
   SIGNAL IN3_ipd	 : STD_ULOGIC := 'U';

begin
  
   WireDelay : block
   begin
   VitalWireDelay (IN1_ipd, IN1, tipd_IN1);
   VitalWireDelay (IN2_ipd, IN2, tipd_IN2);
   VitalWireDelay (IN3_ipd, IN3, tipd_IN3);
   end block;
 
   VITALBehavior : process (IN1_ipd, IN2_ipd, IN3_ipd)


  
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');
   ALIAS Y_zd : STD_ULOGIC is Results(1);

  
   VARIABLE Y_GlitchData	: VitalGlitchDataType;

   begin

  
      Y_zd := (IN2_ipd) AND (IN1_ipd) AND (IN3_ipd);

 
      VitalPathDelay01 (
       OutSignal => Y,
       OutSignalName => "Y",
       OutTemp => Y_zd,
       Paths => (0 => (IN1_ipd'last_event, tpd_IN1_Y, TRUE),
                 1 => (IN2_ipd'last_event, tpd_IN2_Y, TRUE),
                 2 => (IN3_ipd'last_event, tpd_IN3_Y, TRUE)),
       GlitchData => Y_GlitchData,
       Mode => DefGlitchMode,
       XOn  => XOn,
       MsgOn        => MsgOn );

end process;

end AND3VITAL;

