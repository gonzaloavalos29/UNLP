procedure agregarAlFinal(var p, u: lista; contenido: string); //Agrega un último elemento a la lista
    var
        nuevo_p: lista;
    begin
        new(nuevo_p); //GENERAR UNA NUEVA DIRECCIÓN PARA P
        nuevo_p^.contenido:= contenido;
        nuevo_p^.siguiente:= nil;
        if (p = nil) then begin // EVALÚO SI LA LISTA ESTÁ VACÍA.
            p:= nuevo_p; 
            u:= nuevo_p;
        end else begin
            u^.siguiente:= nuevo_p;
            u:= nuevo_p; // ACTUALIZO EL SIGUIENTE DEL ÚLTIMO NODO Y AL ÚLTIMO NODO.
        end;
    end;
procedure insertarNodo(var l: lista2; c: critica); //Insertar nodos de manera ordenada "la información viene ordenada por código de película"
    var
        aux, ant, act: lista2;
    begin
        new(aux);
        aux^.data:= c;
        aux^.sig:= nil;
        if (l = nil) then begin
            l:= aux;
        end else begin
            act:= l;
            ant:= l;
            while (act <> nil) and (act^.data.codigo < aux^.data.codigo) do begin //Encontrar la posición deseada
                ant:= act; //A anterior, asignarle la dirección de memoria del actual
                act:= act^.sig; //A actual, asignarle la dirección de memoria del siguiente
            end;
            if (ant = act) then begin //Si ninguno de los dos nodos se movieron de posición (están en la primera posición)...
                aux^.sig:= l;
                l:= aux;
            end else begin //Si no...
                ant^.sig:= aux;
                aux^.sig:= act;
            end;
        end;
    end;
procedure agregarNodo(var l: lista; e: empresa);
	var
		aux: lista;
	begin
		new(aux);
		aux^.data:= e;
		aux^.sig:= nil;
		if (l <> nil) then
			aux^.sig:= l;
		l:= aux;
	end;
