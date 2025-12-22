set delay 7
clear

@echo "Inserts breakpoint at the begining of the 'read_byte_ex_calltf' function"
gdb break read_byte_ex_calltf
@pause $delay
@clear

run		
@clear 

@echo "Inserts breakpoint in line 61 (current_line + 18)"
gdb break +18
@pause $delay
@clear

@echo "Displays information about breakpoints"
gdb info breakpoints
@pause $delay
@clear

@echo "Displays value of the 'val' variable (hexadecimal format)"
gdb print /x val
@pause $delay  
run			   
@clear 

@echo "Displays value of the 'val' variable (character format)"
gdb print /c val
@pause $delay
@clear

@echo "Ignores breakpoint no.10 (in line 61) three times"
gdb ignore 10 3
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
@clear 

@echo "Prints value of the 'val' variable each time the program stops"
gdb display /d val
@pause $delay			
gdb step
@pause $delay
@clear
@run
gdb step
@pause $delay
@clear 

@echo "Delete breakpoint at the begining of the 'read_byte_ex_calltf' function"
gdb clear read_byte_ex_calltf
@pause $delay
@clear

@echo "Delete breakpoint no.10 (in line 61)"
gdb delete 10
@pause $delay
@clear

@echo "End of debug session"
endsim