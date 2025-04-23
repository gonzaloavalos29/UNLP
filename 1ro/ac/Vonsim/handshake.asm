IMR   EQU 21H   ; Máscara de interrupciones (Interrupt Mask Register)
EOI   EQU 20H   ; End Of Interrupt - para avisar que se terminó de atender una interrupción
INT2  EQU 26H   ; Registro donde se guarda la dirección de la rutina para INT2
HAND  EQU 40H   ; Puerto de datos (para enviar el carácter)
EST   EQU 41H   ; Puerto de estado (para controlar handshake)
DATO  EQU 40H   ; Alias para HAND
N_HND EQU 10    ; Número de interrupción asociado al handshake (INT 10)

; -------------------------------------------
; Vector de interrupción
; Se guarda la dirección de la rutina en la tabla de vectores
ORG 40
DW RUT_HND      ; INT2 → dirección de RUT_HND

; -------------------------------------------
; Definición del mensaje a enviar
ORG 1000H
MSJ DB "UNIVERSIDAD NACIONAL DE LA PLATA"
FIN DB ?        ; Marca para calcular la longitud del mensaje

; -------------------------------------------
; Programa principal
ORG 2000H

MOV BX, OFFSET MSJ                          ; BX apunta al primer carácter del mensaje
MOV CL, OFFSET FIN - OFFSET MSJ             ; CL guarda la cantidad de caracteres a enviar

CLI                                          ; Deshabilita interrupciones mientras se configura
MOV AL, 0FBH                                 ; 11111011b → Habilita solo INT2 (HANDSHAKE)
OUT IMR, AL

MOV AL, N_HND                                ; N_HND = 10 → número de interrupción
OUT INT2, AL                                 ; Le decís al sistema que INT2 va a usar la rutina en ORG 40

MOV AL, 80H                                  ; 10000000b → activa el bit 7 (modo handshake)
OUT EST, AL                                  ; Se activa el sistema de handshake

STI                                          ; Se vuelven a habilitar las interrupciones

; Bucle de espera mientras se transmiten los caracteres
LAZO:
    CMP CL, 0                                ; ¿Ya se mandaron todos?
    JNZ LAZO                                 ; Si no, sigue esperando

; Apaga el bit de handshake (bit 7 de EST)
IN AL, EST
AND AL, 7FH                                  ; 01111111b → limpia el bit 7 (desactiva handshake)
OUT EST, AL

INT 0                                        ; Termina el programa

; -------------------------------------------
; Rutina de interrupción (cuando el HANDSHAKE lo llama)
ORG 3000H
RUT_HND:
    PUSH AX                                  ; Guarda AX para no perder su valor

    MOV AL, [BX]                             ; Toma el carácter que apunta BX
    OUT DATO, AL                             ; Lo manda por el puerto

    INC BX                                   ; Avanza al siguiente carácter
    DEC CL                                   ; Reduce la cantidad restante

    JNZ FINAL                                ; Si todavía quedan, salta a FINAL sin desactivar interrupciones

    MOV AL, 0FFH                             ; Si ya mandamos todo → deshabilita todas las interrupciones
    OUT IMR, AL

FINAL:
    MOV AL, EOI                              ; Avisamos al PIC que terminó la interrupción
    OUT EOI, AL

    POP AX                                   ; Restaura AX
    IRET                                     ; Retorna de la interrupción

END

