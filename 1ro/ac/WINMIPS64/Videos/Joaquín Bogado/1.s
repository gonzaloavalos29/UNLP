; C = A + B

.data
A: .word 10
B: .word 8
C: .word 0

.code
main: ld r4, A($0)
      ld r5, A(8)
      dadd r3, r4, r5
      sd r3, C(r0)
      HALT