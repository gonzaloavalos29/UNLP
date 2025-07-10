.data
A: .word 3
B: .word 5
C: .word 0

.code
LD R1, A(R0)
LD R2, B(R0)

DADD R3, R0, R0
LAZO: DADD R3, R3, R2
	DADDI R1, R1, -1
	BNEZ R1, LAZO
SD R3, C(R0)
HALT