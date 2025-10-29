{ Archivos – Actualización Maestro-Detalle – Inventario de Insumos de una Farmacia
Una farmacia mantiene información en un archivo maestro sobre sus insumos médicos. El archivo maestro contiene los siguientes campos: Código de insumo, Nombre de insumo, descripción, stock actual, stock mínimo y si requiere receta de archivo o no (la receta de archivo es un adicional que se le hace a las recetas para medicamentos que requieren un control más estricto).
Además, la farmacia registra diariamente en un archivo detalle los insumos vendidos durante el día. El maestro detalle contiene: código de insumo, cantidad vendida, nombre del cliente y domicilio.
Ambos archivos están ordenados por código de insumo.
Requerimientos del programa:
1.	Declarar los tipos de datos necesarios para la gestión de ambos tipos de archivos (registro maestro y detalle).
2.	Implementar un procedimiento que realice la actualización del archivo maestro a partir de los detalles del mes (30 archivos detalle) siguiendo estas reglas.
•	Por cada código de insumo que aparezca en el archivo detalle, se debe descontar del stock actual del maestro la cantidad vendida.
•	Si al actualizar un insumo, su stock actual queda por debajo del stock mínimo, se debe mostrar un mensaje por pantalla indicando que es necesario reponer ese insumo (incluyendo su nombre, descripción, stock actual y mínimo).
•	Además se debe cargar en un archivo de texto (declarado en el procedimiento) los medicamentos y clientes que necesitan receta de archivo. En caso de que el medicamento necesite receta de archivo se carga código de insumo, cantidad vendida, nombre del cliente y domicilio del cliente.}

program parcialFarmacia;
const
	va = 9999;
	N = 30;
type
	str30 = string[30];
	tMaestro = record
		cod: integer;
		nom: str30;
		desc: str30; // descripción
		stock: integer;
		stockMin: integer;
		receta: boolean;
	end;
	tDetalle = record
		cod: integer;
		cantVend: integer;
		cli: str30;
		dom: str30;
	end;
	maestro = file of tMaestro;
	detalle = file of tDetalle;
	
	detalles = array[1..N] of detalle;
	regDetalle = array[1..N] of tDetalle;
	
procedure leer(var a: detalle; var reg: tDetalle);
begin
	if (not EOF(a)) then
		read(a, reg)
	else
		reg.cod:= va;
end;

procedure asignarArchivos(var mae: maestro; var det: detalles);
var
  i: integer;
  nomArch: str30;
begin
  write('Ingrese nombre del archivo maestro: ');
  readln(nomArch);
  assign(mae, nomArch);
  for i := 1 to N do begin
	write('Ingrese nombre del archivo detalle ', i, ': ');
    readln(nomArch);
    assign(det[i], nomArch);
  end;
end;

procedure minimo(var vDet: detalles; var vRegDet: regDetalle; var min: tDetalle);
var
	posMin, i: integer;
begin
	posMin:= -1; min.cod:= va;
	for i:= 1 to N do begin
		if (vRegDet[i].cod < min.cod) then begin
			min:= vRegDet[i];
			posMin:= i;
		end;
	end;
	if (min.cod <> va) then
		leer(vDet[posMin], vRegDet[posMin]);
end;

procedure procesar(var mae: maestro; var vDet: detalles; var arc: text);
var
	i: integer;
	insumos: regDetalle;
	min: tDetalle;
	rMae: tMaestro;
begin
	assign(arc, 'recetas.txt'); rewrite(arc);
	asignarArchivos(mae, vDet);
	reset(mae);
	for i:= 1 to N do begin
		reset(vDet[i]);
		leer(vDet[i], insumos[i]);
	end;
	minimo(vDet, insumos, min);
	while (min.cod <> va) do begin
		read(mae, rMae);
		while (rMae.cod <> min.cod) do
			read(mae, rMae);
		while (rMae.cod = min.cod) do begin
			if (rMae.stock >= min.cantVend) then begin
				rMae.stock:= rMae.stock - min.cantVend;
				if (rMae.stock < rMae.stockMin) then
					writeln('Es necesario reponer el insumo ', rMae.nom, ', descripción= ', rMae.desc, ', Stock actual= ', rMae.stock, ', Stock minimo= ', rMae.stockMin);
			end else
				writeln('No hay stock suficiente del insumo ', rMae.nom,
						' (Stock disponible: ', rMae.stock,
						', solicitado: ', min.cantVend, ')');
			if rMae.receta then begin
				writeln(arc, 'CodInsumo: ', rMae.cod);
				writeln(arc, 'Cliente: ', min.cli);
				writeln(arc, 'Cantidad vendida: ', min.cantVend);
				writeln(arc, 'Domicilio: ', min.dom);
				writeln(arc, '--------------------------------------');
			end;
			minimo(vDet, insumos, min);
		end;
		seek(mae, filepos(mae)-1);
		write(mae, rMae);
	end;
	close(mae);
	close(arc);
	for i:= 1 to N do
		close(vDet[i]);
	writeln('Actualización completada. Se generó el archivo "recetas.txt".');
end;

VAR
	vDet: detalles;
	arcMae: maestro;
	txt: text;
BEGIN
	procesar(arcMae, vDet, txt);
END.
