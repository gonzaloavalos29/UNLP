				.data
			A:	.word 1
			B:	.word 2
			C:	.word 0
;				
				.code
				ld    r1, A(r0)
				ld    r2, B(r0)
				bne   r1, r2, no
    				daddi r3, r0, 1
    				j fin
			no: 	daddi r3,r0, 0
			fin: 	sd r3, C(r0)
				halt
