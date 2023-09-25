{El Correo Argentino necesita procesar los envíos entregados durante el mes de Agosto de 2023. 
De cada envío se conoce el código de cliente, día, código postal y peso del paquete.

 a) Implementar un módulo que lea envíos, genere y retorne una estructura adecuada para 
 la búsqueda por código postal, donde para cada código postal se almacenen juntos todos 
 los envíos (código de cliente, día y peso del paquete). 
 
 La lectura finaliza con peso de paquete 0. Se sugiere utilizar el módulo leerEnvio ().
 
 b) Implementar un módulo que reciba  la estructura generada en a) y un código postal, 
 y retorne todos los envíos de dicho código postal.
 
 c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y 
 retorne los dos códigos de cliente correspondientes al envío con mayor y menor peso.
 
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

program parcial;

const
	corte = 0;
	
type
	t_dias = 1..30; // Subrango diasssss
	envio = record // Para la lectura
		codigo_cliente: integer;
		dia: t_dias;
		codigo_postal: integer;
		peso: integer;
	end;
	
	envioReducido = record // Para el arbol
		codigo_cliente: integer;
		dia: t_dias;
		peso: integer;
	end;
	
	listaEnvios = ^nodoEnvio;
	nodoEnvio = record
		dato: envioReducido;
		sig: listaEnvios;
	end;
	
	elemArbol = record // Registro para el árbol
		codigo_postal: integer;
		lis: listaEnvios;
	end;

	arbol = ^nodoArbol;
	nodoArbol = record
		elem: elemArbol;
		HI: arbol;
		HD: arbol;
	end;

procedure leerEnvio(var env: envio);
begin
	write('Introducir peso de paquete >'); readln(env.peso);
	if (env.peso <> corte) then begin
		env.codigo_cliente:= Random(100)+1; writeln('Generar código de cliente: ', env.codigo_cliente);
		env.dia:= Random(30)+1; writeln('Generar dia: ', env.dia);
		env.codigo_postal:= Random(15)+1; writeln('Generar codigo postal: ', env.codigo_postal);
	end;
end;	
procedure agregarAdelante(var l: listaEnvios; env: envio);
var
	nue: listaEnvios;
begin
	new(nue);
	nue^.dato.codigo_cliente:= env.codigo_cliente; // Le pasamos el registro
	nue^.dato.dia:= env.dia; // Le pasamos el registro
	nue^.dato.peso:= env.peso; // Le pasamos el registro;
	nue^.sig:= l;
	l:= nue;
end;

procedure agregarArbol(var arb: arbol; env: envio);
begin
	if (arb = nil) then begin
		new(arb);
		arb^.elem.codigo_postal:= env.codigo_postal;
		// Inicializar la lista y agregar el primer nodo
		arb^.elem.lis:= nil;
		agregarAdelante(arb^.elem.lis, env);
		arb^.HI:= nil;
		arb^.HD:= nil;
	end else begin
		if (arb^.elem.codigo_postal > env.codigo_postal) then begin
			agregarArbol(arb^.HI, env);
		end else if (arb^.elem.codigo_postal < env.codigo_postal) then begin
			agregarArbol(arb^.HD, env);
		end else begin // Si el código coincide
			agregarAdelante(arb^.elem.lis, env);
		end;
	end;
end;

procedure cargarArbol(var arb: arbol);
var
	env: envio;
begin
	leerEnvio(env);
	while (env.peso <> corte) do begin
		agregarArbol(arb, env);
		writeln; // Dejar un espacio solo apra leer en consola
	end;
end;

// Punto B
procedure puntoB(arb: arbol; codPos: integer; var l2: listaEnvios);
begin
	if (arb <> nil) then begin
		if (arb^.elem.codigo_postal = codPos) then begin // Comprobar si el código postal es el mismo
			l2:= arb^.elem.lis; // Asignarle la lista del código postal
		end else if (arb^.elem.codigo_postal > codPos) then begin // Si es menor ir a la izquierda
			puntoB(arb^.HI, codPos, l2);
		end else begin
			puntoB(arb^.HD, codPos, l2);
		end;
	end;
end;

// Módulos para imprimir
procedure imprimirLista(lis: listaEnvios);
begin
	while (lis <> nil) do begin
		writeln('Codigo cliente: ', lis^.dato.codigo_cliente, ' / peso: ', lis^.dato.peso, ' / dia: ', lis^.dato.dia);
		lis:= lis^.sig;
	end;
end;

procedure imprimirArbol(arb: arbol);
begin
	if (arb <> nil) then begin
		imprimirArbol(arb^.HI);
		writeln('CODIGO POSTAL: ', arb^.elem.codigo_postal);
		imprimirLista(arb^.elem.lis);
		imprimirArbol(arb^.HD);
	end;
end;

// PUNTO C
procedure puntoC(l2: listaEnvios; var peso1, peso2, codMin, codMax: integer); // MODULO RECURSIVO
begin
	// Inicializar valores
	peso1:= -1;
	peso2:= 9999;
	
	if (l2 <> nil) then begin
		// Actualizamos valor máximo
		if (l2^.dato.peso > peso1) then begin
			peso1:= l2^.dato.peso;
			codMax:= l2^.dato.codigo_cliente;
		end;
		// Actualizamos valor mínimo
		if (l2^.dato.peso < peso2) then begin
			peso2:= l2^.dato.peso;
			codMin:= l2^.dato.codigo_cliente;
		end;
		// Pasamos al siguiente elemento
		puntoC(l2^.sig, peso1, peso2, codMin, codMax);
	end;
end;


// Programa principal
VAR
	arb: arbol;
	l2: listaEnvios;
	codMax, codMin, peso1, peso2, numInput: integer;
BEGIN
	Randomize;
	l2:= nil;
	numInput:= 0;
	peso1:= -1;
	peso2:= 9999;
	codMax:= -1;
	codMin:= 9999;
	
	// PUNTO A
	cargarArbol(arb);
	imprimirArbol(arb);
	
	// PUNTO B
	write('Ingresar un codigo postal: '); readln(numInput);
	puntoB(arb, numInput, l2);
	imprimirLista(l2);
	
	// PUNTO C
	puntoC(l2, peso1, peso2, codMin, codMax);
	writeln('El codigo con menor peso es el ', codMin, ' y el codigo con mayor peso es el ', codMax);
END.
