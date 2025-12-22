set delay 7
clear

@echo "Inserts breakpoint at the begining of the 'oscil_interface_misctf' function"
gdb break oscil_interface_misctf
@pause $delay
@clear

run		
@clear

@echo "Inserts breakpoint in line 54 (current_line + 22)"
gdb break +22
@pause $delay
@clear

@echo "Displays information about breakpoints"
gdb info breakpoints
@pause $delay
@clear

@echo "Displays value of the 'Q' variable (hexadecimal format)"
gdb print /x Q
@pause $delay  
run			   
@clear

@echo "Displays value of the 'Q' variable (character format)"
gdb print /c Q
@pause $delay
@clear

@echo "Sets value of the 'Q' variable to 7"
gdb set Q=7
gdb print Q
@pause $delay
@clear

@echo "Ignores breakpoint no.8 (in line 54) three times"
gdb ignore 8 3
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

@echo "Delete breakpoint at the begining of the 'oscil_interface_misctf' function"
gdb clear oscil_interface_misctf
@pause $delay
@clear

@echo "Delete breakpoint no.8 (in line 54)"
gdb delete 8
@pause $delay
@clear

@echo "End of debug session"
endsim