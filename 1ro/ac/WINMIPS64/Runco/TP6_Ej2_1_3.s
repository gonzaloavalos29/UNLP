				.data
			res:	.word 0
				.code 
				daddi r1,r0,4
				daddi r2,r0,3
				daddi r3,r0,0
			loop: 	dadd r3,r3,r2
      				daddi r1,r1,-1
      				bnez r1, loop
				sd r3, res(r0)
				halt

