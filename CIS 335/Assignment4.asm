; Author: William McCartney
; Program Name: CIS 335 Assignement 5
; Program Description: randomly generate a color by set values
; Date: 30 November 2022 

INCLUDE Irvine32.inc

.data
intArr SDWORD 20 DUP(?); creates an uninitialized array with type SDWORD (4 bytes)
whiteCount DWORD 0; variable for storing the amount of white numbers
blueCount DWORD 0; variable for storing the amount of blue numbers
greenCount DWORD 0; variable for storing the amount of green numbers
msg byte "this is a string made up of random colors"
.code
main PROC
call Randomize; gets a random seed
mov esi, OFFSET intArr; finds the location of first element of intArr
mov ecx, LENGTHOF intArr; how many times will it loop
mov eax, 10;
L1:
Call RandomRange; gets a random value from the seed
mov [esi], eax
add esi, 4
loop l1
;no fuckin clue if this part is right

;this is from notes in class and between these comments im kinda lost 
mov esi, OFFSET intArr
mov ecx, LENGTHOF intArr
L2:
cmp SDWORD ptr[esi], 9; this compares whether the contents of esi is less than, equal to, or greater than 8 and is blue
jge L3; if it is greater than or equal to 0 then it will not complete the increment count
cmp SDWORD ptr[esi], 6; this compares whether the contents of esi is less than, equal to, or greater than 5 and is white
jge L4; if it is not white or blue then it is green
jmp L5; we may be able to run all these different jumps and loops as different methods to call (Call GreenCountIncrease or some shit like that)
L5:
inc greenCount
add esi, 4
loop L2
L4:
inc whiteCount
add esi, 4
loop L2
L3:
inc blueCount
add esi, 4
loop L2
;add a way for the numbers to correspond to the string i think
Call SetTextColor
Call WriteString
Call Crlf
;end the program

 exit
main ENDP
END main