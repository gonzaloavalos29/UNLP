.data
result: .word 0

.code
daddi $a0, $0, 10
daddi $a1, $0, 20
jal sumar
sd $v0, result($zero)
halt

sumar: dadd $v0, $a0, $a1
       jr $ra