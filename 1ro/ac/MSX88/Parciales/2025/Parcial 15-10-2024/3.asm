ORG 1000H
car_viejo db "a"
car_nuevo db "e"
msj_ing db "Ingrese mensaje:"
msj_si db "Se sustituyeron caracteres."
msj_no db "No se sustituyeron caracteres."
msj db ?

org 3000h
reemplazar: mov dl, 0
sig_car:    
            mov cl, [bx] ; cargar caracter actual en cl
            cmp cl, '.' ; ¿Fin de la cadena?
            jz fin_rutina
            cmp cl, al ; ¿Coincide con car_viejo?
            jnz no_cambia
            mov [bx], ah ; reemplazar por car_nuevo
            mov dl, 1 ; marcar que hubo al menos un cambio

no_cambia:  inc bx
            jmp sig_car
fin_rutina: ret

org 2000h
inicio:
            ; Mostrar mensaje de ingreso
            mov bx, offset msj_ing
            mov al, offset msj_si - offset msj_ing
            int 7
            ; Leer cadena
            mov bx, offset msj
ingresar:   int 6 ; al <- caracter ingresado
            cmp byte ptr [bx], '.' ; ¿Fin?
            jz seguir
            inc bx
            jnz ingresar
            ; preparar argumentos
seguir:     mov al, car_viejo ; caracter a reemplazar
            mov ah, car_nuevo ; nuevo caracter
            mov bx, offset msj
            call reemplazar
            cmp dl, 1
            jnz sin_cambios
        
            mov bx, offset msj_si
            mov al, offset msj_no - offset msj_si
            int 7
            jmp fin

sin_cambios: mov bx, offset msj_no
             mov al, offset msj - offset msj_no
             int 7

fin:  int 0
      end