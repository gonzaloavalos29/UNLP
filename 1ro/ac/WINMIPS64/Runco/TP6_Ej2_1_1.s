			.data
		A:	.word 0
;
			.code
			daddi r1,r0,5
			daddi r2,r0, 7
			slt r3, r1, r2
			daddi r1,r0,1
			and r4, r3, r1
			daddi r1, r0, 8
			sd r4, A(r1)
			halt

		