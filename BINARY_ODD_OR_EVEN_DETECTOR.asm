; RECTANGULAR PRINTING 0 TO 9

ORG 100H

NEXTLINE DB 10,13,'$'

X DB 00H,'$'

.code

mov CX,10
MOV AX,1

NEXT_LINE:
    PUSH CX                       ; GIVES THE CX THE TEMPRORARY VALUE OF AX FOR INNER LOOP
    MOV CX,AX
    MOV BX,0
    NEXT_DIGIT:
        MOV X,BL
        ADD X,30H
        LEA DX,X
        CALL PRINT
        INC BX                                    
    LOOP NEXT_DIGIT; LOOPS TILL CX = 0
    POP CX                                        ;POPING THE REAL VALUE OF CX FOR PRIME LOOP
    LEA DX,NEXLINE
    CALL PRINT                                    ;INCREMENTING THE INNER LOOP COUNTER
    INC AX
LOOP NEXT_LINE ; LOOPS TILL CX = 0
