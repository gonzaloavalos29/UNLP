{ Archivos – Actualización Maestro-Detalle – Inventario de Insumos de una Farmacia
Una farmacia mantiene información en un archivo maestro sobre sus insumos médicos. El archivo maestro contiene los siguientes campos: Código de insumo, Nombre de insumo, descripción, stock actual, stock mínimo y si requiere receta de archivo o no (la receta de archivo es un adicional que se le hace a las recetas para medicamentos que requieren un control más estricto).
Además, la farmacia registra diariamente en un archivo detalle los insumos vendidos durante el día. El maestro detalle contiene: código de insumo, cantidad vendida, nombre del cliente y domicilio.
Ambos archivos están ordenados por código de insumo.
Requerimientos del programa:
1.	Declarar los tipos de datos necesarios para la gestión de ambos tipos de archivos (registro maestro y detalle).
2.	Implementar un procedimiento que realice la actualización del archivo maestro a partir de los detalles del mes (30 archivos detalle) siguiendo estas reglas.
•	Por cada código de insumo que aparezca en el archivo detalle, se debe descontar del stock actual del maestro la cantidad vendida.
•	Si al actualizar un insumo, su stock actual queda por debajo del stock mínimo, se debe mostrar un mensaje por pantalla indicando que es necesario reponer ese insumo (incluyendo su nombre, descripción, stock actual y mínimo).
•	Además se debe cargar en un archivo de texto (declarado en el procedimiento) los medicamentos y clientes que necesitan receta de archivo. En caso de que el medicamento necesite receta de archivo se carga código de insumo, cantidad vendida, nombre del cliente y domicilio del cliente.
}


const
  valorAlto = 9999;

type
  str30 = string[30];

  tMaestro = record
    codEquipo : integer;
    nombre    : str30;
    jugados   : integer;
    ganados   : integer;
    empatados : integer;
    perdidos  : integer;
    puntos    : integer;
  end;

  tDetalle = record
    codEquipo  : integer;
    fecha      : string[10];
    puntosPart : integer;   { 3=ganó, 1=empató, 0=perdió }
    codRival   : integer;
  end;

  archivoMaestro = file of tMaestro;
  archivoDetalle = file of tDetalle;

  vectorDetalles = array[1..12] of archivoDetalle;
  vectorRegistros = array[1..12] of tDetalle;

{===========================================================}
{ Procedimiento para leer un registro de un detalle o EOF }
procedure leer(var det: archivoDetalle; var dato: tDetalle);
begin
  if not eof(det) then
    read(det, dato)
  else
    dato.codEquipo := valorAlto;
end;

{===========================================================}
{ Devuelve el mínimo (codEquipo más chico) entre los 12 detalles }
procedure minimo(var detalles: vectorDetalles; var regs: vectorRegistros; var min: tDetalle);
var
  i, posMin: integer;
begin
  min.codEquipo := valorAlto;
  for i := 1 to 12 do
    if (regs[i].codEquipo < min.codEquipo) then
    begin
      min := regs[i];
      posMin := i;
    end;
  if (min.codEquipo <> valorAlto) then
    leer(detalles[posMin], regs[posMin]);
end;

{===========================================================}
{ Procedimiento principal: actualiza maestro con los 12 detalles }
procedure actualizarMaestro(var mae: archivoMaestro; var detalles: vectorDetalles);
var
  regs : vectorRegistros;
  min  : tDetalle;
  regM : tMaestro;
  i    : integer;
  puntosAnio, maxPuntos : integer;
  nombreMax : str30;
begin
  reset(mae);
  for i := 1 to 12 do
  begin
    reset(detalles[i]);
    leer(detalles[i], regs[i]);
  end;

  minimo(detalles, regs, min);
  maxPuntos := -1;

  while (min.codEquipo <> valorAlto) do
  begin
    read(mae, regM);
    while (regM.codEquipo <> min.codEquipo) do
      read(mae, regM);

    puntosAnio := 0;

    while (regM.codEquipo = min.codEquipo) do
    begin
      regM.jugados := regM.jugados + 1;
      case min.puntosPart of
        3: regM.ganados   := regM.ganados + 1;
        1: regM.empatados := regM.empatados + 1;
        0: regM.perdidos  := regM.perdidos + 1;
      end;
      regM.puntos := regM.puntos + min.puntosPart;
      puntosAnio  := puntosAnio + min.puntosPart;
      minimo(detalles, regs, min);
    end;

    seek(mae, filepos(mae)-1);
    write(mae, regM);

    if (puntosAnio > maxPuntos) then
    begin
      maxPuntos := puntosAnio;
      nombreMax := regM.nombre;
    end;
  end;

  close(mae);
  for i := 1 to 12 do
    close(detalles[i]);

  writeln('Equipo con más puntos del año: ', nombreMax,
          ' (', maxPuntos, ' puntos)');
end;
