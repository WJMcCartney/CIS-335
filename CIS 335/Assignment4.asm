; Author: William McCartney
; Program Name: CIS 335 Assignement 5
; Program Description: randomly generate a color by set values
; Date: 30 November 2022 
INCLUDE Irvine32.inc
.data
intArr SDWORD 20 DUP(?); creates an uninitialized array with type SDWORD (4 bytes)
msg byte "this is a string made up of random colors", 0
testingVar SDWORD ?
.code
main PROC
call Randomize; gets a random seed
mov esi, OFFSET intArr; finds the location of first element of intArr
mov ecx, LENGTHOF intArr; how many times will it loop
Loop1:
mov eax, 10;
Call RandomRange; gets a random value from the seed
inc eax
mov [esi], eax
add esi, 4
loop Loop1
mov esi, OFFSET intArr
mov ecx, LENGTHOF intArr
inc ecx; starting the counter at +1 so that we can decrement immediately because the loops did not work
Loop2:
dec ecx
cmp ecx, 0
je EndProgramHere; end the loop if it reaches here
cmp SDWORD ptr[esi], 10; this compares whether the contents of esi is less than, equal to, or greater than 10 and is blue
jge Loop3; if it is greater than or equal to 0 then it will not complete the increment count
cmp SDWORD ptr[esi], 7; this compares whether the contents of esi is less than, equal to, or greater than 7 and is white
jge Loop4; if it is not white or blue then it is green
cmp SDWORD ptr[esi], 1
je Loop5; we may be able to run all these different jumps and loops as different methods to call (Call GreenCountIncrease or some shit like that)
Loop5:
mov eax, green; last jump goes here and sets eax to irvine32 green
Call SetTextColor; uses irvine32 to set the color to green
mov edx, OFFSET msg; sets edx to our message
Call WriteString; writes the message
CALL CRLF; sets it to a new line
add esi, 4
jmp Loop2; go back to beginning of loop
Loop4:
mov eax, white; second jump goes here and sets eax to irvine32 white
Call SetTextColor; uses irvine32 to set the color to green
mov edx, OFFSET msg; sets edx to our message
Call WriteString; writes the message
CALL CRLF; sets it to a new line
add esi, 4
jmp Loop2
Loop3:
mov eax, blue; first jump goes here and sets eax to irvine32 blue
Call SetTextColor; uses irvine32 to set the color to green
mov edx, OFFSET msg; sets edx to our message
Call WriteString; writes the message
CALL CRLF; sets it to a new line
add esi, 4
jmp Loop2
EndProgramHere:
;end the program
 exit
main ENDP
END main