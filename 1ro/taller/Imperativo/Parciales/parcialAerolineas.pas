{
 Aerolíneas Argentinas necesita procesar los pasajes vendidos durante 2023. De cada pasaje se conoce el código de vuelo, código del cliente, código ciudad destino y monto del pasaje.

a) Implementar un módulo que lea pasajes, genere y retorne una estructura adecuada para la búsqueda por código de ciudad destino, 
donde para cada código de ciudad destino se almacenan juntos todos los pasajes (código de vuelo, código de cliente y monto del pasaje). 
La lectura finaliza con el monto de pasaje 0. Se sugiere utilizar el módulo leerPasaje().

b) Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino y retorne todos los pasajes hacia esa ciudad destino.

c) Realizar un módulo que reciba la estructura generada en a) y retorne el código de ciudad de destino con mayor cantidad de pasajes vendidos.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c
   
   
}


program parcialAerolineas;
type
	pasaje = record
		codVuelo: integer;
		codCliente: integer;
		codCiudad: integer;
		monto: real;
	end;
	
	pasajeSinCiudad = record
		codVuelo: integer;
		codCliente: integer;
		monto: real;
	end;
	
	lista = ^nodoL;
	
	nodoL = record
		dato: pasajeSinCiudad;
		sig: lista;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		codCiudad: integer;
		dato: lista;
		HI: arbol;
		HD: arbol;
	end;

procedure leerPasaje (var p: pasaje);
begin
	p.monto:= random (9999)/(random (10)+1);
	if (p.monto <>0) then begin
		p.codVuelo:= random (7000);
		p.codCliente:= random (100)+1;
		p.codCiudad:= random (500)+1;
	end;
end;

procedure cargarLista (var l: lista; psc: pasajeSinCiudad); 
var
	aux: lista;
begin
	new (aux);
	aux^.dato:= psc;
	aux^.sig:= l;
	l:= aux;
end;


procedure cargarArbol (var a: arbol; p: pasaje);
var
	psc: pasajeSinCiudad;
	l: lista;
begin
	if (a =nil) then begin
		new (a);
		a^.codCiudad:= p.codCiudad;
		psc.codVuelo:= p.codVuelo;
		psc.codCliente:= p.codCliente;
		psc.monto:= p.monto;
		l:= nil;
		cargarLista (l, psc);
		a^.dato:= l;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else begin
		if (p.codCiudad = a^.codCiudad) then begin
			psc.codVuelo:= p.codVuelo;
			psc.codCliente:= p.codCliente;
			psc.monto:= p.monto;
			cargarLista (a^.dato, psc);
		end
		else if (p.codCiudad < a^.codCiudad) then
			cargarArbol (a^.HI, p)
		else
			cargarArbol (a^.HD, p);
	end;
end;


procedure cargarDatos (var a: arbol);
var
	p: pasaje;
begin
	a:=nil;
	leerPasaje (p);
	while (p.monto <> 0) do begin
		cargarArbol (a,p);
		leerPasaje (p);
	end;
end;

procedure imprimirNodo (l: lista);
begin
	if (l <> nil) then begin
		imprimirNodo (l^.sig);
		writeln ('Codigo de vuelo ', l^.dato.codVuelo,', correspondiente al cliente ', l^.dato.codCliente,' , por un monto de :', l^.dato.monto:0:2, ' pesos');
		writeln ('---------------------');
		writeln;
	end;
end;


procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol (a^.HI);
		writeln ('///////////////////////////////////////');
		writeln ('Codigo de ciudad ', a^.codCiudad);
		writeln;
		writeln;
		writeln;
		writeln ('||||||');
		imprimirNodo (a^.dato);
		writeln; 
		writeln;
		imprimirArbol (a^.HD);
	end;
end;



procedure buscarCiudad (a: arbol; cod: integer);
begin
	if (a <> nil) then begin
		if (cod < a^.codCiudad) then
			buscarCiudad (a^.HD, cod)
		else if (cod > a^.codCiudad) then
			buscarCiudad (a^.HI, cod)
		else
			imprimirNodo (a^.dato);
	end;
end;


procedure ingresoDeDatos (a: arbol);
var
	cod: integer;
begin
	writeln ('/////////////////////////////////////////');
	writeln ('Ingrese un codigo de ciudad a buscar: ');
	readln (cod);
	buscarCiudad (a, cod);
	writeln;
end;


function recorrerLista (l: lista): integer;
begin
	if (l = nil) then
		recorrerLista:= 0
	else
		recorrerLista:= recorrerLista (l^.sig)+1;
end;


procedure codigoMasVentas (a: arbol; var masVentas, max, actual: integer);
begin
	if (a <> nil) then begin
		codigoMasVentas (a^.HI, masVentas, max, actual);
		actual:= recorrerLista (a^.dato);
		if (actual > max) then begin
			max:= actual;
			MasVentas:= a^.codCiudad;
		end;
		codigoMasVentas (a^.HD, masVentas, max, actual);
	end;
end;


procedure masVendidos (a: arbol);
var
	masVentas, max, actual: integer;
begin
	max:= -1;
	MasVentas:= 0;
	writeln ('/////////////////////////////////////////');
	CodigoMasVentas (a, masVentas, max, actual);
	writeln ('El destino con mas pasajes vendidos fue el correspondiente a la ciudad de codigo: ', masVentas,' con un total de ', max, ' pasajes vendidos.');
end;


VAR
	a: arbol;
BEGIN
	randomize;
	cargarDatos (a);
	if (a <> nil) then begin
		imprimirArbol (a);
		ingresoDeDatos (a);
		masVendidos (a);
	end
	else 
		writeln ('Lista vacia');
END.

