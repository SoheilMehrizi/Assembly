ORG 100H

.DATA

STR1 DB "I HAVE 30$"

LEN DB 00H

.CODE

MOV AX,@DATA

MOV DS, AX
MOV SI, 0102H

MOV ES,AX

MOV DI,0102H

NEX_CHARACTER:
MOV DI,SI

LOADSB