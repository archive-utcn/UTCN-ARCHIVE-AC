set delay 7
clear

@echo "Inserts breakpoint at the begining of the 'traverse_hierarchy' function"
gdb break traverse_hierarchy
@pause $delay
@clear

@run
clear

@echo "Inserts breakpoint in line 51 (current_line + 10)"
gdb break +10
@pause $delay
@clear

@echo "Displays information about breakpoints"
gdb info breakpoints
@pause $delay
@clear

@echo "Displays value of the 'Hdl' variable (hexadecimal format)"
gdb print /x Hdl
@pause $delay  
run			   
@clear 

@echo "Displays value of the 'Hdl' variable (character format)"
gdb print /c Hdl
@pause $delay
@clear

@echo "Ignores breakpoint no.6 (in line 51) three times"
gdb ignore 6 3
@pause $delay
@run 
@clear
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
@clear

@echo "Prints value of the 'Hdl' variable each time the program stops"
gdb display /d Hdl
@pause $delay			
gdb step 2
@pause $delay
@clear
gdb step 5	 
@pause $delay
@clear 
gdb step 5	 
@pause $delay
@clear

@echo "Delete breakpoint at the begining of the 'traverse_hierarchy' function"
gdb clear traverse_hierarchy
@pause $delay
@clear

@echo "Delete breakpoint no.6"
gdb delete 6
@pause $delay
@clear

@echo "End of debug session"
endsim