program ProgramaNumAleatorio;
type
	vector = array[0..50] of integer;

procedure cargarVector(var v: vector; max, min: integer);
var
	ale, i: integer;
begin
	ale:= random(max)+min;
	for i:= 0 to 50 do begin
		v[i]:= ale;
		ale:= random(max)+min;
	end;
end;

procedure imprimirVector(v: vector);
var
	i: integer;
begin
	for i:= 50 downto 0 do
		write(v[i], ', ')
end;

VAR 
	max, min: integer;
	v: vector;
begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     
     //ale := random (100); {devuelve un valor aleatorio en el intervalo 0 a 99}
     
     {for i:= 1 to 100 do begin
		writeln(ale);
		ale := random (100);
	 end;

     writeln ('El numero aleatorio generado es: ', ale);
	 }
	 min:= 1;
	 max:= 5;
	 
	 cargarVector(v, max, min);
	 imprimirVector(v);
	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.
