.data
datos: .word 2, 4, 6

.code
daddi $s0, $0, 3 # r2, r0, 3
daddi $s1, $0, 0 # r3, r0, 0
loop: ld $a0, datos($s1) # ld r4, datos(r3)
      jal por2
      sd $v0, datos($s1) # sd r5, datos(r3)
      daddi $s1, $s1, 8 # daddi r2, r2, -1
      daddi $s0, $s0, -1 # daddi r2, r2, -1
      bnez $s0, loop # bnez r2, loop
por2: daddi $t0, $0, 2 # daddi r6, r0, 2
      dmul $v0, $a0, $t0 # r5, r4, r6
      jr $ra # r31