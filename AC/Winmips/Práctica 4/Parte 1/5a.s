.data
A: .word 3
B: .word 7
S: .word 0
P: .word 0
E: .word 0

.code
LD $at, A($zero) # Cargamos A en r1
LD $v0, B($zero) # Cargamos B en r2
DADD $v1, $at, $v0 # suma: r3 = r1 + r2
SD $v1, S($zero) # almacenamos r3 en S
DMUL $v1, $at, $v0 # multiplicamos: r3 = r1 * r2
DADDI $v1, $v1, 2 # sumamos con valor inmediato: r3 = r3 + 2
SD $v1, P($zero) # almacenamos r3 en P
DMUL $v1, $at, $at # multiplicamos: r3 = r1 * r1
DDIV $v1, $v1, $v0 # dividimos: r3 = r3 / r2
SD $v1, E($ZERO) # almacenamos r3 en E
HALT