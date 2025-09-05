program prueba;
type
	vector = array[0..5] of integer;
	
procedure cargarVector(var v: vector);
begin
	v[0]:= 0;
	v[1]:= 1;
	v[2]:= 2;
	v[3]:= 3;
	v[4]:= 4;
	v[5]:= 5;
end;

procedure imprimirVectorRecursivo(v: vector; dimL: integer);
begin    
     if (dimL > 0) then begin
		writeln('El numero es: ', v[dimL]);
		imprimirVectorRecursivo(v, dimL-1);
	end;
end; 

VAR
	v: vector;
	dimL: integer;
BEGIN
	dimL:= 5;
	cargarVector(v);
	imprimirVectorRecursivo(v, dimL);
END.
