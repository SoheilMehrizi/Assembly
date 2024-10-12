org 100h
.data
    Message DB "NOMBER: $"
    DIGIT1 DB ?
    DIGIT2 DB ?
    BINARY DB ?
.code
    START:
        ; Displaying the Message 
        LEA DX, Message
        MOV AH, 09
        INT 21H
        ; Getting the first digit through keypad
        MOV AH,01
        INT 21H
        ; CONVERTING THE ASCII ENTERED DIGIT INTO BCD
        SUB AL, 30H
        MOV DIGIT1, AL
        ; NOW THAT WE'RE HAVING THE FIRST DIGIT WE SHOULD GET THE SECOND ONE
        MOV AH, 09
        INT 21H
        ; GETIING THE SECOND DIGIT
        MOV AH, 01
        INT 21H
        ; CONVERTING KEYBOARD ENTERED DIGIT INTO BCD
        SUB AL, 30H
        MOV DIGIT2, AL
        ; COVERTING TWO BCD DIGIT INTO BINARY
        MOV AL, DIGIT1
        MOV AH, DIGIT2
        
        MOV BL, AH
        MOV CL, 10
        MUL CL
        
        ADD AL, BL
        
        MOV BINARY, AL
        
        ; EXIT TO DOS
        MOV AH, 4CH
        INT 21H
        RET