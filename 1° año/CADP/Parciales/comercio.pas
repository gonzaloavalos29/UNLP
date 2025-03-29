program comercio;
const
	fin = -999;
	maxProductos = 2000;
type
	rango_rubro = 1..15;
	r_dia = 1..31;
	r_mes = 1..12;

	producto = record
		nombre: string;
		marca: string;
		rubro: rango_rubro;
	end;
	
	vector_productos = array[1..maxProductos] of producto;
	vector_pedidos = array[1..maxProductos] of rango_rubro;
	
	r_fecha = record
		dia: r_dia;
		mes: r_mes;
		anio: integer;
	end;
	pedido = record
		numero: integer;
		fecha: r_fecha;
		producto: vector_productos;
	end;
	p_pedido = record
		codigo: 1..maxProductos;
		cant_comprada: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: pedido;
		sig: lista;
	end;
	
procedure leerProductos(var v: vector_productos; var dl: integer);
var
	nombre, marca: string;
	rubro: rango_rubro;
begin
	readln(nombre); readln(marca); readln(rubro);
	if (dl <= maxProductos) then begin
		dl:= dl + 1;
		v[dl].nombre:= nombre;
		v[dl].marca:= marca;
		v[dl].rubro:= rubro;
	end;
end;

procedure leerPedidos(var p: pedido; var dl: integer);
begin
	readln(p.numero);
	readln(p.fecha.dia); readln(p.fecha.mes); readln(p.fecha.anio);
	leerProductos(p.producto, dl);
end;

procedure leer_p_pedidos(var p: p_pedido);
begin
	readln(p.codigo);
	readln(p.cant_comprada);
end;

procedure agregarNodo(var l: lista; p: pedido);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l: lista; var dl: integer);
var
	p: pedido;
begin
	dl:= 0;
	leerPedidos(p, dl);
	while (p.numero <> fin) do begin
		agregarNodo(l, p);
		leerPedidos(p, dl);
	end;
end;

procedure imprimirProductosPedidos(l: lista; var v: vector_pedidos; dl: integer);
var
	cant_pedidos: integer;
begin
	while (l <> nil) do begin
		v[l^.dato.producto[dl].rubro]:= v[l^.dato.producto[dl].rubro] + 1;
