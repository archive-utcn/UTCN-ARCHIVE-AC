set delay 7
clear

@echo "Inserts breakpoint at the begining of the 'Simulator' function"
gdb break Stimulator
@pause $delay
@clear

run		
@clear

@echo "Inserts breakpoint in line 95 (current_line + 5)"
gdb break +5
@pause $delay
@clear

@echo "Displays information about breakpoints"
gdb info breakpoints
@pause $delay
@clear

@echo "Displays value of the 'ch' variable (hexadecimal format)"
gdb print /x ch
@pause $delay  
run			   
@clear

@echo "Displays value of the 'ch' variable (character format)"
gdb print /c ch
@pause $delay
@clear

@echo "Sets value of the 'return_value' variable to ch+23"
gdb set return_value=ch+23
gdb print return_value
@pause $delay
@clear

@echo "Ignores breakpoint no.12 (in line 95) three times"
gdb ignore 12 3
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

@echo "Prints value of the 'character' variable each time the program stops"
gdb display /d character
@pause $delay			
gdb step 2
@pause $delay
@clear
gdb step 9	 
@pause $delay
@clear

@echo "Delete breakpoint at the begining of the 'Stimulator' function"
gdb clear Stimulator
@pause $delay
@clear

@echo "Delete breakpoint no.12 (in line 95)"
gdb delete 12
@pause $delay
@clear

@echo "End of debug session"
endsim