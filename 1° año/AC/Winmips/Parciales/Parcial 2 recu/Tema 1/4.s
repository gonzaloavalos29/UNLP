.data
CONTROL: .word 0x10000
DATA: .word 0x10008
PUNTO: .ascii "."
CADENA: .asciiz ""
.code
            daddi $sp, $0, 0x400 ; inicializo la pila
            ld $s0, CONTROL($0) ; $s0 = CONTROL
            ld $s1, DATA($0) ; $s1 = DATA
            daddi $a0, $0, CADENA ; $s2 = direccion de CADENA
            jal LEER ; llamo a LEER
            nop
            jal CAMBIAR
            sd $s2, 0($s1)
            daddi $t6, $0, 4
            sd $t6, 0($s0)
            halt

LEER:       daddi $sp, $sp, -8 ; hago lugar en la pila
            sd $a0, 0($sp) ; guardo en la pila $a0
            dadd $t0, $0, $a0 ; $t0 = $a0. Libero $a0
            daddi $t1, $0, 9 ; $t1 = 9
            ld $t2, PUNTO($0)
loop:       beq $a0, $t2, salir
            sd $t1, 0($s0) ; mando un 9 a CONTROL
            ld $a0, 0($s1)
            sb $a0, 0($t0) ; guardo el byte de ch en la posicion $t0 de CADENA
            daddi $t0, $t0, 1
            j loop 
salir:      ld $a0, 0($sp) ; recupero de la pila $a0
            daddi $sp, $sp, 8 ; restauro la pila a su valor original
            jr $ra

CAMBIAR:    daddi $sp, $sp, -16 ; hago lugar en la pila
            sd $a0, 0($sp) ; guardo en la pila $a0
            sd $ra, 8($sp) ; guardo $ra en la pila
            dadd $t0, $0, $a0 ; $t0 = $a0. Libero $a0
bucle:      lbu $a0, 0($t0) ; cargo el byte del ch en $a0
            beqz $a0, fin
            jal ES_MAYUSCULA
            beqz $v0, sig ; si es minuscula u otro char salto al char siguiente
            daddi $a0, $0, 0x20 ; paso el ch a minuscula
            sb $a0, 0($t0) ; actualizo el ch en la cadena
sig:        daddi $t0, $t0, 1
            j bucle
fin:        ld $a0, 0($sp) ; rescato $a0 de la pila
            ld $ra, 8($sp) ; rescato $ra de la pila
            daddi $sp, $sp, 16 ; restauro la pila al valor original
            jr $ra


ES_MAYUSCULA:   daddi $v0, $0, 0 ; $v0 = 0
                slti $t1, $a0, 0x41 ; A mayus
                bnez $t1, end
                slti $t1, $a0, 0x5b
                beqz $t1, end
                daddi $v0, $0, 1 
end:            jr $ra