ORG 100H
.DATA

MAT DB 3, -1, 8, 6
    DB -6, 9 ,12
    DB 7, 2 ,1

NO DB 00H, 00H, 00H, 24H

.CODE

MOV CX,10

MOV SI,1

MOV DL, MAT

FIRST:

    CMP DL, MAT+SI
    JG NXT
    MOV DL, MAT+SI
NXT:
    INC SI
    LOOP FIRST

CALL BIN2ASCII

RET


BIN2ASCII:
    MOV SI,1 ; USING SI AS SIGN HOLDER
    CMP DL, 0
    JGE POSITIVE ; CHECK IF THE NUMBER IS GREATER OR LOWER THAT 0
    
    ; IF IT WAS LOWER
    NEG DL
    MOV SI, 0 ; ITS A NEGETIVE NUMBER
    
    MOV NO, '-'
    
    
    POSITIVE:
        MOV AL,DL
        MOV AH,00H
        MOV CL,10
        DIV CL
        ; DIVIDANCE INTO AL AND REMAINING INTO AH
        ADD AH, 30H
        ADD AL,30H
        
        MOV NO+1,AL
        MOV NO+2, AH
        
        LEA DX, NO+SI
        
        MOV AH,09H
        INT 21H
        
RET
    