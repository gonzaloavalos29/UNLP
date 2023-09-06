program ejercicio6;
type
	rangoNum = 0..9999; {rango de numero ingresado realista}
	microprocesador = record
		marca, linea: string;
		nucleos, vel, precio: rangoNum;
	end;
procedure leerMicro(var m: microprocesador); {Lee la información del micro y lo devuelve}
	begin
		write('Ingrese la marca: '); readln(m.marca);
		write('Ingrese la línea: '); readln(m.linea);
		write('Ingrese la cantidad de núcleos que posee: '); readln(m.nucleos);
		write('Ingrese la velocidad del reloj: '); readln(m.vel);
		write('Ingrese el tamanio en nanometros: '); readln(m.precio);
	end;
procedure infoRelevanteMp(m: microprocesador; var cantEsp: integer);
	begin
		if (m.nucleos > 1) and (m.vel >= 2) and ((m.marca = 'Intel') or (m.marca = 'AMD')) then begin
			cantEsp:= cantEsp + 1;
		end;
		if (m.nucleos > 1) and (m.vel >= 2) and ((m.marca = 'Intel') or (m.marca = 'AMD')) then begin
			cantEsp:= cantEsp + 1;
		end;
	end;
procedure procesarMarca(var cantEsp, cantProd: integer; var marcaProd: string; var terminar: boolean);
	var
		marcaActual: string;
		mp: microprocesador;
	begin
		cantProd:= 0;
		marcaProd:= '';
		leerMicro(mp);
		marcaActual:= mp.marca;
		while (mp.marca = marcaActual) and (mp.nucleos <> 0) do begin
			writeln('Print en 33');
			infoRelevanteMp(mp, cantEsp);
			marcaProd:= mp.marca;
			writeln('Print en 39');
			if (mp.precio = 14) then begin
				cantProd:= cantProd + 1;
			end;
			leerMicro(mp);
		end;
		if (mp.nucleos = 0) then begin
			terminar:= false;
		end;
	end;
procedure actualizarMax(cantProd: integer; marcaProd: string; var cantMax1, cantMax2: integer; var marcaMax1, marcaMax2:
string);
	begin
		if (cantProd > cantMax1) then begin
			cantMax2:= cantMax1;
			marcaMax2:= marcaMax1;
			cantMax1:= cantProd;
			marcaMax1:= marcaProd;
		end
		else begin
			cantMax2:= cantProd;
			marcaMax2:= marcaProd;
		end;
	end;
var
	terminar: boolean;
	marcaProd, marcaMax1, marcaMax2: string;
	cantEsp, cantProd, cantMax1, cantMax2: integer;
begin
	cantMax1:= -1; cantMax2:= -1; cantProd:= 0; cantEsp:= 0;
	marcaMax1:= ''; marcaMax2:= ''; marcaProd:= '';
	terminar:= true;
	while (terminar) do begin
		procesarMarca(cantEsp, cantProd, marcaProd, terminar);
		actualizarMax(cantProd, marcaProd, cantMax1, cantMax2, marcaMax1, marcaMax2);
		writeln('Pasando a leer otra marca... ');
		writeln;
	end;
	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm son ', marcaMax1,' y ', marcaMax2);
	write('Hubo un total de ', cantEsp, ' procesadores multicore de Intel o AMD con relojes de velocidades de a lo sumo 2 GHZ');
end.
