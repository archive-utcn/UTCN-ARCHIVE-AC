set delay 7
clear

@echo "Inserts breakpoint at the begining of the 'SignalChangedEvent' function"
gdb break SignalChangedEvent
@pause $delay
@clear

run		
@clear

@echo "Inserts breakpoint in line 80"
gdb break oscil_c_vhpi.c:80
@pause $delay
@clear

@echo "Displays information about breakpoints"
gdb info breakpoints
@pause $delay
@clear 

@echo "Displays value of the 'signalValue' variable (hexadecimal format)"
gdb print /x signalValue
@pause $delay  
run			   
@clear

@echo "Displays value of the 'signalValue' variable (character format)"
gdb print /c signalValue
@pause $delay
@clear 

@echo "Sets value of the 'Q' variable to 3"
gdb set Q=3
gdb print Q
@pause $delay
@clear

@echo "Ignores breakpoint no.6 (in line 80) three times"
gdb ignore 6 3
@pause $delay
@run 
@pause 2
@echo "first ignoring..."
run
@pause 2
@echo "second ignoring..."
run
@pause 2
@echo "third ignoring"
run
@pause 2
@run
@pause $delay
@run					
@run
@clear

@echo "Prints value of the 'invec_data' variable each time the program stops"
gdb display /d invec_data
@pause $delay			
gdb step
@pause $delay
@run
@clear
gdb step 
@pause $delay
@clear

@echo "Delete breakpoint at the begining of the 'SignalChangedEvent' function"
gdb clear SignalChangedEvent
@pause $delay
@clear

@echo "Delete breakpoint no.6 (in line 80)"
gdb delete 6
@pause $delay
@clear

@echo "End of debug session"
endsim