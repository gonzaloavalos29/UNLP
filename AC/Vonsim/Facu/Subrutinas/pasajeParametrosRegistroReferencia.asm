ORG 1000H
NUM DW 4
RES DB ?

ORG 3000H
ESPAR: MOV BX, AX
  AND WORD PTR [BX], 0001H
  JZ PAR
  MOV BX, CX
  MOV BYTE PTR [BX], 00H
JMP FIN
PAR: MOV BX, CX
  MOV BYTE PTR [BX], 0FFH
FIN: RET

ORG 2000H
MOV AX, OFFSET NUM
MOV CX, OFFSET RES
CALL ESPAR

HLT
END