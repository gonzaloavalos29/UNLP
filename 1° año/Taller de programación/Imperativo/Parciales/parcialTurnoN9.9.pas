{
parcial 9.9 turno N
   
   
}


program LuceroGauna;
type
	atencion= record
		mm: integer;
		dniPac: integer;
		mes: 1..12;
		diag: string;
	end;
	atencionA = 	record
		dni: integer;
		codDiag: string;
	end;
	arbol=^nodo;
	nodo= record
		dato: atencionA;
		hi, hd: arbol;
	end;
	vec= array [1..12] of arbol;
procedure leer(var a: atencion);
begin
writeln('matricula medico'); readln(a.mm);
if a.mm <> 0 then begin
writeln('dni paciente'); readln(a.dniPac);
writeln('mes '); a.mes:= random(12 - 1 + 1);
writeln('diagnostico'); readln(a.diag);
end;
end;
procedure agregarA(var a: arbol; dn: integer; diag: string);
begin
	if (a= nil) then begin
		new (a);
		a^.dato.dni:= dn;
		 a^.dato.codDiag:= diag;
		a^.hi:= nil; a^.hd:= nil;
	end
	else begin if (a^.dato.dni > dn) then
		agregarA(a^.hi, dn, diag)
	else
		agregarA(a^.hd, dn, diag); //los repetidos por defecto van a la derecha
	end;
end;
procedure cargarv (var v: vec);
var a: atencion;
begin
	leer(a);
	while a.mm<> 0 do begin
		agregarA (v[a.mes], a.dniPac, a.diag);
		leer(a);
	end;
end;
procedure inicializar (var v: vec);
var i: integer;
begin
	for i:= 1 to 12 do
		v[i]:= nil;
end;
function cuentoCant (a: arbol): integer;
var c: integer;
begin
	if a = nil then
		c:= 0
	else begin
	c:= cuentoCant (a^.hi) ;
	c:= c + 1;
	 c:= c + cuentoCant(a^.hd);
	end;
 cuentoCant:= c;
end;
procedure mesMax (i: integer; v: vec; var max: integer; var mesM: integer);
begin
	if (i <> 0) then begin
		mesMax(i-1, v, max, mesM);
		if (cuentoCant(v[i]) > max) then begin
			writeln('el arbol del mes', i, 'tiene', cuentoCant(v[i]));
			max:= cuentoCant(v[i]);
			mesM:= i;
		end;
	end;
end;
function buscarEnArbol (a: arbol; dni: integer): boolean;
var estoy: boolean;
begin
	if (a = nil) then 
		estoy:= false
	else begin
	 if (a^.dato.dni = dni) then
		estoy:= true
	else if (a^.dato.dni > dni) then
		estoy:= buscarEnArbol (a^.hi, dni)
	else 
		estoy:= buscarEnArbol (a^.hd, dni)
	end;
	buscarEnArbol:= estoy;
end;
function esta (v: vec; dni: integer): boolean;
var
 i: integer; ok: boolean;
begin
	i:= 1;
	ok:= false;
	while (i<= 12) and (not ok) do begin
		ok:= buscarEnArbol (v[i], dni);
		i:= i + 1;
	end;
	esta:= ok;
end;
procedure imprimirA (a: arbol);
begin
	if a<> nil then begin
		imprimirA(a^.hi);
		writeln('dni ', a^.dato.dni);
		writeln('cod diag ', a^.dato.codDiag);
		imprimirA(a^.hd);
	end;
end;
procedure imprimir (v: vec);
var i: integer;
begin
	for i:= 1 to 12 do begin
		writeln('datos del mes:', i);
		imprimirA (v[i]);
		end;
end;
var 
v: vec;
 df, max, mes, dnipac: integer; 
 ok: boolean;
BEGIN
inicializar (v);
cargarv (v);
max:= -1;
df:= 12;
imprimir(v);
mesMax(df,v, max, mes);
writeln('el mes con mas pacientes fue ',mes);
writeln('leer dni pac '); readln(dnipac);
ok:= esta (v, dnipac);
writeln('se encontro el paciente ',ok);
	
END.

