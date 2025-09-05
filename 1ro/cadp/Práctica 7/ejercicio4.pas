program maternidad;
const
	max_embarazadas = 10000;
type

	vector_embarazadas = array[1..max_embarazadas] of integer; // vector de embarazadas por peso
	
	pacientes = record
		nombre: string;
		apellido: string;
		peso: vector_embarazadas;
	end;

procedure inicializarVector(var v: vector_embarazadas);
var
	i: integer;
begin
	for i:= 1 to 10000 do 
		v[i]:= 0;
end;

procedure cargarVector(var v: vector_embarazadas; var dimL: integer);
var
	num: integer;
begin
	dimL:= 0;
	read(num);
	while ((dimL < max_embarazadas) and (num <> -1)) do begin
		dimL:= dimL + 1;
		v[dimL]:= num;
		read(num);
	end;
end;

procedure sumaVector(v: vector_embarazadas);
var 

procedure leerPaciente(var p: paciente);
begin
	readln(p.nombre);
	readln(p.apellido);
end;

procedure cargarLista(var l: 

{procedure maximos(v: vector_embarazadas; dimL: integer);
var
	i, max1, max2: integer;
begin
	max1:= -1;
	max2:= -1;
	for i:=1 to dimL do begin
		if (v[i] > max1) then begin
			max2:= max1;
			max1:= v[i];
		end else
			max2:= v[i]
		end;
	end;
end;}


