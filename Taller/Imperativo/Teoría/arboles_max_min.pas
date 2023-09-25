program arbolesEnteros;
type
	arbol = ^nodo;
	nodo = record
		dato: integer;
		HI: arbol;
		HD: arbol;
	end;
	
procedure cargarArbol(var a: arbol; num: integer);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= num;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (num <= a^.dato) then
		cargarArbol(a^.HI, num)
	else
		cargarArbol(a^.HD, num);
end;
	
// MANERA RECURSIVA
function minimo(a: arbol): integer;
begin
	if (a^.HI = nil) then
		minimo:= a^.dato
	else
		minimo:= minimo(a^.HI);
end;
function minimoNodo(a: arbol): arbol;
begin
	if (a = nil) then
		minimoNodo:= nil
	else if (a^.HI = nil) then
		minimoNodo:= a
	else
		minimoNodo:= minimoNodo(a^.HI);
end;
// MANERA ITERATIVA
{
function minimo(a: arbol): integer;
begin
	while (a^.HI <> nil) do
		a:= a^.HI;
	minimo:= a^.dato;
end;
function minimoNodo(a: arbol): arbol;
begin
	if (a = nil) then
		minimoNodo:= nil
	else
		while (a^.HI <> nil) do
			a:= a^.HI;
		minimoNodo:= a;
end;
}

// MANERA RECURSIVA
function maximo(a: arbol): integer;
begin
	if (a^.HD = nil) then
		maximo:= a^.dato
	else
		maximo:= maximo(a^.HD);
end;
function maximoNodo(a: arbol): arbol;
begin
	if (a = nil) then
		maximoNodo:= nil
	else if (a^.HD = nil) then
		maximoNodo:= a
	else
		maximoNodo:= maximoNodo(a^.HD);
end;
// MANERA ITERATIVA
{
function maximo(a: arbol): integer;
begin
	while (a^.HD <> nil) do
		a:= a^.HD;
	maximo:= a^.dato;
end;
function maximoNodo(a: arbol): arbol;
begin
	if (a = nil) then
		maximoNodo:= nil
	else
		while (a^.HD <> nil) do
			a:= a^.HD;
		maximoNodo:= a;
end;
}
// DEVUELVE EL BOOLEAN
function buscar(a: arbol; x: integer): boolean;
begin
	if (a = nil) then
		buscar:= false
	else if (a^.dato = x) then
		buscar:= true
	else if (x > a^.dato) then
		buscar:= buscar(a^.HD, x)
	else
		buscar:= buscar(a^.HI, x);
end;
// DEVUELVE EL NODO
function buscarNodo(a: arbol; x: integer): arbol;
begin
	if (a = nil) then
		buscarNodo:= nil
	else if (a^.dato = x) then
		buscarNodo:= a
	else if (x > a^.dato) then
		buscarNodo:= buscarNodo(a^.HD, x)
	else
		buscarNodo:= buscarNodo(a^.HI, x);
end;


VAR
	a: arbol; 
	num: integer;
	min: integer;
	min2: arbol;
{
	max: integer;
	max2: arbol;
}
	bus: arbol;
	ok: boolean;
	x: integer;
BEGIN
	read(num);
	read(x);
	cargarArbol(a, num);
	// DEVUELVE EL VALOR MÍNIMO
	if (a <> nil) then begin
		min:= minimo(a);
		write(min);
	end;
	// DEVUELVE EL NODO QUE CONTIENE EL MÍNIMO
	min2:= minimoNodo(a);
	if (min2 <> nil) then
		write(min2^.dato);
		
	// DEVUELVE EL VALOR MÁXIMO
{	if (a <> nil) then begin
		max:= maximo(a);
		write(min);
	end;
	// DEVUELVE EL NODO QUE CONTIENE EL MÁXIMO
	max2:= maximoNodo(a);
	if (max2 <> nil) then
		write(max2^.dato)
}		
	// DEVUELVE EL VALOR BOOLEAN
	if (a <> nil) then begin
		ok:= buscar(a, x);
		write(ok);
	end;
	// DEVUELVE EL NODO QUE CONTIENE EL BUSCADO
	bus:= buscarNodo(a, x);
	if (bus <> nil) then
		write('Encontró');
	
END.
