{1. Una empresa posee un archivo con información de los ingresos percibidos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez.}

program ej1;
const
	valoralto = -1;
type
	empleado = record
		codigo: integer;
		nombre: string;
		monto: real;
	end;

	archivo = file of empleado;
procedure crearArchivo(var arc: archivo; var carga: text);
var
	nombre: string;
	emp: empleado;
begin
	writeln('Ingrese un nombre del archivo a crear');
	readln(nombre);
	assign(arc, nombre);
	reset(carga);
	rewrite(arc);
	while (not eof(carga)) do begin
		with emp do begin
			readln(carga, codigo, monto, nombre);
			write(arc, emp);
		end;
	end;
