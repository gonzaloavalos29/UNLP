program ejercicio6;
const
	fin = 'GAIA';
type
	rangoEspectro = 1..7;
	sonda = record
		nombre: string;
		duracion: integer;
		costoC: real;
		costoM: real;
		EE: rangoEspectro; // Rango de espectro electromagnético
	end;
	lista = ^nodo;
	nodo = record
		dato: sonda;
		sig: lista;
	end;
	vectorSondas = array[rangoEspectro] of integer;
	
procedure leerSonda(var s: sonda);
begin
	writeln('Ingrese nombre: '); readln(sonda.nombre);
	writeln('Ingrese duracion: '); readln(sonda.duracion);
	writeln('Ingrese el costo de construccion: '); readln(sonda.costoC);
	writeln('Ingrese el costo de mantenimiento: '); readln(sonda.costoM);
	writeln('Ingrese el rango de espectro electromagnetico: '); readln(sonda.EE);
end;

