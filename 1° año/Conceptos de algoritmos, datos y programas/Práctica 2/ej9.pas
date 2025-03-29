program ejercicio9;
function esPar(numero: integer): boolean; {retorna si el numero es par o no}
	begin
		esPar:= (numero mod 2) = 0;
	end;
procedure leerAlumno(var numeroInscripcion: integer; var apellido, nombre: string); {leer y definir variables de los alumnos}
	begin
		write('Ingrese el número de inscripción: '); readln(numeroInscripcion);
		write('Escriba el apellido del alumno: '); readln(apellido);
		write('Escriba el nombre del alumno: '); read(nombre);
	end;
procedure actualizarDatos(nuevoNumInscr: integer; nuevoApellido, nuevoNombre: string; var apellidoChico1, apellidoChico2, nombreGrande1, nombreGrande2: string; var numeroChico1, numeroChico2, numeroGrande1, numeroGrande2: integer);
	begin
		if (nuevoNumInscr < numeroChico1) then {Si el número de inscripción es menor que NmInsCh1...}
		begin
			apellidoChico2:= apellidoChico1;
			numeroChico2:= numeroChico1;
			apellidoChico1:= nuevoApellido;
			numeroChico1:= nuevoNumInscr
		end
		else if (nuevoNumInscr < numeroChico2) then {y si el número de inscripción es menor que NmInscCh2...}
		begin
			apellidoChico2:= nuevoApellido;
			numeroChico2:= nuevoNumInscr;
		end;
		if (nuevoNumInscr > numeroGrande1) then {si el número de inscripción es mayor que el NmInsGr1...}
		begin
			nombreGrande2:= nombreGrande1;
			numeroGrande2:= numeroGrande1;
			nombreGrande1:= nuevoNombre;
			numeroGrande1:= nuevoNumInscr
		end
		else if (nuevoNumInscr > numeroGrande2) then {y si el número de inscripción es mayor que NmInsGr...}
		begin
			nombreGrande2:= nuevoNombre;
			numeroGrande2:= nuevoNumInscr;
		end;
	end;
var
	numInscr, cantAlum, cantAlumNumInsPar, NmInsCh1, NmInsCh2, NmInsGr1, NmInsGr2: integer;
	n, a, a_NmInsCh1, a_NmInsCh2, n_NmInsGr1, n_NmInsGr2: string;
begin
	cantAlum:= 0;
	cantAlumNumInsPar:= 0;
	NmInsCh1:= 1000; NmInsCh2:= 1000;
	NmInsGr1:= 0; NmInsGr2:= 0;
	a_NmInsCh1:= ''; a_NmInsCh2:= '';
	n_NmInsGr1:= ''; n_NmInsGr2:= '';
	repeat
		leerAlumno(numInscr, a, n); {se leen los datos del alumno por el procedure}
		if (esPar(numInscr)) then {si el número de inscripción es par...}
			cantAlumNumInsPar:= cantAlumNumInsPar + 1;
		actualizarDatos(numInscr, a, n, a_NmInsCh1, a_NmInsCh2, n_NmInsGr1, n_NmInsGr2, NmInsCh1, NmInsCh2, NmInsGr1, NmInsGr2); {se actualizan los datos y se comparan las variables}
		cantAlum:= cantAlum + 1;
	until (numInscr = 1200); {el bloque se repite por última vez cuando el n´mero de inscripción sea el 1200}
	writeln('Apellido del alumno con el número de inscripción más chico: ', a_NmInsCh1);
	writeln('Apellido del alumno con el segundo número de inscripción más chico: ', a_NmInsCh2);
	writeln('Nombre del alumno con el número de inscripción más grande: ', n_NmInsGr1);
	writeln('Nombre del alumno con el segundo número de inscripción más grande: ', n_NmInsGr1);
	write('De ', cantAlum, ' alumnos, el ', ((cantAlumNumInsPar/cantAlum)*100):2:1, '% tienen inscripciones par.');
end.
