.data
VEC1:       .word 5,10
VEC2:       .word 0

.code
DADDI                $t0, $0, 0 ; t0 = 0
DADDI                $t1, $0, 2 ; t1 = 2
BUCLE: LD            $t2, VEC1($t0) ; t2 = 5
       DADDI         $t1, $t1, -1   ; t1 = 1
       SD            $t2, VEC2($t0) ; vec2 = 5
       DADDI|        $t0, $t0, 8    ; t0 = 8
       BNEZ          $t1, BUCLE     ; salto
       HALT