// Se leen datos de empleados de una empresa multinacional. De cada empleado se  conoce su código de empleado
// (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la antigüedad en años y el sueldo bruto en
// dólares. La lectura finaliza al ingresar el código de empleado 1, el cual debe procesarse.
// Realizar un programa que procese la información de los empleados, e informe:
// 1. El país con mayor cantidad de empleados.
// 2. La cant de empleados de más de 10 años de antigüedad cuyo sueldo bruto no alcance los 1500 dólares.
// 3. Los códigos de los empleados que cobran el mejor sueldo en cada país.

// Se lee información de teclado y sin orden.

program ejercicio1;
const
	cant_empleados = 2000;
	cant_paises = 25;
type
	codigos_empleados = 1..cant_empleados;
	codigos_paises = 1..cant_paises;
	
	empleado = record
		codigo: codigos_empleados;
		pais: codigos_paises;
		antiguedad: integer;
		sueldo: real;
	end;
	
	info_sueldo = record
		codigo: codigos_empleados;
		sueldo: real;
	end;
	
	vector_paises = array [codigos_paises] of integer;
	vector_sueldos = array [codigos_paises] of info_sueldo;
	
procedure inicializarVectores(var v: vector_paises; var sueldos: vector_sueldos);
var
	i: codigos_paises;
begin
	for i:= 1 to cant_paises do
	begin
		v[i]:= 0;
		sueldos[i].sueldo:= -1;
	end;
end;

procedure leerEmpleado(var e: empleado);
begin
	readln(e.codigo);
	readln(e.pais);
	readln(e.antiguedad);
	readln(e.sueldo);
end;

function cumple(e: empleado): boolean;
begin
	cumple:= (e.antiguedad > 10) and (e.sueldo < 1500);
end;

procedure actualizarMaximo(var max: info_sueldo; cod: codigos_empleados; sueldo: real);
begin
	if (sueldo > max.sueldo) then
		max.sueldo:= sueldo;
		max.codigo:= cod;
end;

function maxPais(v: vector_paises): codigos_paises;
var
	i, max_cod_pais: codigos_paises;
	max_cant: integer;
begin
	max_cant:= -1;
	for i:= 1 to codigos_paises do begin
		if (v[i] > max_cant) then begin
			max_cant:= v[i];
			max_cod_pais:= i;
		end;
	end;
	maxPais:= max_cod_pais;
end;

procedure procesarDatos(var v: vector_paises; var sueldos: vector_sueldos; var cantEmp: integer);
var
	e: empleado;
begin
	repeat
		leerEmpleado(e)
		v[e.pais]:= v[e.pais] + 1; // empleados por país
		if (cumple(e)) then
			cantEmp:= cantEmp + 1;
		actualizarMaximo(sueldos[e.pais], e.codigo, e.sueldo);
	until (e.codigo = 1);
end;

procedure imprimirCodigosPorPais(v: vector_sueldos);
var
	i: codigos_paises;
begin
	for i:= 1 to cant_paises do
		writeln('En el pais ', i, ' el codigo de empleado con mejor sueldo es ', v[i].codigo);
end;
	
var
	empleadosPais: vector_pais;
	mejoresSueldos: vector_sueldos;
	cantEmpleados: integer;
begin
	inicializarVectores(empleadosPais, mejoresSueldos);
	cantEmpleados:= 0;
	procesarDatos(empleadosPais, mejoresSueldos, cantEmpleados);
	writeln('El pais con mayor empleados es ', maxPais(empleadosPais);
	imprimirCodigosPorPais(mejoresSueldos);
	writeln('La cant. de empleados con más de 10 anios de antigüedad cuyo sueldo bruto no alcance los
	'1500 dólares es: ', cantEmpleados);
end.
