					.data
				A:      .word 0
				RES:	.word 0
					.code
					daddi r1,r0,0
					daddi r2,r0,0
				loop: 	ld r3,A(r1)
      					dadd r2,r2,r3
      					daddi r1,r1,8
      					bnez r3, loop
					sd r2, RES(r0)
					halt

