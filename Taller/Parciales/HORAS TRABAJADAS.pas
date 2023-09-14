{ *
* Una empresa desea procesar la información de las horas trabajadas por sus empleados durante 2021. Para ello, la empresa posee registros de las horas trabajadas por cada empleado. Cada registro consta del número de empleado, día, mes y la cantidad de horas trabajadas (a lo sumo 8) para dicho día y mes.
* a) Realizar un módulo que lea la información de los empleados y retorne estructura de datos con todos los registros leídos. La estructura debe ser eficiente para la búsqueda por número de empleado. La lectura finaliza al ingresar un registro con día 0. Se sugiere utilizar el módulo leerRegistro ().
* b) Realizar un módulo que reciba la estructura generada en a) y dos números de empleados X e Y, y retorne todos los registros de horas trabajadas por empleados cuyos números estén entre X e Y (incluidos).
* c) Realizar un módulo recursivo que reciba la estructura generada en b) y retorne la cantidad total de horas trabajadas.
type
* }
program parcial_1;
type
	dias = 1..31;
	meses = 1..12;
	rangoHoras = 1..8;
	registro = record
		numero: integer;
		dia: dias;
		mes: meses;
		horas: rangoHoras;
	end;
    
    arbol = ^nodo;
    
    nodo = record
        dato: registro;
        HI: arbol;
		HD: arbol;
    end;
    
procedure leerRegistro(var r: registro);
begin
    r.numero:= Random(101);
    if (r.numero <> 0) then begin
        r.numero:= 500 + r.numero;
        r.dia:= 1 + Random(31);
        r.mes:= 1 + Random(12);
        r.horas:= 1 + Random(8);
    end;
end;

procedure agregarAlVector(var v: vector; var dimL: integer; elem: registro);
begin
	if (dimL < dimF) then begin
		dimL:= dimL + 1;
		v[dimL]:= elem;
	end;
end;

procedure agregar(var a: arbol; r: registro);
begin
    if (a = nil) then begin
        new(a);
        a^.dato:= r;
        a^.hi:= nil;
        a^.hd:= nil;
    end
    else if (a^.dato.numero > r.numero) then
        agregar(a^.HI, r)
    else
        agregar(a^.HD, r);
end;

procedure imprimir(a: arbol);
begin
    if(a <> nil) then begin
        imprimir(a^.hi);
            writeln;
            writeln('-------------Numero de empleado-------- ', a^.dato.numero);
            writeln;
            writeln('Mes: ', a^.dato.mes);
            writeln('Dia: ', a^.dato.dia);
            writeln('Horas trabajadas: ', a^.dato.horas);
        imprimir(a^.hd);
    end;
end;

procedure armarArbol(var a: arbol);
var
    r: registro;
    dia: integer;
begin
    dia:= -1;
    while (dia <> 0) do begin
        leerRegistro(r);
        dia:= r.dia;
        if (dia <> 0) then
            agregar(a, r);
    end;
end;

/////////////////INCISO B//////////////////
procedure rango(a: arbol; var a2: arbol);
    procedure nuevoArbol(var a2: arbol; a: arbol; x, y: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.numero >= x) then
				nuevoArbol(a2, a^.HI, x, y);
			if (a^.dato.numero >= x) and (a^.dato.numero <= y) then
				agregar(a2, a^.dato);
			if (a^.dato.numero <= y) then
				nuevoArbol(a2, a^.HD, x, y);
		end;
	end;
var
    x, y: integer;
begin
    writeln('Ingrese un rango');
    readln(x);
    readln(y);
    nuevoArbol(a2, a, x, y);
    imprimir(a2);
end;

/////////////////INCISO C//////////////////
procedure horasTotales(a:arbol);
    function suma(a: arbol): integer;
    begin
        if (a = nil) then
            suma:= 0 
        else begin
            suma:= suma + a^.dato.horas;
            suma:= suma + suma(a^.HI) + suma(a^.HD);
        end;
    end;
begin
    writeln('La horas totales del segundo arbol es ',suma(a));
end;
/////////////////PRINCIPAL/////////////////
var
    a, a2: arbol;
    
begin
    a:= nil;
    a2:= nil;
    randomize;
    armarArbol(a);
    imprimir(a);
    rango(a, a2);
    horasTotales(a2);
end.
