{Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.}
program ej1;
const
	dimF= 10;
Type
	vectorChar= Array[1..dimF] of char;
	
	lista=^nodo;
	nodo=record
		dato: char;
		sig: lista;
	end;
	
procedure agregarAdelante(var l: lista; c: char);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= c;
	aux^.sig:= l;
	l:= aux;
end;

procedure leerYCargarL(var l: lista);
var
	c:char;
begin
	write('Ingresar un caracter: ');readln(c);
	if (c <> '.')then begin
		agregarAdelante(l, c);
		leerYCargarL(l);
	end;
end;

procedure imprimirLRec(l: lista);
begin
	if (l <> nil)then begin
		write(l^.dato,' - ');
		imprimirLRec(l^.sig);
	end;
end;

procedure imprimirLRecInverso(l: lista);
begin
	if (l <> nil)then begin
		imprimirLRec(l^.sig);
		write(l^.dato,' - ');
	end;
end;

procedure leerChar(var dimL: integer; var vect:vectorChar);
var
	c: char;
begin
	write('Ingresar caracter: ');readln(c);
	if (c <> '.') and (dimL < dimF)then begin
		dimL:= dimL+1;
		vect[dimL]:= c;
		leerChar(dimL, vect);
	end;
end;

procedure leerYContar(var cont: integer);
var
	c:char;
begin
	write('Ingresar caracter: ');readln(c);
	if (c <> '.')then begin
		cont:= cont+1;
		leerYContar(cont);
	end;
end;

procedure imprimirVec(dimL: integer; vect:vectorChar);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln(vect[i],' se encuentra en la posicion: ',i);
	end;
end;

procedure imprimirVecRec(dimL: integer; vect:vectorChar);
begin
	if (dimL <> 0)then begin
		imprimirVecRec(dimL-1, vect);
		writeln(vect[dimL],' se encuentra en posicion: ',dimL);
	end;
end;

var
	vec: vectorChar;
	dimL, contChar: integer;
	pri: lista;
Begin
	dimL:= 0;
	contChar:= 0;
	pri:= nil;
	leerChar(dimL, vec);
	imprimirVec(dimL, vec);			// Inciso B
	imprimirVecRec(dimL, vec);		// Inciso C
	leerYContar(contChar);
	writeln('Se ingresaron ',contChar,' caracteres.');		// Inciso D
	leerYCargarL(pri);			// Inciso E
	imprimirLRec(pri);			// Inciso F
	imprimirLRecInverso(pri);	// Inciso G
end.
