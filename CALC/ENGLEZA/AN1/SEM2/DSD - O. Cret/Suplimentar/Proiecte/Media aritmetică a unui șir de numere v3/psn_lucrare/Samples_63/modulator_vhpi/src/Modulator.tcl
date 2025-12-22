#------------------------------------------------------------------------------
#-- Subject     : Waveform and Tcl/Tk Demo
#-- File name   : Modulator.tcl
#-- Revision    : 2.6
#-- Date        : 02/02/00
#-- Developer   : Michal Pacula
#-- Copyright   : (C) 1999 ALDEC Inc.
#-- Description : Tcl/Tk Graphical Interface for Modulator project.
#------------------------------------------------------------------------------

## BEGIN SETTINGS ##
wm withdraw . 		  
package require mmedia
package require ::aldec::scripter 1.0 
set dsn [::aldec::scripter::GetVariable "dsn"] 
#####################

## COMPILATION AND INITIALIZATION ##
acom {$dsn\src\VHPI\generator_vhpi.vhd}	 
buildc {$dsn\src\VHPI\modulator_vhpi.dlm}
acom {$dsn\src\Multiplier.vhd}
acom {$dsn\src\Modulator.bde}

	  
if {![asim -callbacks Modulator]} {
	PrintString "TCL: Cannot initialize simulation - aborting script..." 1
	exit
} else {

###################################

## PREPARING FOR SIMULATION ##
	
		::aldec::scripter::ExecuteScript "open" {-wave $dsn\src\wave1.awf}
		force CLK 0 0, 1 500 ps -r 1000 ps	   
	
## GUI SETTINGS ##
	
		proc positionWindow . {
	    wm geometry . +300+300
	}
	proc ButtonSound {SoundNumber} {
	global dsn	 
	switch $SoundNumber {
		1	{sndPlay -async -nodefault [file join $dsn src2 sounds "Utopia Default.wav"]}
		2	{sndPlay -async -nodefault [file join $dsn src2 sounds "Utopia Minimize.wav"]}
		3	{sndPlay -async -nodefault [file join $dsn src2 sounds "Utopia Recycle.wav"]}
		4	{sndPlay -async -nodefault [file join $dsn src2 sounds "Utopia Exclamation.wav"]}
		5	{sndPlay -async -nodefault [file join $dsn src2 sounds "Utopia Question.wav"]}
		6	{sndPlay -async -nodefault [file join $dsn src2 sounds "Utopia Windows Exit.wav"]}
		}
	}
	
	proc ExitProc {} {
	noforce sinfreq
	noforce sinenable
	noforce sawfreq
	noforce sawenable
	noforce cosfreq
	noforce cosenable
	noforce clk	 
	endsim
	}			 
	
	wm iconify .
	wm deiconify .		  
	set . .button 
	set . .label
	
	wm title . "MODULATOR ON TCL/TK"
	wm iconname . "button"		
	wm iconname . "label"
	positionWindow .
	
	frame .labels -relief raised -bd 1
	image create photo Modulator \
		-file [file join $dsn src2 images ModulatorIcon.gif] 
	label .labels.image -image Modulator
	
	label .labels.msg -wraplength 5i -justify left -text "The Modulator contains three oscillators.
	The buttons labeled SIN, COS and SAW activate appropriate oscillators      
	whose frequencies are controlled by the sliders located below the buttons.         
	RESTART - restarts simulation.
	100ns - advances simulation by 100 ns.
	EXIT - ends simulation and exits the dialog."
	pack .labels.image .labels.msg -side left -expand yes
	pack .labels -side top -pady 1 -expand yes 
	
	frame .sine -relief raised -bd 1  
	frame .cosine -relief raised -bd 1 
	frame .saw -relief raised -bd 1 
	frame .buttons -relief raised -bd 1 
	pack .sine .cosine .saw .buttons  -side left -expand yes 	-pady 1
	
	image create photo SinOff \
		-file [file join $dsn src2 images SinOff.gif] 
	image create photo SinOn \
		-file [file join $dsn src2 images SinOn.gif] 
	checkbutton .sine.b1 -image SinOff -selectimage SinOn -variable SinEnable\
		-indicatoron 0 -command "ButtonSound {2}"
	.sine.b1 configure -selectcolor [.sine.b1 cget -background]  
	.sine.b1 select
	scale .sine.scale -font system -orient vertical -length 200 -from 1 -to 100  -tickinterval 99 -label "MHz" -variable SinFreq  -command "ButtonSound {1};set temp1"
	
	pack .sine.b1 .sine.scale -side top 
	.sine.scale set 1
	
	image create photo CosOff \
		-file [file join $dsn src2 images CosOff.gif] 
	image create photo CosOn \
		-file [file join $dsn src2 images CosOn.gif] 
	checkbutton .cosine.b2 -image CosOff -selectimage CosOn -variable CosEnable\
		-indicatoron 0  -command "ButtonSound {2}"		   	  
	.cosine.b2 configure -selectcolor [.cosine.b2 cget -background]
	.cosine.b2 select
	scale .cosine.scale -font system -orient vertical -length 200 -from 1 -to 100  -tickinterval 99 -label "MHz" -variable CosFreq  -command "ButtonSound {1};set temp1"
	pack .cosine.b2 .cosine.scale -side top
	.cosine.scale set 4
	
	image create photo SawOff \
		-file [file join $dsn src2 images SawOff.gif] 
	image create photo SawOn \
		-file [file join $dsn src2 images SawOn.gif] 
	checkbutton .saw.b3 -image SawOff -selectimage SawOn -variable SawEnable\
		-indicatoron 0  -command "ButtonSound {2}"	
	.saw.b3 configure -selectcolor [.saw.b3 cget -background]	 
	.saw.b3 select
	scale .saw.scale -font system -orient vertical -length 200 -from 1 -to 100  -tickinterval 99 -label "MHz" -variable SawFreq  -command "ButtonSound {1};set temp1"
	pack .saw.b3 .saw.scale -side top
	.saw.scale set 70
	
	
	button .buttons.restart -font system -text "RESTART" -width 13 -height 3 \
	    -command "ButtonSound {4};::aldec::scripter::ExecuteScript restart;"
	button .buttons.100ns -font system -text "100NS" -width 13 -height 3 \
	    -command "ButtonSound {5};Run100ns;"
	proc Run100ns {} {	   
	global SinFreq CosFreq SawFreq SinEnable CosEnable SawEnable	 
	force sinfreq $SinFreq
	force cosfreq $CosFreq
	force sawfreq $SawFreq
	force sinenable $SinEnable
	force cosenable $CosEnable
	force sawenable $SawEnable
	run 100 ns
	}
	label .buttons.label1 -text "" -width 10  
	label .buttons.label2 -text "" -width 15 -height 3
	label .buttons.label3 -text "" -width 10
	label .buttons.label4 -text "" -width 10
	
	button .buttons.exit -font system -text "EXIT" -width 13 -height 3 \
		-command "ButtonSound {3};ExitProc; destroy ;set end_tcl true; exit"
	pack .buttons .buttons.restart .buttons.label1 .buttons.100ns  .buttons.label2 .buttons.label3 .buttons.label4 .buttons.exit -side top -expand 1
	
	wm protocol . WM_DELETE_WINDOW "ExitProc;set end_tcl true; exit"
}